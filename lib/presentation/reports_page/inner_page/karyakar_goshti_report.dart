import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/reports.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';

import '../../../Bloc/karyakar_goshthi_report_bloc.dart';
import '../../../loader.dart';
import '../goshthi_report_model.dart';
import 'goshthi_fillters.dart';
import 'goshthi_report_pages/goshthi_report_all.dart';

class KaryakarGoshtiReport extends StatefulWidget {
  static String id = "karyakarGoshtiReport";
  static String path = "${Reports.path}/$id";

  const KaryakarGoshtiReport({Key? key}) : super(key: key);

  @override
  _KaryakarGoshtiReportState createState() => _KaryakarGoshtiReportState();
}

class _KaryakarGoshtiReportState extends State<KaryakarGoshtiReport> {
  //FOR PAGINATION
  int _totalGoshthiReports = 0;
  final int _pageSize = 50;
  int pageKey = 1;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  bool _isLoading = false;

  GoshthiReportModel? _goshthiReportModel;
  List<GoshthiDataModel?>? _goshthiReportItems = [];
  List<GoshthiDataModel?> _allRecords = [];
  bool isFilter = false;

  //FOR SEARCH
  TextEditingController _search = TextEditingController();

  bool loading = true;

  //FOR GOSHTHI REPORT FILTERS
  String _strSelectedRegion = "";
  String _strSelectedCenter = "";
  String _strSabhaMonth = Utils().getCurrentDate("MMMM");
  String _strSabhaYear = Utils().getCurrentDate("yyyy");
  String _strSabhaGender = "";

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

  void onRefresh(
    context,
    page,
    _pageSize,
    _strSelectedRegion,
    _strSelectedCenter,
    _strSabhaMonth,
    _strSabhaYear,
    _strSabhaGender,
  ) {
    if (pageKey == 1) {
      _goshthiReportItems = [];
    }
    BlocProvider.of<KaryakarGoshthiReportBloc>(context).add(KaryakarGoshthiReportEvent.loadGoshthiReports(
      context,
      page,
      _pageSize,
      _strSelectedCenter,
      _strSelectedRegion,
      _strSabhaMonth,
      _strSabhaYear,
      _strSabhaGender,
      "",
    ));
  }

  @override
  void initState() {
    //FOR GET REPORTS
    _showLoadingIndicator();

    BlocProvider.of<KaryakarGoshthiReportBloc>(context).add(KaryakarGoshthiReportEvent.loadGoshthiReports(
      context,
      pageKey,
      _pageSize,
      _strSelectedCenter,
      _strSelectedRegion,
      _strSabhaMonth,
      _strSabhaYear,
      _strSabhaGender,
      "",
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<KaryakarGoshthiReportBloc, KaryakarGoshthiReportState>(
          listener: (context, state) {
            state.maybeWhen(
                empty: (l) {
                  if (l == LoadingStatus.InProgress) {
                    setState(() {
                      _showLoadingIndicator();
                    });
                  }
                },
                loadGoshthiReports: (goshthiReportModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _goshthiReportItems!.clear();
                    _hideLoadingIndicator();
                    _totalGoshthiReports = 0;
                    if (goshthiReportModel != null && goshthiReportModel.goshthi_result != null) {
                      _goshthiReportModel = goshthiReportModel;
                      _totalGoshthiReports = Utils().nullSafeInt(_goshthiReportModel!.goshthi_result!.total);

                      if (_goshthiReportModel!.goshthi_result!.data!.length == _allRecords.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allRecords = _goshthiReportModel!.goshthi_result!.data;
                      _allRecords = allRecords!
                          .map(
                            (e) => GoshthiDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _goshthiReportItems!.clear();
                      _goshthiReportItems!.addAll(
                        List.from(
                          allRecords
                              .map(
                                (e) => GoshthiDataModel.fromJson(
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
                      _goshthiReportItems!.clear();
                      _totalGoshthiReports = 0;
                    });
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is GoshthiReportFiltersState) {
              _strSelectedRegion = state.strSelectedRegion;
              _strSelectedCenter = state.strSelectedCenter;
              _strSabhaMonth = Utils().nullSafeWithDefaultString(state.strSabhaMonth, Utils().getCurrentDate("MMMM"));
              _strSabhaYear = Utils().nullSafeWithDefaultString(state.strSabhaYear, Utils().getCurrentDate("yyyy"));
              _strSabhaGender = state.strSabhaGender;

              //FOR ADD SELECTED FILTERS
              BlocProvider.of<ParamsBloc>(context).add(GoshthiReportFiltersEvent(
                _strSelectedRegion,
                _strSelectedCenter,
                _strSabhaMonth,
                _strSabhaYear,
                _strSabhaGender,
              ));
              //_scrollController.requestRefresh();
              // _pagingController.refresh();
            }
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is UpdateDashBoardState) {
              if (state.needToUpdateList) {
                //API CALLING FOR UPDATE REPORTS
                // _goshthiReportItems = [];
                // _searchItems = [];
                _scrollController.requestRefresh();
                //_pagingController.refresh();
              }
            }
          },
        ),
      ],
      child: Stack(
        children: <Widget>[
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
                            //FOR ADD STATUS FOR UPDATE GOSHTHI REPORTS
                            BlocProvider.of<ParamsBloc>(context)
                                .add(UpdateDashBoardEvent(true /*_needToUpdateDashboardReports*/));
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
                                      "Karyakar Goshthi Reports",
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
                                      "$_totalGoshthiReports",
                                      style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.6,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showMaterialModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(14.4),
                                      topLeft: Radius.circular(14.4),
                                    ),
                                  ),
                                  expand: false,
                                  context: context,
                                  builder: (context) => GoshthiFilter(
                                    _search.text,
                                    onSelectFilter: (bool isFiltered) {
                                      isFilter = isFiltered;
                                      if (isFilter) {
                                        _showLoadingIndicator();
                                        pageKey = 1;
                                        if (_scrollControllerList.positions.isNotEmpty) {
                                          _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
                                        }
                                      }
                                    },
                                  ),
                                );
                              },
                              child: Image.asset("img/filter.png"),
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
                                    suffixIcon: _search.text == ""
                                        ? SizedBox()
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                isFilter = false;
                                                loading = true;
                                                _search.text = "";
                                                pageKey = 1;
                                              });
                                              _strSabhaMonth = Utils().getCurrentDate("MMMM");
                                              _strSabhaYear = Utils().getCurrentDate("yyyy");
                                              _strSelectedCenter = "";
                                              _strSelectedRegion = "";
                                              _strSabhaGender = "";

                                              BlocProvider.of<KaryakarGoshthiReportBloc>(context).add(
                                                  KaryakarGoshthiReportEvent.loadGoshthiReports(
                                                      context,
                                                      pageKey,
                                                      _pageSize,
                                                      _strSelectedCenter,
                                                      _strSelectedRegion,
                                                      _strSabhaMonth,
                                                      _strSabhaYear,
                                                      _strSabhaGender,
                                                      ""));

                                              _showLoadingIndicator();
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
                                            pageKey = 1;
                                            _showLoadingIndicator();
                                            BlocProvider.of<KaryakarGoshthiReportBloc>(context)
                                                .add(KaryakarGoshthiReportEvent.loadGoshthiReports(
                                              context,
                                              pageKey,
                                              _pageSize,
                                              _strSelectedCenter,
                                              _strSelectedRegion,
                                              _strSabhaMonth,
                                              _strSabhaYear,
                                              _strSabhaGender,
                                              _search.text,
                                            ));
                                            if (_scrollControllerList.positions.isNotEmpty) {
                                              _scrollControllerList
                                                  .jumpTo(_scrollControllerList.position.minScrollExtent);
                                            }
                                            _allRecords.clear();
                                          }
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    )),
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
                    if (_goshthiReportItems!.isEmpty)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 18, top: 0),
                          child: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F3F3),
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
                                  style: TextStyle(color: Color(0xFF828282), fontSize: 12.6),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    else
                      SmartRefresher(
                        enablePullDown: false,
                        enablePullUp: loading,
                        onLoading: () {
                          pageKey++;
                          onRefresh(
                            context,
                            pageKey,
                            _pageSize,
                            _strSelectedRegion,
                            _strSelectedCenter,
                            _strSabhaMonth,
                            _strSabhaYear,
                            _strSabhaGender,
                          );
                        },
                        header: const WaterDropMaterialHeader(),
                        controller: _scrollController,
                        child: (_goshthiReportItems!.isEmpty)
                            ? Container()
                            : ListView.builder(
                                controller: _scrollControllerList,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: (_goshthiReportItems?.length ?? 0) + ((loading) ? 0 : 1),
                                itemBuilder: (context, index) => (_goshthiReportItems!.length == index &&
                                        loading == false)
                                    ? SizedBox(
                                        height: 60,
                                      )
                                    : Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Divider(
                                            height: 7.32,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              //FOR ADD SELECTED REPORT-ID
                                              ParamsState saveState = BlocProvider.of<ParamsBloc>(context).state;
                                              BlocProvider.of<ParamsBloc>(context).add(GoshthiReportDetailsEvent(
                                                _goshthiReportItems![index]!.id.toString(),
                                                Utils().nullSafeString(_goshthiReportItems![index]!.sabha_date),
                                                Utils().nullSafeString(_goshthiReportItems![index]!.wing_id),
                                                Utils().nullSafeString(_goshthiReportItems![index]!.center_id),
                                                Utils().nullSafeString(_goshthiReportItems![index]!.region_id),
                                                Utils().nullSafeString(_goshthiReportItems![index]!.sabha_label),
                                                Utils().nullSafeString(_goshthiReportItems![index]!.sabha_gender),
                                                Utils().nullSafeString(
                                                  _goshthiReportItems![index]!.goshthi_held,
                                                ),
                                                saveState,
                                              ));
                                              VRouter.of(context).to(GoshthiReportAll.id +
                                                  "/${(int.parse(Utils().nullSafeWithDefaultString(_goshthiReportItems![index]!.total_ratio, "0")) / 100)}");
                                            },
                                            child: ListTile(
                                              leading: CircularPercentIndicator(
                                                animation: true,
                                                animationDuration: 1800,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                startAngle: 0,
                                                percent: (int.parse(Utils().nullSafeWithDefaultString(
                                                        _goshthiReportItems![index]!.total_ratio, "0")) /
                                                    100),
                                                center: (double.parse(
                                                          Utils().nullSafeWithDefaultString(
                                                              _goshthiReportItems![index]!.total_ratio, "0"),
                                                        ) ==
                                                        100)
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: Color(0xff45e588),
                                                        size: 21.6,
                                                      )
                                                    : Text(
                                                        "${Utils().nullSafeWithDefaultString(_goshthiReportItems![index]!.total_ratio, "0")}%",
                                                        style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                      ),
                                                backgroundColor: Colors.grey.shade300,
                                                radius: 21.24,
                                                lineWidth: 5.4,
                                                linearGradient: LinearGradient(
                                                  end: Alignment.topCenter,
                                                  begin: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    (int.parse(Utils().nullSafeWithDefaultString(
                                                                _goshthiReportItems![index]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xff3AE280)
                                                        : Color(0xffFFE69B),
                                                    (int.parse(Utils().nullSafeWithDefaultString(
                                                                _goshthiReportItems![index]!.total_ratio, "0")) ==
                                                            100)
                                                        ? Color(0xffB0FFD2)
                                                        : Color(0xffFFD1D1),
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Utils().nullSafeString(_goshthiReportItems![index]!.sabha_label),
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  ((int.parse(Utils().nullSafeWithDefaultString(
                                                                  _goshthiReportItems![index]!.total_ratio, "0")) /
                                                              100) <
                                                          1.0)
                                                      ? Text(Utils().nullSafeString(Utils()
                                                              .nullSafeString(_goshthiReportItems![index]!.RegionName) +
                                                          " | " +
                                                          Utils()
                                                              .nullSafeString(_goshthiReportItems![index]!.CenterName) +
                                                          " | " +
                                                          Utils()
                                                              .nullSafeString(_goshthiReportItems![index]!.wingName)))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(7.2),
                                                            color: Colors.green.shade50,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.all(3.6),
                                                            child: Text(
                                                              Utils().nullSafeString(Utils().nullSafeString(
                                                                      _goshthiReportItems![index]!.RegionName) +
                                                                  " | " +
                                                                  Utils().nullSafeString(
                                                                      _goshthiReportItems![index]!.CenterName) +
                                                                  " | " +
                                                                  Utils().nullSafeString(
                                                                      _goshthiReportItems![index]!.wingName)),
                                                              style: TextStyle(color: Colors.green, fontSize: 13.68),
                                                            ),
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                      ),
                    Positioned(
                      bottom: (Platform.isIOS) ? 100.8 : 72,
                      left: 18,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.2),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            7.2,
                          ),
                          child: Row(
                            children: [
                              Text(
                                _goshthiReportItems!.isEmpty
                                    ? "Showing no results based on filters. "
                                    : ((_search.text.isEmpty)
                                        ? "Showing all ${_totalGoshthiReports.toString()}  result. "
                                        : "Showing all ${_goshthiReportItems!.length}  result. "),
                                style: TextStyle(
                                  fontSize: 12.6,
                                  color: Color(0xFF4F4F4F),
                                ),
                              ),
                              (isFilter)
                                  ? GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        setState(() {
                                          isFilter = false;
                                          loading = true;
                                          _strSelectedRegion = "";
                                          _strSelectedCenter = "";
                                          _strSabhaMonth = Utils().getCurrentDate("MMMM");
                                          _strSabhaYear = Utils().getCurrentDate("yyyy");
                                          _strSabhaGender = "";

                                          //FOR ADD SELECTED FILTERS
                                          if (_search.text.isNotEmpty) {
                                            BlocProvider.of<ParamsBloc>(context).add(GoshthiReportFiltersEvent(
                                              _strSelectedRegion,
                                              _strSelectedCenter,
                                              _strSabhaMonth,
                                              _strSabhaYear,
                                              _strSabhaGender,
                                            ));
                                            pageKey = 1;
                                            BlocProvider.of<KaryakarGoshthiReportBloc>(context)
                                                .add(KaryakarGoshthiReportEvent.loadGoshthiReports(
                                              context,
                                              pageKey,
                                              _pageSize,
                                              _strSelectedCenter,
                                              _strSelectedRegion,
                                              _strSabhaMonth,
                                              _strSabhaYear,
                                              _strSabhaGender,
                                              _search.text,
                                            ));
                                            _showLoadingIndicator();
                                            if (_scrollControllerList.positions.isNotEmpty) {
                                              _scrollControllerList
                                                  .jumpTo(_scrollControllerList.position.minScrollExtent);
                                            }
                                          } else {
                                            BlocProvider.of<ParamsBloc>(context).add(GoshthiReportFiltersEvent(
                                              _strSelectedRegion,
                                              _strSelectedCenter,
                                              _strSabhaMonth,
                                              _strSabhaYear,
                                              _strSabhaGender,
                                            ));
                                            pageKey = 1;
                                            BlocProvider.of<KaryakarGoshthiReportBloc>(context)
                                                .add(KaryakarGoshthiReportEvent.loadGoshthiReports(
                                              context,
                                              pageKey,
                                              _pageSize,
                                              _strSelectedCenter,
                                              _strSelectedRegion,
                                              _strSabhaMonth,
                                              _strSabhaYear,
                                              _strSabhaGender,
                                              "",
                                            ));
                                            _showLoadingIndicator();
                                            if (_scrollControllerList.positions.isNotEmpty) {
                                              _scrollControllerList
                                                  .jumpTo(_scrollControllerList.position.minScrollExtent);
                                            }
                                          }
                                        });
                                      },
                                      child: Text(
                                        "Clear filters",
                                        style: TextStyle(fontSize: 12.6, color: Colors.blue),
                                      ),
                                    )
                                  : GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        showMaterialModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(14.4),
                                              topLeft: Radius.circular(14.4),
                                            ),
                                          ),
                                          expand: false,
                                          context: context,
                                          builder: (context) => GoshthiFilter(
                                            _search.text,
                                            onSelectFilter: (bool isFiltered) {
                                              isFilter = isFiltered;
                                              if (isFilter) {
                                                pageKey = 1;
                                                if (_scrollControllerList.positions.isNotEmpty) {
                                                  _scrollControllerList
                                                      .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                  _showLoadingIndicator();
                                                }
                                              }
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Add Filters",
                                        style: TextStyle(fontSize: 12.6, color: Colors.blue),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
        ],
      ),
    );
  }
}
