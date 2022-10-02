import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/report_model.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vrouter/vrouter.dart';
import '../../loader.dart';
import '../homepage/home_screen.dart';
import 'bloc/report_bloc.dart';
import 'bst_report_model.dart';
import 'campus_hangout_model.dart';
import 'goshthi_report_model.dart';
import 'inner_page/bst_report.dart';
import 'inner_page/bst_report_pages/manage_bst_niyam_assesment.dart';
import 'inner_page/bst_report_pages/manage_report.dart';
import 'inner_page/campus_hangout.dart';
import 'inner_page/campus_hangout_pages/view_hangout.dart';
import 'inner_page/goshthi_report_pages/goshthi_report_all.dart';
import 'inner_page/karyakar_goshti_report.dart';
import 'inner_page/kst_pages/manage_kst_report.dart';
import 'inner_page/kst_report.dart';
import 'inner_page/networking_report.dart';
import 'inner_page/networking_report_pages/networking_report_details.dart';
import 'inner_page/sabha_report.dart';
import 'inner_page/sabha_report_pages/sabha_report_all.dart';
import 'kst_report_model.dart';
import 'networking_report_model.dart';

class Reports extends StatefulWidget {
  static const String id = "report";
  static const String path = "${HomeScreen.path}/$id";

  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  ReportModel? _reportModel;
  List<ReportsListDataModel?>? _reportItems = [];
  int _totalSabhaReports = 0;

  GoshthiReportModel? _goshthiReportModel;
  List<GoshthiDataModel?>? _goshthiReportItems = [];
  int _totalGoshthiReports = 0;

  NetworkingReportModel? _networkingReportModel;
  List<NetworkReportListDataModel?>? _networkingReportItems = [];
  int _totalNetworkingReports = 0;

  BSTReportModel? _bstReportModel;
  List<BSTReportListDataModel?>? _bstReportItems = [];
  int _totalBSTReports = 0;

  KSTReportModel? _kstReportModel;
  List<KSTReportListDataModel?>? _kstReportItems = [];
  int _totalKSTReports = 0;

  CampusHangoutModel? _campusHangoutModel;
  List<CampusHangoutDataModel?>? _campusHangoutItems = [];
  int _totalCampusHangouts = 0;
  int _totalReport = 0;

  //FOR SABHA REPORT FILTERS
  String strRegion = "";
  String strCenter = "";
  String strWing = "";
  String strReportStatus = "";
  // String strYear = "";
  String strSabhaWeek = "";

  //FOR GOSHTHI REPORT FILTERS
  String strSelectedRegion = "";
  String strSelectedCenter = "";
  String strSabhaMonth = Utils().getCurrentDate("MMMM");
  String strSabhaYear = Utils().getCurrentDate("yyyy");
  String strSabhaGender = "";

  //FOR NETWORKING REPORT FILTERS
  String strNTWRKSelectedRegion = "";
  String strNTWRKSelectedCenter = "";
  String strSelectedReportingYear = Utils().getCurrentDate("yyyy");

  //FOR BST REPORT FILTERS
  String strBSTSelectedWing = "";
  String strBSTSelectedCenter = "";
  String strBSTSelectedRegion = "";
  String strBSTSabhaYear = Utils().getCurrentDate("yyyy");

  //FOR BST REPORT FILTERS
  String strKSTSelectedWing = "";
  String strKSTSelectedCenter = "";
  String strKSTSelectedRegion = "";
  String strKSTSelectedYear = Utils().getCurrentDate("yyyy");

  //FOR CAMPUS HANGOUT FILTERS
  String strCHSelectedWing = "";
  String strCHSelectedCampus = "";
  String strCHSelectedRegion = "";
  String strCHSelectedYear =
      (DateTime.now().year - ((DateTime.now().month >= 1 && DateTime.now().month <= 6) ? 1 : 0)).toString();

  //FOR PAGINATION
  int _currentPage = 1;
  static const _pageSize = 50;

  bool _isLoading = false;

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  void _hideLoadingIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    //FOR GET SABHA REPORTS
    BlocProvider.of<ReportBloc>(context).add(ReportEvent.loadReports(context, _currentPage, _pageSize, isForFilter(),
        strRegion, strCenter, strWing, strCHSelectedYear, strSabhaYear, strSabhaMonth, strSabhaWeek, strReportStatus));
  }

  LoadingStatus pageLoadingStatus = LoadingStatus.Initialized;
  @override
  Widget build(BuildContext buildContext) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ReportBloc, ReportState>(
          listener: (context, state) {
            state.maybeWhen(
                empty: (l) {
                  if (l == LoadingStatus.InProgress) {
                    _showLoadingIndicator();
                  }
                },
                loadReports: (reportModel, goshthiReportModel, networkingReportModel, bstReportModel, kstReportModel,
                    campusHangoutModel, loadingStatus) {
                  if (loadingStatus == LoadingStatus.Done) {
                    _hideLoadingIndicator();

                    final isForeground = TickerMode.of(context);
                    if (isForeground) {
                      if (reportModel != null) {
                        if (reportModel.sabha_result != null) {
                          _reportModel = reportModel;
                          _reportItems = _reportModel!.sabha_result!.data;

                          _totalSabhaReports = Utils().nullSafeInt(_reportModel!.sabha_result!.total);
                        }
                      }
                      if (networkingReportModel != null) {
                        if (networkingReportModel.network_list != null) {
                          _networkingReportModel = networkingReportModel;
                          _networkingReportItems = _networkingReportModel!.network_list!.data;
                          _totalNetworkingReports = Utils().nullSafeInt(_networkingReportModel!.network_list!.total);
                        }
                      }
                      if (goshthiReportModel != null) {
                        if (goshthiReportModel.goshthi_result != null) {
                          _goshthiReportModel = goshthiReportModel;
                          _goshthiReportItems = _goshthiReportModel!.goshthi_result!.data;
                          _totalGoshthiReports = Utils().nullSafeInt(_goshthiReportModel!.goshthi_result!.total);
                        }
                      }
                      if (bstReportModel != null) {
                        if (bstReportModel.bst_report_list != null) {
                          _bstReportModel = bstReportModel;
                          _bstReportItems = _bstReportModel!.bst_report_list!.data;
                          _totalBSTReports = Utils().nullSafeInt(_bstReportModel!.bst_report_list!.total);
                        }
                      }
                      if (kstReportModel != null) {
                        if (kstReportModel.kst_result != null) {
                          _kstReportModel = kstReportModel;
                          _kstReportItems = _kstReportModel!.kst_result!.data;
                          _totalKSTReports = Utils().nullSafeInt(_kstReportModel!.kst_result!.total);
                        }
                      }
                      if (campusHangoutModel != null) {
                        if (campusHangoutModel.campus_hangout_list != null) {
                          _campusHangoutModel = campusHangoutModel;
                          _campusHangoutItems = _campusHangoutModel!.campus_hangout_list!.data;
                          _totalCampusHangouts = Utils().nullSafeInt(_campusHangoutModel!.campus_hangout_list!.total);
                        }
                      }
                      _totalReport = _totalSabhaReports +
                          _totalNetworkingReports +
                          _totalBSTReports +
                          _totalKSTReports +
                          _totalGoshthiReports +
                          _totalCampusHangouts;
                    }
                  } else {
                    if (loadingStatus == LoadingStatus.Error) {
                      _hideLoadingIndicator();
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is UpdateDashBoardState) {
              if (state.needToUpdateList) {
                //      _showLoadingIndicator();
                //API CALLING FOR UPDATE REPORTS
                BlocProvider.of<ReportBloc>(context).add(ReportEvent.loadReports(
                    context,
                    _currentPage,
                    _pageSize,
                    isForFilter(),
                    strRegion,
                    strCenter,
                    strWing,
                    strCHSelectedYear,
                    strSabhaYear,
                    strSabhaMonth,
                    strSabhaWeek,
                    strReportStatus));
              }
            }
          },
        ),
      ],
      child: Stack(children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xffFFFAEA),
                    Color(0xffE6F5FE),
                  ],
                ),
              ),
              child: SafeArea(
                left: false,
                bottom: false,
                right: false,
                child: Padding(
                  padding: EdgeInsets.only(left: 14.4, right: 10.8, bottom: 25.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reports ",
                        style: TextStyle(fontSize: 28.8, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.2, vertical: 4.392),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            "${_totalReport}",
                            style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        //FOR ADD REPORTS LIST
                        BlocProvider.of<ParamsBloc>(context).add(SetSabhaReportsListingEvent(_reportModel!));
                        VRouter.of(context).to(SabhaReport.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          right: 18,
                          bottom: 3.6,
                          top: 7.32,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Sabha",
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.6,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 7.2, vertical: 4.392),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Text(
                                      "$_totalSabhaReports",
                                      style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(left: 3.6, right: 3.6),
                      child: (_reportItems!.length == 0)
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                              child: Container(
                                padding: EdgeInsets.all(7.2),
                                decoration:
                                    BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(5.4)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.not_interested,
                                      size: 14.4,
                                    ),
                                    SizedBox(
                                      width: 7.2,
                                    ),
                                    Text(
                                      CommonMessage.sabha,
                                      style: TextStyle(fontSize: 12.6),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                (_reportItems!.length > 0)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context).add(SabhaReportDetailsEvent(
                                            _reportItems![0]!.id.toString(),
                                            Utils().nullSafeString(_reportItems![0]!.sabha_date),
                                            Utils().nullSafeString(_reportItems![0]!.wing_id),
                                            Utils().nullSafeString(_reportItems![0]!.center_id),
                                            Utils().nullSafeString(_reportItems![0]!.region_id),
                                            Utils().nullSafeString(_reportItems![0]!.sabha_label),
                                          ));
                                          VRouter.of(context).to(SabhaReportAll.id);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils().nullSafeWithDefaultString(
                                                        _reportItems![0]!.total_ratio, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _reportItems![0]!.total_ratio, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_reportItems![0]!.total_ratio, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _reportItems![0]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _reportItems![0]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().changeDateFormatString(
                                                    Utils().nullSafeString(_reportItems![0]!.sabha_week_date),
                                                    Constant.defaultDateFormat,
                                                    "MMMM dd, yyyy"),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        (double.parse(Utils().nullSafeWithDefaultString(
                                                                    _reportItems![0]!.total_ratio, "0")) ==
                                                                100)
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(7.2),
                                                                  color: Colors.green[50],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(3.6),
                                                                  child: Text(
                                                                    "Complete",
                                                                    style:
                                                                        TextStyle(color: Colors.green, fontSize: 13.68),
                                                                  ),
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child: Text(
                                                                  Utils().nullSafeString(_reportItems![0]!.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _reportItems![0]!.CenterName) +
                                                                      " | " +
                                                                      Utils()
                                                                          .nullSafeString(_reportItems![0]!.wingName),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (_reportItems!.length > 1)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context).add(SabhaReportDetailsEvent(
                                            _reportItems![1]!.id.toString(),
                                            Utils().nullSafeString(_reportItems![1]!.sabha_date),
                                            Utils().nullSafeString(_reportItems![1]!.wing_id),
                                            Utils().nullSafeString(_reportItems![1]!.center_id),
                                            Utils().nullSafeString(_reportItems![1]!.region_id),
                                            Utils().nullSafeString(_reportItems![1]!.sabha_label),
                                          ));
                                          VRouter.of(context).to(SabhaReportAll.id);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils().nullSafeWithDefaultString(
                                                        _reportItems![1]!.total_ratio, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _reportItems![1]!.total_ratio, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_reportItems![1]!.total_ratio, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _reportItems![1]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _reportItems![1]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().changeDateFormatString(
                                                    Utils().nullSafeString(_reportItems![1]!.sabha_week_date),
                                                    Constant.defaultDateFormat,
                                                    "MMMM dd, yyyy"),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        (double.parse(Utils().nullSafeWithDefaultString(
                                                                    _reportItems![1]!.total_ratio, "0")) ==
                                                                100)
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(7.2),
                                                                  color: Colors.green[50],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(3.6),
                                                                  child: Text(
                                                                    "Complete",
                                                                    style:
                                                                        TextStyle(color: Colors.green, fontSize: 13.68),
                                                                  ),
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child: Text(
                                                                  Utils().nullSafeString(_reportItems![1]!.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _reportItems![1]!.CenterName) +
                                                                      " | " +
                                                                      Utils()
                                                                          .nullSafeString(_reportItems![1]!.wingName),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                // _totalGoshthiReports - 2 <= 0
                                //     ? SizedBox()
                                //     :
                                GestureDetector(
                                  // behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    //FOR ADD REPORTS LIST
                                    BlocProvider.of<ParamsBloc>(context)
                                        .add(SetSabhaReportsListingEvent(_reportModel!));
                                    VRouter.of(context).to(SabhaReport.id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 18),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "+" +
                                                      "${_totalSabhaReports > 2 ? (_totalSabhaReports - 2) : 0}" +
                                                      " more",
                                                  style: TextStyle(fontSize: 13.68),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7.2,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 14.4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 36.6,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // BlocProvider.of<ParamsBloc>(context).add(GoshthiReportsListingEvent(_networkingReportModel));
                        VRouter.of(context).to(NetworkReport.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 3.6,
                          left: 18,
                          right: 18,
                          bottom: 3.6,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Networking",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.6,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 7.2, vertical: 4.392),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                          child: Text(
                                            "$_totalNetworkingReports",
                                            style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(left: 3.6, right: 3.6),
                      child: (_networkingReportItems!.length == 0)
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                              child: Container(
                                padding: EdgeInsets.all(7.2),
                                decoration:
                                    BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(5.4)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.not_interested,
                                      size: 14.4,
                                    ),
                                    SizedBox(
                                      width: 7.2,
                                    ),
                                    Text(
                                      CommonMessage.network,
                                      style: TextStyle(fontSize: 12.6),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                (_networkingReportItems!.length > 0)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context).add(
                                            NetworkingReportDetailsEvent(_networkingReportItems![0]!, null, null),
                                          );
                                          VRouter.of(context).to(NetworkingReportDetails.id);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils().nullSafeWithDefaultString(
                                                        _networkingReportItems![0]!.total_ratio, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _networkingReportItems![0]!.total_ratio, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_networkingReportItems![0]!.total_ratio, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _networkingReportItems![0]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _networkingReportItems![0]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_networkingReportItems![0]!.reportdate),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      ((double.parse(Utils().nullSafeWithDefaultString(
                                                                      (_networkingReportItems![0]!.total_ratio), "0")) /
                                                                  100) <
                                                              1.0)
                                                          ? Text(Utils().nullSafeString("Individuals: " +
                                                              Utils().nullSafeString(_networkingReportItems![0]!
                                                                  .current_networking_targetuser)))
                                                          : Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: Colors.green.shade50,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(Utils().nullSafeString("Individuals: " +
                                                                    Utils().nullSafeString(_networkingReportItems![0]!
                                                                        .current_networking_targetuser))),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            (double.parse(Utils().nullSafeWithDefaultString(
                                                                        _networkingReportItems![0]!.total_ratio,
                                                                        "0")) ==
                                                                    100)
                                                                ? Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(7.2),
                                                                      color: Colors.green[50],
                                                                    ),
                                                                    child: Padding(
                                                                      padding: EdgeInsets.all(3.6),
                                                                      child: Text(
                                                                        "Complete",
                                                                        style: TextStyle(
                                                                            color: Colors.green, fontSize: 13.68),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Flexible(
                                                                    child: Text(
                                                                      Utils().nullSafeString(
                                                                              _networkingReportItems![0]!.RegionName) +
                                                                          " | " +
                                                                          Utils().nullSafeString(
                                                                              _networkingReportItems![0]!.CenterName) +
                                                                          " | " +
                                                                          Utils().nullSafeString(
                                                                              _networkingReportItems![0]!.wingname),
                                                                      style: TextStyle(
                                                                          color: Color(0xFF828282), fontSize: 13.68),
                                                                    ),
                                                                  ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (_networkingReportItems!.length > 1)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context).add(
                                            NetworkingReportDetailsEvent(_networkingReportItems![1]!, null, null),
                                          );
                                          VRouter.of(context).to(NetworkingReportDetails.id);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils().nullSafeWithDefaultString(
                                                        _networkingReportItems![1]!.total_ratio, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _networkingReportItems![1]!.total_ratio, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_networkingReportItems![1]!.total_ratio, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _networkingReportItems![1]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _networkingReportItems![1]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_networkingReportItems![1]!.reportdate),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      ((double.parse(Utils().nullSafeWithDefaultString(
                                                                      (_networkingReportItems![1]!.total_ratio), "0")) /
                                                                  100) <
                                                              1.0)
                                                          ? Text(Utils().nullSafeString("Individuals: " +
                                                              Utils().nullSafeString(_networkingReportItems![1]!
                                                                  .current_networking_targetuser)))
                                                          : Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: Colors.green.shade50,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(Utils().nullSafeString("Individuals: " +
                                                                    Utils().nullSafeString(_networkingReportItems![1]!
                                                                        .current_networking_targetuser))),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            (double.parse(Utils().nullSafeWithDefaultString(
                                                                        _networkingReportItems![1]!.total_ratio,
                                                                        "0")) ==
                                                                    100)
                                                                ? Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(7.2),
                                                                      color: Colors.green[50],
                                                                    ),
                                                                    child: Padding(
                                                                      padding: EdgeInsets.all(3.6),
                                                                      child: Text(
                                                                        "Complete",
                                                                        style: TextStyle(
                                                                            color: Colors.green, fontSize: 13.68),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Flexible(
                                                                    child: Text(
                                                                      Utils().nullSafeString(
                                                                              _networkingReportItems![1]!.RegionName) +
                                                                          " | " +
                                                                          Utils().nullSafeString(
                                                                              _networkingReportItems![1]!.CenterName) +
                                                                          " | " +
                                                                          Utils().nullSafeString(
                                                                              _networkingReportItems![1]!.wingname),
                                                                      style: TextStyle(
                                                                          color: Color(0xFF828282), fontSize: 13.68),
                                                                    ),
                                                                  ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                // _totalGoshthiReports - 2 <= 0
                                //     ? SizedBox()
                                //     :
                                GestureDetector(
                                  // behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    // BlocProvider.of<ParamsBloc>(context).add(GoshthiReportsListingEvent(_networkingReportModel));
                                    VRouter.of(context).to(NetworkReport.id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                      top: 7.2,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "+" +
                                                      "${_totalNetworkingReports > 2 ? (_totalNetworkingReports - 2) : 0}" +
                                                      " more",
                                                  style: TextStyle(fontSize: 13.68),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7.2,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 14.4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 36.6,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        BlocProvider.of<ParamsBloc>(context).add(GoshthiReportsListingEvent(_goshthiReportModel));
                        VRouter.of(context).to(KaryakarGoshtiReport.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 3.6,
                          left: 18,
                          right: 18,
                          bottom: 3.6,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Karyakar Goshthi",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.6,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 7.2, vertical: 4.392),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                          child: Text(
                                            "$_totalGoshthiReports",
                                            style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(left: 3.6, right: 3.6),
                      child: (_goshthiReportItems!.length == 0)
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                              child: Container(
                                padding: EdgeInsets.all(7.2),
                                decoration:
                                    BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(5.4)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.not_interested,
                                      size: 14.4,
                                    ),
                                    SizedBox(
                                      width: 7.2,
                                    ),
                                    Text(
                                      CommonMessage.goshthi,
                                      style: TextStyle(fontSize: 12.6),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                (_goshthiReportItems!.length > 0)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context).add(GoshthiReportDetailsEvent(
                                            Utils().nullSafeString(_goshthiReportItems![0]!.id),
                                            Utils().nullSafeString(_goshthiReportItems![0]!.sabha_date),
                                            Utils().nullSafeString(_goshthiReportItems![0]!.wing_id),
                                            Utils().nullSafeString(_goshthiReportItems![0]!.center_id),
                                            Utils().nullSafeString(_goshthiReportItems![0]!.region_id),
                                            Utils().nullSafeString(_goshthiReportItems![0]!.sabha_label),
                                            Utils().nullSafeString(_goshthiReportItems![0]!.sabha_gender),
                                            Utils().nullSafeString(_goshthiReportItems![0]!.goshthi_held),
                                            null,
                                          ));
                                          VRouter.of(context).to(GoshthiReportAll.id +
                                              "/${(double.parse(Utils().nullSafeWithDefaultString(_goshthiReportItems![0]!.total_ratio, "0")) / 100)}");
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils().nullSafeWithDefaultString(
                                                        _goshthiReportItems![0]!.total_ratio, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _goshthiReportItems![0]!.total_ratio, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_goshthiReportItems![0]!.total_ratio, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _goshthiReportItems![0]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _goshthiReportItems![0]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_goshthiReportItems![0]!.sabha_label),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        (double.parse(Utils().nullSafeWithDefaultString(
                                                                    _goshthiReportItems![0]!.total_ratio, "0")) ==
                                                                100)
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(7.2),
                                                                  color: Colors.green[50],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(3.6),
                                                                  child: Text(
                                                                    "Complete",
                                                                    style:
                                                                        TextStyle(color: Colors.green, fontSize: 13.68),
                                                                  ),
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child: Text(
                                                                  Utils().nullSafeString(
                                                                          _goshthiReportItems![0]!.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _goshthiReportItems![0]!.CenterName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _goshthiReportItems![0]!.wingName),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (_goshthiReportItems!.length > 1)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context).add(GoshthiReportDetailsEvent(
                                            Utils().nullSafeString(_goshthiReportItems![1]!.id),
                                            Utils().nullSafeString(_goshthiReportItems![1]!.sabha_date),
                                            Utils().nullSafeString(_goshthiReportItems![1]!.wing_id),
                                            Utils().nullSafeString(_goshthiReportItems![1]!.center_id),
                                            Utils().nullSafeString(_goshthiReportItems![1]!.region_id),
                                            Utils().nullSafeString(_goshthiReportItems![1]!.sabha_label),
                                            Utils().nullSafeString(_goshthiReportItems![1]!.sabha_gender),
                                            Utils().nullSafeString(_goshthiReportItems![1]!.goshthi_held),
                                            null,
                                          ));
                                          VRouter.of(context).to(GoshthiReportAll.id +
                                              "/${(double.parse(Utils().nullSafeWithDefaultString(_goshthiReportItems![1]!.total_ratio, "0")) / 100)}");
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils().nullSafeWithDefaultString(
                                                        _goshthiReportItems![1]!.total_ratio, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _goshthiReportItems![1]!.total_ratio, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_goshthiReportItems![1]!.total_ratio, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _goshthiReportItems![1]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _goshthiReportItems![1]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_goshthiReportItems![1]!.sabha_label),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        (double.parse(Utils().nullSafeWithDefaultString(
                                                                    _goshthiReportItems![1]!.total_ratio, "0")) ==
                                                                100)
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(7.2),
                                                                  color: Colors.green[50],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(3.6),
                                                                  child: Text(
                                                                    "Complete",
                                                                    style:
                                                                        TextStyle(color: Colors.green, fontSize: 13.68),
                                                                  ),
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child: Text(
                                                                  Utils().nullSafeString(
                                                                          _goshthiReportItems![1]!.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _goshthiReportItems![1]!.CenterName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _goshthiReportItems![1]!.wingName),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                _totalGoshthiReports - 2 <= 0
                                    ? SizedBox()
                                    : GestureDetector(
                                        // behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          BlocProvider.of<ParamsBloc>(context)
                                              .add(GoshthiReportsListingEvent(_goshthiReportModel));
                                          VRouter.of(context).to(KaryakarGoshtiReport.id);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 18,
                                            top: 7.2,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        "+" +
                                                            "${_totalGoshthiReports > 2 ? (_totalGoshthiReports - 2) : 0}" +
                                                            " more",
                                                        style: TextStyle(fontSize: 13.68),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 7.2,
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 14.4,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 36.6,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        VRouter.of(context).to(BSTReport.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 3.6,
                          left: 18,
                          right: 18,
                          bottom: 3.6,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "BST",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.6,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 7.2, vertical: 4.392),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                          child: Text(
                                            "$_totalBSTReports",
                                            style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(left: 3.6, right: 3.6),
                      child: (_bstReportItems!.length == 0)
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                              child: Container(
                                padding: EdgeInsets.all(7.2),
                                decoration:
                                    BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(5.4)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.not_interested,
                                      size: 14.4,
                                    ),
                                    SizedBox(
                                      width: 7.2,
                                    ),
                                    Text(
                                      CommonMessage.bst,
                                      style: TextStyle(fontSize: 12.6),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                (_bstReportItems!.length > 0)
                                    ? Column(
                                        children: [
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                                            leading: CircularPercentIndicator(
                                              backgroundWidth: 5,
                                              animateFromLastPercent: true,
                                              animation: true,
                                              animationDuration: 1800,
                                              circularStrokeCap: CircularStrokeCap.round,
                                              startAngle: 0,
                                              percent: (double.parse(Utils()
                                                      .nullSafeWithDefaultString(_bstReportItems![0]!.average, "0")) /
                                                  100),
                                              center: (double.parse(Utils().nullSafeWithDefaultString(
                                                          _bstReportItems![0]!.average, "0")) ==
                                                      100)
                                                  ? Icon(
                                                      Icons.done_all,
                                                      color: Color(0xff45e588),
                                                      size: 21.6,
                                                    )
                                                  : Text(
                                                      "${Utils().nullSafeWithDefaultString(_bstReportItems![0]!.average, "0")}%",
                                                      style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                    ),
                                              backgroundColor: Colors.grey.shade300,
                                              radius: 20.88,
                                              lineWidth: 5.4,
                                              linearGradient: LinearGradient(
                                                end: Alignment.topCenter,
                                                begin: Alignment.bottomCenter,
                                                colors: <Color>[
                                                  (double.parse(Utils().nullSafeWithDefaultString(
                                                              _bstReportItems![0]!.average, "0")) ==
                                                          100)
                                                      ? Color(0xff3AE280)
                                                      : Color(0xffFFE69B),
                                                  (double.parse(Utils().nullSafeWithDefaultString(
                                                              _bstReportItems![0]!.average, "0")) ==
                                                          100)
                                                      ? Color(0xffB0FFD2)
                                                      : Color(0xffFFD1D1),
                                                ],
                                              ),
                                            ),
                                            title: Text(
                                              Utils().nullSafeString(_bstReportItems![0]!.year),
                                              style: TextStyle(
                                                  fontSize: 16.2,
                                                  color: Color(0xFF4F4F4F),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      (double.parse(Utils().nullSafeWithDefaultString(
                                                                  _bstReportItems![0]!.average, "0")) ==
                                                              100)
                                                          ? Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: Colors.green[50],
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(
                                                                  "Complete",
                                                                  style:
                                                                      TextStyle(color: Colors.green, fontSize: 13.68),
                                                                ),
                                                              ),
                                                            )
                                                          : Flexible(
                                                              child: Text(
                                                                Utils().nullSafeString(
                                                                        _bstReportItems![0]!.RegionName) +
                                                                    " | " +
                                                                    Utils().nullSafeString(
                                                                        _bstReportItems![0]!.CenterName) +
                                                                    " | " +
                                                                    Utils()
                                                                        .nullSafeString(_bstReportItems![0]!.wingName),
                                                                style: TextStyle(
                                                                    color: Color(0xFF828282), fontSize: 13.68),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //change here don't //worked
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      //FOR ADD SELECTED REPORT-ID
                                                      BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(
                                                        _bstReportItems![0]!,
                                                        null,
                                                      ));
                                                      VRouter.of(context).to(ManageBSTNiyamAssesment.id);
                                                    },
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(3.6),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Manage Niyam Assesment",
                                                      style: TextStyle(color: Colors.white, fontSize: 12.6),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      //FOR ADD SELECTED REPORT-ID
                                                      BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(
                                                        _bstReportItems![0]!,
                                                        null,
                                                      ));
                                                      VRouter.of(context).to(ManageReport.id);
                                                    },
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(3.6),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Manage Report",
                                                      style: TextStyle(color: Colors.white, fontSize: 12.6),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            indent: 18,
                                            endIndent: 18,
                                          ),
                                        ],
                                      )
                                    : Container(),
                                (_bstReportItems!.length > 1)
                                    ? Column(
                                        children: [
                                          ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                                            leading: CircularPercentIndicator(
                                              animation: true,
                                              animationDuration: 1800,
                                              circularStrokeCap: CircularStrokeCap.round,
                                              startAngle: 0,
                                              percent: (double.parse(Utils()
                                                      .nullSafeWithDefaultString(_bstReportItems![1]!.average, "0")) /
                                                  100),
                                              center: (double.parse(Utils().nullSafeWithDefaultString(
                                                          _bstReportItems![1]!.average, "0")) ==
                                                      100)
                                                  ? Icon(
                                                      Icons.done_all,
                                                      color: Color(0xff45e588),
                                                      size: 21.6,
                                                    )
                                                  : Text(
                                                      "${Utils().nullSafeWithDefaultString(_bstReportItems![1]!.average, "0")}%",
                                                      style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                    ),
                                              backgroundColor: Colors.grey.shade300,
                                              radius: 20.88,
                                              lineWidth: 5.4,
                                              linearGradient: LinearGradient(
                                                end: Alignment.topCenter,
                                                begin: Alignment.bottomCenter,
                                                colors: <Color>[
                                                  (double.parse(Utils().nullSafeWithDefaultString(
                                                              _bstReportItems![1]!.average, "0")) ==
                                                          100)
                                                      ? Color(0xff3AE280)
                                                      : Color(0xffFFE69B),
                                                  (double.parse(Utils().nullSafeWithDefaultString(
                                                              _bstReportItems![1]!.average, "0")) ==
                                                          100)
                                                      ? Color(0xffB0FFD2)
                                                      : Color(0xffFFD1D1),
                                                ],
                                              ),
                                            ),
                                            title: Text(
                                              Utils().nullSafeString(_bstReportItems![1]!.year),
                                              style: TextStyle(
                                                  fontSize: 16.2,
                                                  color: Color(0xFF4F4F4F),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      (double.parse(Utils().nullSafeWithDefaultString(
                                                                  _bstReportItems![1]!.average, "0")) ==
                                                              100)
                                                          ? Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: Colors.green[50],
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(
                                                                  "Complete",
                                                                  style:
                                                                      TextStyle(color: Colors.green, fontSize: 13.68),
                                                                ),
                                                              ),
                                                            )
                                                          : Flexible(
                                                              child: Text(
                                                                Utils().nullSafeString(
                                                                        _bstReportItems![1]!.RegionName) +
                                                                    " | " +
                                                                    Utils().nullSafeString(
                                                                        _bstReportItems![1]!.CenterName) +
                                                                    " | " +
                                                                    Utils()
                                                                        .nullSafeString(_bstReportItems![1]!.wingName),
                                                                style: TextStyle(
                                                                    color: Color(0xFF828282), fontSize: 13.68),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //change here don't //worked
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(
                                                        _bstReportItems![1]!,
                                                        null,
                                                      ));
                                                      VRouter.of(context).to(ManageBSTNiyamAssesment.id);
                                                    },
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(3.6),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Manage Niyam Assesment",
                                                      style: TextStyle(color: Colors.white, fontSize: 12.6),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      //FOR ADD SELECTED REPORT-ID
                                                      BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(
                                                        _bstReportItems![1]!,
                                                        null,
                                                      ));
                                                      VRouter.of(context).to(ManageReport.id);
                                                    },
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(3.6),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Manage Report",
                                                      style: TextStyle(color: Colors.white, fontSize: 12.6),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            indent: 18,
                                            endIndent: 18,
                                          ),
                                        ],
                                      )
                                    : Container(),
                                // _totalGoshthiReports - 2 <= 0
                                //     ? SizedBox()
                                //     :
                                GestureDetector(
                                  // behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    VRouter.of(context).to(BSTReport.id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                      top: 7.2,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "+" +
                                                      "${_totalBSTReports > 2 ? (_totalBSTReports - 2) : 0}" +
                                                      " more",
                                                  style: TextStyle(fontSize: 13.68),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7.2,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 14.4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 36.6,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        VRouter.of(context).to(KSTReport.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 3.6,
                          left: 18,
                          right: 18,
                          bottom: 3.6,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "KST",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.6,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 7.2, vertical: 4.392),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                          child: Text(
                                            "$_totalKSTReports",
                                            style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(left: 3.6, right: 3.6),
                      child: (_kstReportItems!.length == 0)
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                              child: Container(
                                padding: EdgeInsets.all(7.2),
                                decoration:
                                    BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(5.4)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.not_interested,
                                      size: 14.4,
                                    ),
                                    SizedBox(
                                      width: 7.2,
                                    ),
                                    Text(
                                      CommonMessage.kst,
                                      style: TextStyle(fontSize: 12.6),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                (_kstReportItems!.length > 0)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context)
                                              .add(KSTReportDetailsEvent(_kstReportItems![0]!, null, null, null));
                                          VRouter.of(context).to(ManageKSTReport.id);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils()
                                                        .nullSafeWithDefaultString(_kstReportItems![0]!.average, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _kstReportItems![0]!.average, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_kstReportItems![0]!.average, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _kstReportItems![0]!.average, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _kstReportItems![0]!.average, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_kstReportItems![0]!.kst_year),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        (double.parse(Utils().nullSafeWithDefaultString(
                                                                    _kstReportItems![0]!.average, "0")) ==
                                                                100)
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(7.2),
                                                                  color: Colors.green[50],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(3.6),
                                                                  child: Text(
                                                                    "Complete",
                                                                    style:
                                                                        TextStyle(color: Colors.green, fontSize: 13.68),
                                                                  ),
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child: Text(
                                                                  Utils().nullSafeString(
                                                                          _kstReportItems![0]!.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _kstReportItems![0]!.CenterName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _kstReportItems![0]!.wingName),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (_kstReportItems!.length > 1)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context)
                                              .add(KSTReportDetailsEvent(_kstReportItems![1]!, null, null, null));
                                          VRouter.of(context).to(ManageKSTReport.id);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils()
                                                        .nullSafeWithDefaultString(_kstReportItems![1]!.average, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _kstReportItems![1]!.average, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_kstReportItems![1]!.average, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _kstReportItems![1]!.average, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _kstReportItems![1]!.average, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_kstReportItems![1]!.kst_year),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        (double.parse(Utils().nullSafeWithDefaultString(
                                                                    _kstReportItems![1]!.average, "0")) ==
                                                                100)
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(7.2),
                                                                  color: Colors.green[50],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(3.6),
                                                                  child: Text(
                                                                    "Complete",
                                                                    style:
                                                                        TextStyle(color: Colors.green, fontSize: 13.68),
                                                                  ),
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child: Text(
                                                                  Utils().nullSafeString(
                                                                          _kstReportItems![1]!.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _kstReportItems![1]!.CenterName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _kstReportItems![1]!.wingName),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                // _totalGoshthiReports - 2 <= 0
                                //     ? SizedBox()
                                //     :
                                GestureDetector(
                                  // behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    VRouter.of(context).to(KSTReport.id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                      top: 7.2,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "+" +
                                                      "${_totalKSTReports > 2 ? (_totalKSTReports - 2) : 0}" +
                                                      " more",
                                                  style: TextStyle(fontSize: 13.68),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7.2,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 14.4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 36.6,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        VRouter.of(context).to(CampusHangout.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 3.6,
                          left: 18,
                          right: 18,
                          bottom: 3.6,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Campus Hangout",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.6,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 7.2, vertical: 4.392),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                          child: Text(
                                            "$_totalCampusHangouts",
                                            style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(left: 3.6, right: 3.6),
                      child: (_campusHangoutItems!.length == 0)
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                              child: Container(
                                padding: EdgeInsets.all(7.2),
                                decoration:
                                    BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(5.4)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.not_interested,
                                      size: 14.4,
                                    ),
                                    SizedBox(
                                      width: 7.2,
                                    ),
                                    Text(
                                      CommonMessage.campus,
                                      style: TextStyle(fontSize: 12.6),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                (_campusHangoutItems!.length > 0)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context).add(CampusHangoutDetailsEvent(
                                            _campusHangoutItems![0]!,
                                            null,
                                          ));
                                          VRouter.of(context).to(ViewHangout.id);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils().nullSafeWithDefaultString(
                                                        _campusHangoutItems![0]!.average, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _campusHangoutItems![0]!.average, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_campusHangoutItems![0]!.average, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _campusHangoutItems![0]!.average, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _campusHangoutItems![0]!.average, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_campusHangoutItems![0]!.year),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        (double.parse(Utils().nullSafeWithDefaultString(
                                                                    _campusHangoutItems![0]!.average, "0")) ==
                                                                100)
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(7.2),
                                                                  color: Colors.green[50],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(3.6),
                                                                  child: Text(
                                                                    "Complete",
                                                                    style:
                                                                        TextStyle(color: Colors.green, fontSize: 13.68),
                                                                  ),
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child: Text(
                                                                  Utils().nullSafeString(
                                                                          _campusHangoutItems![0]!.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _campusHangoutItems![0]!.CenterName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _campusHangoutItems![0]!.wingName),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (_campusHangoutItems!.length > 1)
                                    ? GestureDetector(
                                        onTap: () {
                                          //FOR ADD SELECTED REPORT-ID
                                          BlocProvider.of<ParamsBloc>(context).add(CampusHangoutDetailsEvent(
                                            _campusHangoutItems![1]!,
                                            null,
                                          ));
                                          VRouter.of(context).to(ViewHangout.id);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (double.parse(Utils().nullSafeWithDefaultString(
                                                        _campusHangoutItems![1]!.average, "0")) /
                                                    100),
                                                center: (double.parse(Utils().nullSafeWithDefaultString(
                                                            _campusHangoutItems![1]!.average, "0")) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_campusHangoutItems![1]!.average, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _campusHangoutItems![1]!.average, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (double.parse(Utils().nullSafeWithDefaultString(
                                                                _campusHangoutItems![1]!.average, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_campusHangoutItems![1]!.year),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        (double.parse(Utils().nullSafeWithDefaultString(
                                                                    _campusHangoutItems![1]!.average, "0")) ==
                                                                100)
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(7.2),
                                                                  color: Colors.green[50],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(3.6),
                                                                  child: Text(
                                                                    "Complete",
                                                                    style:
                                                                        TextStyle(color: Colors.green, fontSize: 13.68),
                                                                  ),
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child: Text(
                                                                  Utils().nullSafeString(
                                                                          _campusHangoutItems![1]!.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _campusHangoutItems![1]!.CenterName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(
                                                                          _campusHangoutItems![1]!.wingName),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              indent: 18,
                                              endIndent: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                // _totalGoshthiReports - 2 <= 0
                                //     ? SizedBox()
                                //     :
                                GestureDetector(
                                  // behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    VRouter.of(context).to(CampusHangout.id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                      top: 7.2,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "+" +
                                                      "${_totalCampusHangouts > 2 ? (_totalCampusHangouts - 2) : 0}" +
                                                      " more",
                                                  style: TextStyle(fontSize: 13.68),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7.2,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 14.4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 65.88,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
      ]),
    );
  }

  //region FOR CHECK WHETHER IS FILTERS PARAMS FILLED OR NOT
  int isForFilter() {
    if (strRegion.isNotEmpty) {
      return 1;
    }

    if (strCenter.isNotEmpty) {
      return 1;
    }

    if (strWing.isNotEmpty) {
      return 1;
    }

    if (strReportStatus.isNotEmpty) {
      return 1;
    }

    if (strSabhaYear.isNotEmpty) {
      return 1;
    }

    if (strSabhaWeek.isNotEmpty) {
      return 1;
    }

    return 0;
  }
//endregion
}
