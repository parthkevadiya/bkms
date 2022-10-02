import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/lifecycle/lifecycle_manager.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/sabha_report_pages/sabha_report_all.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/sabhafillter.dart';
import 'package:flutter_app/presentation/reports_page/reports.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';

import '../../../Bloc/sabha_report_bloc.dart';
import '../../../loader.dart';
import '../../../preferences.dart';
import '../report_model.dart';

class SabhaReport extends StatefulWidget {
  static String id = "sabhaReport";
  static String path = "${Reports.path}/$id";

  const SabhaReport({Key? key}) : super(key: key);

  @override
  _SabhaReportState createState() => _SabhaReportState();
}

class _SabhaReportState extends State<SabhaReport> {
  bool isFilter = false;
  int _totalSabhaReports = 0;
  int pageKey = 1;

  static const _pageSize = 50;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  bool _isLoading = false;

  ReportModel? _reportModel;
  List<ReportsListDataModel?>? _reportItems = [];
  List<ReportsListDataModel?>? _allReports = [];

  TextEditingController _search = TextEditingController();

  void onRefresh(context, page, _pageSize, isForFilter(), strRegion, strCenter, strWing, strYear, strSabhaWeek,
      strReportStatus, String searchText) {
    if (pageKey == 1) {
      _reportItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<SabhaReportBloc>(context).add(SabhaReportEvent.loadSabhaReports(context, page, _pageSize,
        isForFilter(), strRegion, strCenter, strWing, strYear, strSabhaWeek, strReportStatus, searchText));
  }

  //FOR FILTERS
  String strRegion = "";
  String strCenter = "";
  String strWing = "";
  String strReportStatus = "";
  String strYear = "";
  String strSabhaWeek = "";
  bool searchByName = false;

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
    //FOR GET REPORTS

    _reportItems!.clear();
    BlocProvider.of<SabhaReportBloc>(context).add(
      SabhaReportEvent.loadSabhaReports(context, pageKey, _pageSize, isForFilter(), strRegion, strCenter, strWing,
          strYear, strSabhaWeek, strReportStatus, ""),
    );
    super.initState();
  }

  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return LifecycleManager(
      child: MultiBlocListener(
          listeners: [
            BlocListener<SabhaReportBloc, SabhaReportState>(
              listener: (context, state) {
                state.maybeWhen(
                    empty: (l) {
                      if (l == LoadingStatus.InProgress) {
                        setState(() {
                          _showLoadingIndicator();
                        });
                      }
                    },
                    loadSabhaReports: (reportModel, l) async {
                      if (l == LoadingStatus.Done) {
                        _reportItems!.clear();
                        _hideLoadingIndicator();
                        _totalSabhaReports = 0;

                        if (reportModel != null && reportModel.sabha_result!.data != null) {
                          _reportModel = reportModel;
                          _totalSabhaReports = Utils().nullSafeInt(_reportModel!.sabha_result!.total);
                          if (pageKey == 1) {
                            _allReports!.clear();
                          }
                          if (_reportModel!.sabha_result!.data!.length == _allReports!.length) {
                            setState(() {
                              loading = false;
                            });
                          } else {
                            _scrollController.loadComplete();
                          }
                          final allReports = _reportModel!.sabha_result!.data;
                          _allReports = allReports!
                              .map(
                                (e) => ReportsListDataModel.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList();
                          _reportItems!.clear();
                          _reportItems!.addAll(
                            List.from(
                              allReports
                                  .map(
                                    (e) => ReportsListDataModel.fromJson(
                                      jsonDecode(
                                        jsonEncode(e),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                          final _pref = await Preferences.getInstance();
                          LoginModel? loginModel = await _pref.getToken();
                          reportModel.roleType = Utils().nullSafeString(loginModel!.role);
                        } else {
                          if (l == LoadingStatus.Error) {
                            setState(() {
                              _hideLoadingIndicator();
                            });
                          }
                        }
                      } else if (l == LoadingStatus.Error) {
                        setState(() {
                          _hideLoadingIndicator();
                          _reportItems!.clear();
                          _totalSabhaReports = 0;
                        });
                      }
                    },
                    orElse: () {});
              },
            ),
            BlocListener<ParamsBloc, ParamsState>(
              listener: (context, state) {
                if (state is SelectedSabhaReportFiltersState) {
                  strRegion = state.strRegion;
                  strCenter = state.strCenter;
                  strWing = state.strWing;
                  strReportStatus = state.strReportStatus;
                  strYear = state.strYear;
                  strSabhaWeek = state.strSabhaWeek;

                  //FOR ADD SELECTED FILTERS
                  BlocProvider.of<ParamsBloc>(context).add(SabhaReportFiltersEvent(
                    strRegion,
                    strCenter,
                    strWing,
                    strReportStatus,
                    strYear,
                    strSabhaWeek,
                  ));
                }
              },
            ),
          ],
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(
              FocusNode(),
            ),
            child: Stack(
              children: [
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
                            bottom: 14.4,
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //FOR ADD STATUS FOR UPDATE SABHA REPORTS
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
                                            "Sabha",
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
                                        Flexible(
                                          child: Text(
                                            "Reports",
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
                                            "$_totalSabhaReports",
                                            style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                          ),
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
                                        builder: (context) => SabhaFilter(
                                          _search.text,
                                          onSelectFilter: (bool isFiltered) {
                                            setState(() {
                                              isFilter = isFiltered;
                                              _showLoadingIndicator();
                                              if (isFilter) {
                                                if (_scrollControllerList.positions.isNotEmpty) {
                                                  _scrollControllerList
                                                      .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                }

                                                pageKey = 1;
                                              }
                                            });
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
                                        onChanged: (val) {},
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
                                                      searchByName = false;
                                                      loading = true;
                                                      _search.text = "";
                                                      pageKey = 1;
                                                    });
                                                    strRegion = "";
                                                    strCenter = "";
                                                    strWing = "";
                                                    strYear = "";
                                                    strSabhaWeek = "";
                                                    strReportStatus = "";
                                                    BlocProvider.of<SabhaReportBloc>(context).add(
                                                        SabhaReportEvent.loadSabhaReports(
                                                            context,
                                                            pageKey,
                                                            _pageSize,
                                                            isForFilter(),
                                                            strRegion,
                                                            strCenter,
                                                            strWing,
                                                            strYear,
                                                            strSabhaWeek,
                                                            strReportStatus,
                                                            ""));
                                                    if (_scrollControllerList.positions.isNotEmpty) {
                                                      _scrollControllerList
                                                          .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                    }
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
                                                  searchByName = true;
                                                  pageKey = 1;
                                                  _showLoadingIndicator();
                                                  BlocProvider.of<SabhaReportBloc>(context).add(
                                                      SabhaReportEvent.loadSabhaReports(
                                                          context,
                                                          pageKey,
                                                          _pageSize,
                                                          isForFilter(),
                                                          strRegion,
                                                          strCenter,
                                                          strWing,
                                                          strYear,
                                                          strSabhaWeek,
                                                          strReportStatus,
                                                          _search.text));
                                                  if (_scrollControllerList.positions.isNotEmpty) {
                                                    _scrollControllerList
                                                        .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                  }
                                                  _allReports!.clear();
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
                          if (_reportItems!.isEmpty)
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
                            ),
                          SmartRefresher(
                            enablePullDown: false,
                            enablePullUp: loading,
                            onLoading: () {
                              pageKey++;
                              if (_search.text.isEmpty) {
                                onRefresh(context, pageKey, _pageSize, isForFilter, strRegion, strCenter, strWing,
                                    strYear, strSabhaWeek, strReportStatus, "");
                              } else {
                                onRefresh(context, pageKey, _pageSize, isForFilter, strRegion, strCenter, strWing,
                                    strYear, strSabhaWeek, strReportStatus, _search.text);
                              }
                            },
                            header: const WaterDropMaterialHeader(),
                            controller: _scrollController,
                            child: ListView.builder(
                              controller: _scrollControllerList,
                              itemCount: (_reportItems?.length ?? 0) + ((loading) ? 0 : 1),
                              itemBuilder: (context, index) => (_reportItems!.length == index && loading == false)
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
                                            BlocProvider.of<ParamsBloc>(context).add(
                                              SabhaReportDetailsEvent(
                                                _reportItems![index]!.id.toString(),
                                                Utils().nullSafeString(_reportItems![index]!.sabha_date),
                                                Utils().nullSafeString(_reportItems![index]!.wing_id),
                                                Utils().nullSafeString(_reportItems![index]!.center_id),
                                                Utils().nullSafeString(_reportItems![index]!.region_id),
                                                Utils().nullSafeString(_reportItems![index]!.sabha_label),
                                              ),
                                            );
                                            VRouter.of(context).to(SabhaReportAll.id);
                                          },
                                          child: ListTile(
                                            leading: CircularPercentIndicator(
                                              animation: true,
                                              animationDuration: 1800,
                                              circularStrokeCap: CircularStrokeCap.round,
                                              startAngle: 0,
                                              percent: (int.parse(Utils().nullSafeWithDefaultString(
                                                      _reportItems![index]!.total_ratio, "0")) /
                                                  100),
                                              center: (double.parse(
                                                        Utils().nullSafeWithDefaultString(
                                                            _reportItems![index]!.total_ratio, "0"),
                                                      ) ==
                                                      100)
                                                  ? Icon(
                                                      Icons.done_all,
                                                      color: Color(0xff45e588),
                                                      size: 21.6,
                                                    )
                                                  : Text(
                                                      "${Utils().nullSafeWithDefaultString(_reportItems![index]!.total_ratio, "0")}%",
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
                                                              _reportItems![index]!.total_ratio, "0")) ==
                                                          100)
                                                      ? Color(0xff3AE280)
                                                      : Color(0xffFFE69B),
                                                  (int.parse(Utils().nullSafeWithDefaultString(
                                                              _reportItems![index]!.total_ratio, "0")) ==
                                                          100)
                                                      ? Color(0xffB0FFD2)
                                                      : Color(0xffFFD1D1),
                                                ],
                                              ),
                                            ),
                                            title: Text(
                                              Utils().changeDateFormatString(
                                                  Utils().nullSafeString(_reportItems![index]!.sabha_week_date),
                                                  Constant.defaultDateFormat,
                                                  "MMMM dd, yyyy"),
                                              style: TextStyle(
                                                  fontSize: 16.2,
                                                  color: Color(0xFF4F4F4F),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                ((int.parse(Utils().nullSafeWithDefaultString(
                                                                _reportItems![index]!.total_ratio, "0")) /
                                                            100) <
                                                        1.0)
                                                    ? Text(Utils().nullSafeString(
                                                        Utils().nullSafeString(_reportItems![index]!.RegionName) +
                                                            " | " +
                                                            Utils().nullSafeString(_reportItems![index]!.CenterName) +
                                                            " | " +
                                                            Utils().nullSafeString(_reportItems![index]!.wingName)))
                                                    : Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(7.2),
                                                          color: Colors.green.shade50,
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.all(3.6),
                                                          child: Text(
                                                            Utils().nullSafeString(Utils()
                                                                    .nullSafeString(_reportItems![index]!.RegionName) +
                                                                " | " +
                                                                Utils()
                                                                    .nullSafeString(_reportItems![index]!.CenterName) +
                                                                " | " +
                                                                Utils().nullSafeString(_reportItems![index]!.wingName)),
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
                                      _reportItems!.isEmpty
                                          ? "Showing no results based on filters. "
                                          : ((_search.text.isEmpty)
                                              ? "Showing all ${_totalSabhaReports.toString()}  result. "
                                              : "Showing all ${_reportItems!.length}  result. "),
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

                                                strRegion = "";
                                                strCenter = "";
                                                strWing = "";
                                                strReportStatus = "";
                                                strYear = "";
                                                strSabhaWeek = "";
                                                //    _pagingController.refresh();
                                                if (_search.text.isNotEmpty) {
                                                  BlocProvider.of<ParamsBloc>(context).add(SetSabhaReportFiltersEvent(
                                                    strRegion = "",
                                                    strCenter = "",
                                                    strWing = "",
                                                    strReportStatus = "",
                                                    strYear = "",
                                                    strSabhaWeek = "",
                                                  ));
                                                  pageKey = 1;
                                                  BlocProvider.of<SabhaReportBloc>(context).add(
                                                      SabhaReportEvent.loadSabhaReports(
                                                          context,
                                                          pageKey,
                                                          _pageSize,
                                                          isForFilter(),
                                                          strRegion,
                                                          strCenter,
                                                          strWing,
                                                          strYear,
                                                          strSabhaWeek,
                                                          strReportStatus,
                                                          _search.text));
                                                  if (_scrollControllerList.positions.isNotEmpty) {
                                                    _scrollControllerList
                                                        .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                  }
                                                } else {
                                                  BlocProvider.of<ParamsBloc>(context).add(SetSabhaReportFiltersEvent(
                                                    strRegion = "",
                                                    strCenter = "",
                                                    strWing = "",
                                                    strReportStatus = "",
                                                    strYear = "",
                                                    strSabhaWeek = "",
                                                  ));
                                                  pageKey = 1;
                                                  BlocProvider.of<SabhaReportBloc>(context).add(
                                                      SabhaReportEvent.loadSabhaReports(
                                                          context,
                                                          pageKey,
                                                          _pageSize,
                                                          isForFilter(),
                                                          strRegion,
                                                          strCenter,
                                                          strWing,
                                                          strYear,
                                                          strSabhaWeek,
                                                          strReportStatus,
                                                          ""));
                                                  if (_scrollControllerList.positions.isNotEmpty) {
                                                    _scrollControllerList
                                                        .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                  }
                                                  _showLoadingIndicator();
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
                                                builder: (context) => SabhaFilter(
                                                  _search.text,
                                                  onSelectFilter: (
                                                    bool isFiltered,
                                                  ) {
                                                    setState(() {
                                                      isFilter = isFiltered;
                                                      if (isFilter) {
                                                        pageKey = 1;
                                                        if (_scrollControllerList.positions.isNotEmpty) {
                                                          _scrollControllerList
                                                              .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                        }
                                                      }
                                                    });
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
          )),
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

    if (strYear.isNotEmpty) {
      return 1;
    }

    if (strSabhaWeek.isNotEmpty) {
      return 1;
    }

    return 0;
  }
//endregion
}
