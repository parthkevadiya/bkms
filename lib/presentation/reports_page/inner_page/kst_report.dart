import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
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
import '../../../Bloc/kst_report_bloc.dart';
import '../../../Bloc/manage_kst_reports_bloc.dart';
import '../../../loader.dart';
import '../../../preferences.dart';
import '../kst_report_model.dart';
import 'kst_fillters.dart';
import 'kst_pages/create_center_kst_report.dart';
import 'kst_pages/manage_kst_report.dart';

class KSTReport extends StatefulWidget {
  static String id = "kstReport";
  static String path = "${Reports.path}/$id";

  const KSTReport({Key? key}) : super(key: key);

  @override
  _KSTReportState createState() => _KSTReportState();
}

class _KSTReportState extends State<KSTReport> {
  bool isFilter = false;
  //FOR PAGINATION
  int _totalKSTReports = 0;
  // int _currentPage = 1;
  static const _pageSize = 50;
  int pageKey = 1;
  final RefreshController _scrollController = RefreshController();

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;

  String strWing = "";
  String strRegion = "";
  String strCenter = "";
  String strYear = "";
  bool? isCallBackFilter;
  bool checkClearFilter = false;
  bool searchByName = false;

  KSTReportModel? _kstReportModel;
  List<KSTReportListDataModel?>? _kstReportItems = [];
  List<KSTReportListDataModel?>? _allReports = [];
  ScrollController _scrollControllerList = ScrollController();

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  //region CHECK FOR WHETHER IS FOR SEARCH
  // bool isForSearch() {
  //   return _searchItems!.length != 0 || _searchText.isNotEmpty;
  // }

  //region PERFORM SEARCH OPERATIONS ON REPORTS LIST
  // void searchOperation() {
  //   _searchItems!.clear();
  //   if (_isSearching) {
  //     for (int i = 0; i < _kstReportItems!.length; i++) {
  //       KSTReportListDataModel kstReportListDataModel = _kstReportItems![i]!;
  //       if (Utils()
  //           .nullSafeString(kstReportListDataModel.kst_year)
  //           .toLowerCase()
  //           .contains(_searchText.toLowerCase())) {
  //         _searchItems!.add(kstReportListDataModel);
  //       }
  //     }
  //   }
  // }

  //endregion

  _KSTReportState() {
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
  void onRefresh(
    context,
    _currentPage,
    _pageSize,
    isForFilter(),
    _strKSTSelectedWing,
    _strKSTSelectedCenter,
    _strKSTSelectedRegion,
    _strKSTSelectedYear,
  ) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _kstReportItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<KstReportBloc>(context).add(
      KstReportEvent.loadKSTReports(
        context,
        _currentPage,
        _pageSize,
        isForFilter(),
        _strKSTSelectedWing,
        _strKSTSelectedCenter,
        _strKSTSelectedRegion,
        _strKSTSelectedYear,
        "",
      ),
    );
  }

  //FOR KST REPORT FILTERS
  String _strKSTSelectedWing = "";
  String _strKSTSelectedCenter = "";
  String _strKSTSelectedRegion = "";
  String _strKSTSelectedYear = Utils().getCurrentDate("yyyy");
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
    _showLoadingIndicator();
    _kstReportItems!.clear();
    //FOR GET REPORTS
    BlocProvider.of<KstReportBloc>(context).add(
      KstReportEvent.loadKSTReports(
        context,
        pageKey,
        _pageSize,
        isForFilter(),
        _strKSTSelectedWing,
        _strKSTSelectedCenter,
        _strKSTSelectedRegion,
        _strKSTSelectedYear,
        "",
      ),
    );
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
                createAllKSTReport: (createAllKSTReportModel, l) {
                  if (l == LoadingStatus.Done) {
                    _hideLoadingIndicator();
                    if (createAllKSTReportModel != null && !createAllKSTReportModel.has_error!) {}
                  } else {
                    if (l == LoadingStatus.Error) {
                      _hideLoadingIndicator();
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<KstReportBloc, KstReportState>(
          listener: (context, state) {
            state.maybeWhen(
                loadKSTReports: (kstReportModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _kstReportItems!.clear();
                    _hideLoadingIndicator();
                    _totalKSTReports = 0;
                    if (kstReportModel != null && kstReportModel.kst_result!.data != null) {
                      _kstReportModel = kstReportModel;
                      _totalKSTReports = Utils().nullSafeInt(_kstReportModel!.kst_result!.total);
                      if (_kstReportModel!.kst_result!.data!.length == _allReports!.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allReports = _kstReportModel!.kst_result!.data;
                      _allReports = allReports!
                          .map(
                            (e) => KSTReportListDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _kstReportItems!.clear();
                      _kstReportItems!.addAll(
                        List.from(
                          allReports
                              .map(
                                (e) => KSTReportListDataModel.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                      final _pref = await Preferences.getInstance();
                      LoginModel? loginModel = _pref.getToken();
                      kstReportModel.roleType = Utils().nullSafeString(loginModel!.role);
                      if (_search.text.isEmpty) {
                        _scrollController.loadComplete();
                      } else {
                        loading = false;
                      }
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
                      _kstReportItems!.clear();
                      _totalKSTReports = 0;
                    });
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is KSTReportFiltersState) {
              _strKSTSelectedWing = state.strKSTSelectedWing;
              _strKSTSelectedCenter = state.strKSTSelectedCenter;
              _strKSTSelectedRegion = state.strKSTSelectedRegion;
              _strKSTSelectedYear =
                  Utils().nullSafeWithDefaultString(state.strKSTSelectedYear, Utils().getCurrentDate("yyyy"));

              //FOR ADD SELECTED FILTERS
              BlocProvider.of<ParamsBloc>(context).add(KSTReportFiltersEvent(
                _strKSTSelectedWing,
                _strKSTSelectedCenter,
                _strKSTSelectedRegion,
                _strKSTSelectedYear,
              ));
            }
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
                                    "KST Reports",
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
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<ParamsBloc>(context).add(KSTReportFiltersEvent(
                                _strKSTSelectedWing,
                                _strKSTSelectedCenter,
                                _strKSTSelectedRegion,
                                _strKSTSelectedYear,
                              ));
                              showMaterialModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14.4),
                                    topLeft: Radius.circular(14.4),
                                  ),
                                ),
                                expand: false,
                                context: context,
                                builder: (context) => KSTFilter(
                                  _search.text,
                                  onSelectFilter: (bool isFiltered) {
                                    setState(() {
                                      isFilter = isFiltered;
                                      if (isFilter) {
                                        pageKey = 1;
                                        loading = true;
                                        _showLoadingIndicator();
                                        if (_scrollControllerList.positions.isNotEmpty) {
                                          _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
                                        }
                                      }
                                    });
                                  },
                                ),
                              );
                            },
                            child: Image.asset("img/filter.png"),
                          ),
                          GestureDetector(
                            onPanDown: (detail) {
                              _showCreateReportPopupMenu(detail.globalPosition);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.blue,
                              size: 21.6,
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
                                            setState(() {
                                              isFilter = false;
                                              loading = true;
                                              pageKey = 1;
                                              _search.text = "";
                                            });
                                            _strKSTSelectedWing = "";
                                            _strKSTSelectedCenter = "";
                                            _strKSTSelectedRegion = "";
                                            _strKSTSelectedYear = Utils().getCurrentDate("yyyy");

                                            BlocProvider.of<KstReportBloc>(context).add(
                                              KstReportEvent.loadKSTReports(
                                                context,
                                                pageKey,
                                                _pageSize,
                                                isForFilter(),
                                                _strKSTSelectedWing,
                                                _strKSTSelectedCenter,
                                                _strKSTSelectedRegion,
                                                _strKSTSelectedYear,
                                                "",
                                              ),
                                            );
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
                                          pageKey = 1;
                                          _showLoadingIndicator();
                                          BlocProvider.of<KstReportBloc>(context).add(
                                            KstReportEvent.loadKSTReports(
                                              context,
                                              pageKey,
                                              _pageSize,
                                              isForFilter(),
                                              _strKSTSelectedWing,
                                              _strKSTSelectedCenter,
                                              _strKSTSelectedRegion,
                                              "",
                                              _search.text,
                                            ),
                                          );

                                          if (_scrollControllerList.positions.isNotEmpty) {
                                            _scrollControllerList
                                                .jumpTo(_scrollControllerList.position.minScrollExtent);
                                          }
                                        }
                                        _allReports!.clear();
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
                if (_kstReportItems!.isEmpty)
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: SmartRefresher(
                    enablePullDown: false,
                    enablePullUp: loading,
                    onLoading: () {
                      pageKey++;
                      onRefresh(
                        context,
                        pageKey,
                        _pageSize,
                        isForFilter,
                        _strKSTSelectedWing,
                        _strKSTSelectedCenter,
                        _strKSTSelectedRegion,
                        _strKSTSelectedYear,
                      );
                    },
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollControllerList,
                      itemCount: (_kstReportItems?.length ?? 0) + 1,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return (_kstReportItems!.length == index)
                            ? SizedBox(
                                height: 40,
                              )
                            : GestureDetector(
                                onTap: () {
                                  //FOR ADD SELECTED REPORT-ID
                                  BlocProvider.of<ParamsBloc>(context)
                                      .add(KSTReportDetailsEvent(_kstReportItems![index], null, null, null));
                                  VRouter.of(context).to(ManageKSTReport.id);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    ListTile(
                                      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                                      leading: CircularPercentIndicator(
                                        animation: true,
                                        animationDuration: 1800,
                                        circularStrokeCap: CircularStrokeCap.round,
                                        startAngle: 0,
                                        percent: (double.parse(Utils()
                                                .nullSafeWithDefaultString(_kstReportItems![index]!.average, "0")) /
                                            100),
                                        center: ((double.parse(Utils().nullSafeWithDefaultString(
                                                        _kstReportItems![index]!.average, "0")) /
                                                    100) ==
                                                100)
                                            ? Icon(
                                                Icons.done_all,
                                                color: Color(0xff45e588),
                                                size: 21.6,
                                              )
                                            : Text(
                                                "${Utils().nullSafeWithDefaultString(_kstReportItems![index]!.average, "0")}%",
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
                                                        _kstReportItems![index]!.average, "0")) ==
                                                    100)
                                                ? Color(0xff3AE280)
                                                : Color(0xffFFE69B),
                                            (double.parse(Utils().nullSafeWithDefaultString(
                                                        _kstReportItems![index]!.average, "0")) ==
                                                    100)
                                                ? Color(0xffB0FFD2)
                                                : Color(0xffFFD1D1),
                                          ],
                                        ),
                                      ),
                                      title: Text(
                                        Utils().nullSafeString(_kstReportItems![index]!.kst_year),
                                        style: TextStyle(
                                            fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          ((double.parse(Utils().nullSafeWithDefaultString(
                                                          _kstReportItems![index]!.average, "0")) /
                                                      100) <
                                                  1.0)
                                              ? Text(Utils().nullSafeString(
                                                  Utils().nullSafeString(_kstReportItems![index]!.RegionName) +
                                                      " | " +
                                                      Utils().nullSafeString(_kstReportItems![index]!.CenterName) +
                                                      " | " +
                                                      Utils().nullSafeString(_kstReportItems![index]!.wingName)))
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(7.2),
                                                    color: Colors.green.shade50,
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(3.6),
                                                    child: Text(
                                                      Utils().nullSafeString(Utils()
                                                              .nullSafeString(_kstReportItems![index]!.RegionName) +
                                                          " | " +
                                                          Utils().nullSafeString(_kstReportItems![index]!.CenterName) +
                                                          " | " +
                                                          Utils().nullSafeString(_kstReportItems![index]!.wingName)),
                                                      style: TextStyle(color: Colors.green, fontSize: 13.68),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 7.32,
                                    ),
                                  ],
                                ),
                              );
                      },
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
                            _kstReportItems!.isEmpty
                                ? "Showing no results based on filters. "
                                : ((_search.text.isEmpty)
                                    ? "Showing all ${_totalKSTReports.toString()}  result. "
                                    : "Showing all ${_kstReportItems!.length}  result. "),
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
                                      _strKSTSelectedWing = "";
                                      _strKSTSelectedCenter = "";
                                      _strKSTSelectedRegion = "";
                                      _strKSTSelectedYear = Utils().getCurrentDate("yyyy");

                                      if (_search.text.isNotEmpty) {
                                        BlocProvider.of<ParamsBloc>(context).add(KSTReportFiltersEvent(
                                          _strKSTSelectedWing,
                                          _strKSTSelectedCenter,
                                          _strKSTSelectedRegion,
                                          _strKSTSelectedYear,
                                        ));
                                        pageKey = 1;
                                        _kstReportItems!.clear();
                                        BlocProvider.of<KstReportBloc>(context).add(
                                          KstReportEvent.loadKSTReports(
                                            context,
                                            pageKey,
                                            _pageSize,
                                            isForFilter(),
                                            _strKSTSelectedWing,
                                            _strKSTSelectedCenter,
                                            _strKSTSelectedRegion,
                                            "",
                                            _search.text,
                                          ),
                                        );
                                        _showLoadingIndicator();
                                        if (_scrollControllerList.positions.isNotEmpty) {
                                          _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
                                        }
                                      } else {
                                        BlocProvider.of<ParamsBloc>(context).add(KSTReportFiltersEvent(
                                          _strKSTSelectedWing,
                                          _strKSTSelectedCenter,
                                          _strKSTSelectedRegion,
                                          _strKSTSelectedYear,
                                        ));
                                        pageKey = 1;
                                        _kstReportItems!.clear();
                                        BlocProvider.of<KstReportBloc>(context).add(
                                          KstReportEvent.loadKSTReports(
                                            context,
                                            pageKey,
                                            _pageSize,
                                            isForFilter(),
                                            _strKSTSelectedWing,
                                            _strKSTSelectedCenter,
                                            _strKSTSelectedRegion,
                                            _strKSTSelectedYear,
                                            "",
                                          ),
                                        );
                                        _showLoadingIndicator();
                                        if (_scrollControllerList.positions.isNotEmpty) {
                                          _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
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
                                      builder: (context) => KSTFilter(
                                        _search.text,
                                        onSelectFilter: (bool isFiltered) {
                                          setState(() {
                                            isFilter = isFiltered;
                                            if (isFilter) {
                                              pageKey = 1;
                                              loading = true;
                                              _showLoadingIndicator();
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
            )),
          ],
        ),
        Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
      ]),
    );
  }

  //region FOR CHECK WHETHER IS FILTERS PARAMS FILLED OR NOT
  int isForFilter() {
    if (_strKSTSelectedWing.isNotEmpty && (_strKSTSelectedWing != Constant.fDEFAULT_FILTER_ID)) {
      return 1;
    }

    if (_strKSTSelectedCenter.isNotEmpty && (_strKSTSelectedCenter != Constant.fDEFAULT_FILTER_ID)) {
      return 1;
    }

    if (_strKSTSelectedRegion.isNotEmpty && (_strKSTSelectedRegion != Constant.fDEFAULT_FILTER_ID)) {
      return 1;
    }

    if (_strKSTSelectedYear.isNotEmpty && (_strKSTSelectedYear != Constant.fDEFAULT_FILTER_ID)) {
      return 1;
    }

    return 0;
  }
//endregion

//region POPUP MENU FOR CREATE REPORT
  void _showCreateReportPopupMenu(Offset offset) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy + 20, 0, 0),
      items: [
        PopupMenuItem<String>(
          child: const Text('Create ALL KST Reports'),
          onTap: () {
            //FOR CREATE ALL KST REPORT
            _showLoadingIndicator();
            BlocProvider.of<ManageKSTReportBloc>(context).add(ManageKSTReportEvent.createAllKSTReport(
              context,
              "",
              "",
              true,
            ));
          },
        ),
        PopupMenuItem<String>(
          child: const Text('Create Center KST Report'),
          onTap: () {
            BlocProvider.of<ParamsBloc>(context).add(CreateCenterKSTReportEvent(
              _kstReportModel!.kst_filter!.kst_centers,
            ));

            VRouter.of(context).to(CreateCenterKSTReport.id);
          },
        ),
      ],
      elevation: 8.0,
    );
  }
}
