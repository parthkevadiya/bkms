import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/kst_report_bloc.dart';
import 'package:flutter_app/models/manage_kst_report_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';
import '../../../../Bloc/manage_kst_reports_bloc.dart';
import '../../../../loader.dart';
import '../../kst_report_model.dart';
import '../kst_report.dart';
import 'manage_1on1_mentoring.dart';
import 'manage_education_mentoring.dart';
import 'manage_kst_attendance.dart';
import 'manage_kst_quiz_scores.dart';

class ManageKSTReport extends StatefulWidget {
  static String id = "manageKSTReport";
  static String path = "${KSTReport.path}/$id";

  const ManageKSTReport({Key? key}) : super(key: key);

  @override
  _ManageKSTReportState createState() => _ManageKSTReportState();
}

class _ManageKSTReportState extends State<ManageKSTReport> {
  //FOR PAGINATION
  int _totalKSTReports = 0;
  int _currentPage = 1;
  static const _pageSize = 50;
  int pageKey = 1;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;
  bool? isCallBackFilter;

  KSTReportListDataModel? _kstReportItem;

  ManageKSTReportModel? _manageKSTReportModel;
  List<ManageKSTReportListDataModel?> _kstReportItems = [];
  List<ManageKSTReportListDataModel?> _allRecords = [];

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  void onRefresh(id, _currentPage, _pageSize) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _kstReportItems = [];
    }

    //FOR GET REPORTS
    BlocProvider.of<ManageKSTReportBloc>(context).add(ManageKSTReportEvent.manageKSTReports(
      context,
      id.toString(),
      _currentPage,
      _pageSize,
      "",
    ));
  }

  //endregion

  _ManageKSTReportState() {
    _search.addListener(() {
      if (_search.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _search.text;
        });
      }
    });
  }
  bool loading = true;

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
    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is KSTReportDetailsState) {
      _kstReportItem = paramsBloc.kstReportListDataModel;
    }
    _showLoadingIndicator();
    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context).add(KSTReportDetailsEvent(_kstReportItem, null, null, null));

    //FOR GET REPORTS
    BlocProvider.of<ManageKSTReportBloc>(context).add(ManageKSTReportEvent.manageKSTReports(
      context,
      Utils().nullSafeString(_kstReportItem!.id.toString()),
      _currentPage,
      _pageSize,
      "",
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ManageKSTReportBloc, ManageKSTReportState>(
          listener: (context, state) {
            state.maybeWhen(
                empty: (l) {
                  if (l == LoadingStatus.InProgress) {
                    _showLoadingIndicator();
                  }
                },
                manageKSTReports: (manageKSTReportsModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _kstReportItems.clear();
                    _hideLoadingIndicator();
                    _totalKSTReports = 0;
                    if (manageKSTReportsModel != null && manageKSTReportsModel.manage_kst_report != null) {
                      _manageKSTReportModel = manageKSTReportsModel;
                      _totalKSTReports = Utils().nullSafeInt(_manageKSTReportModel!.manage_kst_report!.total);
                      if (_manageKSTReportModel!.manage_kst_report!.data!.length == _allRecords.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allRecords = _manageKSTReportModel!.manage_kst_report!.data;
                      _allRecords = allRecords!
                          .map(
                            (e) => ManageKSTReportListDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _kstReportItems.clear();
                      _kstReportItems.addAll(
                        List.from(
                          allRecords
                              .map(
                                (e) => ManageKSTReportListDataModel.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );

                      if (_search.text.isEmpty) {
                        _scrollController.loadComplete();
                      } else {
                        loading = false;
                      }
                    } else {
                      _hideLoadingIndicator();
                    }
                  } else if (l == LoadingStatus.Error) {
                    setState(() {
                      _hideLoadingIndicator();
                      _kstReportItems.clear();
                      _totalKSTReports = 0;
                    });
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: Stack(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  padding: EdgeInsets.only(
                    left: 14.4,
                    right: 14.4,
                    bottom: 18,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<KstReportBloc>(context).add(
                            KstReportEvent.loadKSTReports(
                              context,
                              1,
                              _pageSize,
                              0,
                              "",
                              "",
                              "",
                              "",
                              "",
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 10.8,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                size: 21.6,
                                color: Colors.lightBlue,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(fontSize: 14.4, color: Colors.lightBlue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Manage KST Reports",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 28.8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 7.2,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5.124),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text(
                                    "$_totalKSTReports",
                                    style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.98,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(blurRadius: 20, color: Colors.black12),
                                ],
                              ),
                              child: TextField(
                                controller: _search,
                                onChanged: (val) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 1.44),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.8),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Search for someone",
                                  hintStyle: TextStyle(fontSize: 14.4),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.4),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                  ),
                                  suffixIcon: (_search.text == "")
                                      ? SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            setState(
                                              () {
                                                if (_search.text.isNotEmpty) {
                                                  loading = true;
                                                  _currentPage = 1;
                                                  _showLoadingIndicator();
                                                  BlocProvider.of<ManageKSTReportBloc>(context)
                                                      .add(ManageKSTReportEvent.manageKSTReports(
                                                    context,
                                                    Utils().nullSafeString(_kstReportItem!.id.toString()),
                                                    _currentPage,
                                                    _pageSize,
                                                    "",
                                                  ));
                                                  if (_scrollControllerList.positions.isNotEmpty) {
                                                    _scrollControllerList
                                                        .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                  }
                                                }
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.black45,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 45,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      if (_search.text.isNotEmpty) {
                                        loading = true;
                                        _showLoadingIndicator();
                                        BlocProvider.of<ManageKSTReportBloc>(context)
                                            .add(ManageKSTReportEvent.manageKSTReports(
                                          context,
                                          Utils().nullSafeString(_kstReportItem!.id.toString()),
                                          _currentPage,
                                          _pageSize,
                                          _search.text,
                                        ));
                                        if (_scrollControllerList.positions.isNotEmpty) {
                                          _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
                                        }
                                        _allRecords.clear();
                                      }
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Stack(
                children: [
                  if (_kstReportItems.isEmpty)
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(
                          9,
                        ),
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(5.4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel_outlined,
                              size: 14.4,
                            ),
                            SizedBox(
                              width: 7.2,
                            ),
                            Text(
                              CommonMessage.report,
                              style: TextStyle(color: const Color(0xFF828282), fontSize: 12.6),
                            )
                          ],
                        ),
                      ),
                    ),
                  SmartRefresher(
                    enablePullDown: false,
                    enablePullUp: loading,
                    onLoading: () {
                      pageKey++;
                      onRefresh(
                        _kstReportItem!.id.toString(),
                        pageKey,
                        _pageSize,
                      );
                    },
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        controller: _scrollControllerList,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _kstReportItems.length,
                        itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ListTile(
                                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                  title: Text(
                                    Utils().nullSafeString(_kstReportItems[index]!.name),
                                    style: TextStyle(
                                        fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          ((Utils().nullSafeString(_kstReportItems[index]!.kst_report_status)) !=
                                                  Constant.mbstrsComplete)
                                              ? Text(
                                                  Utils().nullSafeString(
                                                    Utils().nullSafeString(_kstReportItems[index]!.RegionName) +
                                                        " | " +
                                                        Utils().nullSafeString(_kstReportItems[index]!.CenterName) +
                                                        " | " +
                                                        Utils().nullSafeString(_kstReportItems[index]!.wingName),
                                                  ),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(7.2),
                                                    color: Colors.green.shade50,
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(3.6),
                                                    child: Text(
                                                      Utils().nullSafeString(Utils()
                                                              .nullSafeString(_kstReportItems[index]!.RegionName) +
                                                          " | " +
                                                          Utils().nullSafeString(_kstReportItems[index]!.CenterName) +
                                                          " | " +
                                                          Utils().nullSafeString(_kstReportItems[index]!.wingName)),
                                                      style: TextStyle(color: Colors.green, fontSize: 13.68),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //change here don't //worked
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      end: Alignment.topCenter,
                                                      begin: Alignment.bottomCenter,
                                                      colors: <Color>[
                                                        Color(0x11FFFAEA),
                                                        Color(0x11E6F5FE),
                                                      ],
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.only(top: 0, left: 0, right: 7.2, bottom: 0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          _needToUpdateDashboardReports = true;
                                                          //FOR ADD SELECTED ITEM
                                                          BlocProvider.of<ParamsBloc>(context)
                                                              .add(KSTReportDetailsEvent(
                                                            _kstReportItem,
                                                            _kstReportItems[index]!,
                                                            null,
                                                            null,
                                                          ));
                                                          VRouter.of(context).to(ManageKSTAttendance.id);
                                                        },
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(3.6),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "Manage Attendance",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(color: Colors.white, fontSize: 10.8),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      end: Alignment.topCenter,
                                                      begin: Alignment.bottomCenter,
                                                      colors: <Color>[
                                                        Color(0x11FFFAEA),
                                                        Color(0x11E6F5FE),
                                                      ],
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.only(top: 0, left: 7.2, right: 0, bottom: 0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          _needToUpdateDashboardReports = true;
                                                          //FOR ADD SELECTED REPORT-ID
                                                          BlocProvider.of<ParamsBloc>(context).add(
                                                              KSTReportDetailsEvent(
                                                                  _kstReportItem, _kstReportItems[index]!, null, null));
                                                          VRouter.of(context).to(ManageKSTQuizScores.id);
                                                        },
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(3.6),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "Manage Quiz Scores",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(color: Colors.white, fontSize: 10.8),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      end: Alignment.topCenter,
                                                      begin: Alignment.bottomCenter,
                                                      colors: <Color>[
                                                        Color(0x11FFFAEA),
                                                        Color(0x11E6F5FE),
                                                      ],
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.only(top: 0, left: 0, right: 7.2, bottom: 0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          _needToUpdateDashboardReports = true;
                                                          //FOR ADD SELECTED ITEM
                                                          BlocProvider.of<ParamsBloc>(context).add(
                                                              KSTReportDetailsEvent(
                                                                  _kstReportItem, _kstReportItems[index]!, null, null));
                                                          VRouter.of(context).to(ManageEducationMentoring.id);
                                                        },
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(3.6),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "Manage Education Mentoring Interaction",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(color: Colors.white, fontSize: 10.8),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      end: Alignment.topCenter,
                                                      begin: Alignment.bottomCenter,
                                                      colors: <Color>[
                                                        Color(0x11FFFAEA),
                                                        Color(0x11E6F5FE),
                                                      ],
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.only(top: 0, left: 7.2, right: 0, bottom: 0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          _needToUpdateDashboardReports = true;
                                                          //FOR ADD SELECTED ITEM
                                                          BlocProvider.of<ParamsBloc>(context).add(
                                                              KSTReportDetailsEvent(
                                                                  _kstReportItem, _kstReportItems[index]!, null, null));
                                                          VRouter.of(context).to(Manage1On1Mentoring.id);
                                                        },
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(3.6),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "Manage 1-on-1 Mentoring",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(color: Colors.white, fontSize: 10.8),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 7.32,
                                ),
                              ],
                            )),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
      ]),
    );
  }
}
