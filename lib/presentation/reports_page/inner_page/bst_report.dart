import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/records_page/record_model.dart';
import 'package:flutter_app/presentation/reports_page/bst_report_model.dart';
import 'package:flutter_app/presentation/reports_page/reports.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';
import '../../../Bloc/bst_report_bloc.dart';
import '../../../Bloc/manage_niyam_report_bloc.dart';
import '../../../loader.dart';
import '../../../preferences.dart';
import 'bst_fillters.dart';
import 'bst_report_pages/create_center_bst_report.dart';
import 'bst_report_pages/manage_bst_niyam_assesment.dart';
import 'bst_report_pages/manage_report.dart';

class BSTReport extends StatefulWidget {
  static String id = "bstReport";
  static String path = "${Reports.path}/$id";

  const BSTReport({Key? key}) : super(key: key);

  @override
  _BSTReportState createState() => _BSTReportState();
}

class _BSTReportState extends State<BSTReport> {
  bool isFilter = false;
  //FOR PAGINATION
  int _totalBSTReports = 0;
  int _pageSize = 50;
  int pageKey = 1;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  bool _isLoading = false;
  bool isMenuOpen = false;

  List<RecordsItem?> _recordItems = [];
  List<RecordsItem?> _allRecords = [];

  final ReceivePort _port = ReceivePort();

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  bool _needToUpdateDashboardReports = false;

  BSTReportModel? _bstReportModel;
  List<BSTReportListDataModel?>? _bstReportItems = [];
  List<BSTReportListDataModel?>? _searchItems = [];
  List<BSTReportListDataModel?>? _allReports = [];

  //region CHECK FOR WHETHER IS FOR SEARCH
  // bool isForSearch() {
  //   return _searchItems!.length != 0 || _searchText.isNotEmpty;
  // }

  //region PERFORM SEARCH OPERATIONS ON REPORTS LIST
  void searchOperation() {
    _searchItems!.clear();
    if (_isSearching) {
      for (int i = 0; i < _bstReportItems!.length; i++) {
        BSTReportListDataModel bstReportListDataModel = _bstReportItems![i]!;
        if (Utils().nullSafeString(bstReportListDataModel.year).toLowerCase().contains(_searchText.toLowerCase())) {
          _searchItems!.add(bstReportListDataModel);
        }
      }
    }
  }

  //endregion

  _BSTReportState() {
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

  //FOR BST REPORT FILTERS
  String _strBSTSelectedWing = "";
  String _strBSTSelectedCenter = "";
  String _strBSTSelectedRegion = "";
  String _strBSTSabhaYear = Utils().getCurrentDate("yyyy");

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

  bool loading = true;
  bool refresh = true;
  void onRefresh(
    context,
    _strBSTSelectedWing,
    _strBSTSelectedCenter,
    _strBSTSelectedRegion,
    _strBSTSabhaYear,
    pageKey,
    _pageSize,
  ) {
    if (pageKey == 1) {
      _bstReportItems = [];
    }
    //FOR GET RECORDS
    BlocProvider.of<BSTReportBloc>(context).add(BSTReportEvent.loadBSTReports(context, _strBSTSelectedWing,
        _strBSTSelectedCenter, _strBSTSelectedRegion, _strBSTSabhaYear, pageKey, _pageSize, ""));
  }

  @override
  void initState() {
    _showLoadingIndicator();
    // _pagingController.addPageRequestListener((pageKey) {
    //   _currentPage = pageKey;
    //
    //   if (pageKey == 1) {
    //     _bstReportItems = [];
    //     _searchItems = [];
    //   }
    //
    //   //FOR GET REPORTS
    //   BlocProvider.of<ReportBloc>(context).add(ReportEvent.loadBSTReports(
    BlocProvider.of<BSTReportBloc>(context).add(
      BSTReportEvent.loadBSTReports(context, _strBSTSelectedWing, _strBSTSelectedCenter, _strBSTSelectedRegion,
          _strBSTSabhaYear, pageKey, _pageSize, ""),
    );
    // });

    // _pagingController.addStatusListener((status) {
    //   if (status == PagingStatus.subsequentPageError) {
    //     Utils().showSnackBarWithCallback(
    //         context, 'Something went wrong while fetching a new page.', 'Retry',
    //         (isClicked) {
    //       _pagingController.retryLastFailedRequest();
    //     });
    //   }
    // });
    super.initState();

    //FOR GET REPORTS
    /*_showLoadingIndicator();
    BlocProvider.of<ReportBloc>(context).add(ReportEvent.loadGoshthiReports(
      context,
      _currentPage,
      _pageSize,
      _strSelectedRegion,
      _strSelectedCenter,
      _strSabhaMonth,
      _strSabhaYear,
      _strSabhaGender,
    ));*/
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<ManageNiyamReportBloc, ManageNiyamReportState>(
            listener: (context, state) {
              state.maybeWhen(
                  empty: (l) {
                    if (l == LoadingStatus.InProgress) {
                      _showLoadingIndicator();
                    }
                  },
                  createAllBSTReport: (createAllBSTReportModel, l) {
                    if (l == LoadingStatus.Done) {
                      _hideLoadingIndicator();
                      if (createAllBSTReportModel != null && !createAllBSTReportModel.has_error!) {
                        _scrollController.refreshCompleted();
                      }
                    } else {
                      if (l == LoadingStatus.Done) {
                        _hideLoadingIndicator();
                      }
                    }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<BSTReportBloc, BSTReportState>(
            listener: (context, state) {
              state.maybeWhen(
                  loadBSTReports: (bstReportModel, l) async {
                    if (l == LoadingStatus.Done) {
                      _bstReportItems!.clear();
                      _hideLoadingIndicator();
                      _totalBSTReports = 0;

                      if (bstReportModel != null && bstReportModel.bst_report_list!.data != null) {
                        _bstReportModel = bstReportModel;
                        _totalBSTReports = Utils().nullSafeInt(_bstReportModel!.bst_report_list!.total);

                        if (_bstReportModel!.bst_report_list!.data!.length == _allReports!.length) {
                          setState(() {
                            loading = false;
                          });
                        } else {
                          _scrollController.loadComplete();
                        }
                        final allReports = _bstReportModel!.bst_report_list!.data;
                        _allReports = allReports!
                            .map(
                              (e) => BSTReportListDataModel.fromJson(
                                jsonDecode(
                                  jsonEncode(e),
                                ),
                              ),
                            )
                            .toList();
                        _bstReportItems!.clear();
                        _bstReportItems!.addAll(
                          List.from(
                            allReports
                                .map(
                                  (e) => BSTReportListDataModel.fromJson(
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
                        _bstReportModel!.roleType = Utils().nullSafeString(loginModel!.role);
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
                        _bstReportItems!.clear();
                        _totalBSTReports = 0;
                      });
                    }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<ParamsBloc, ParamsState>(
            listener: (context, state) {
              if (state is BSTReportRefreshState) {
                if (state.isForRefresh) {
                  _scrollController.refreshCompleted();
                }
              }

              if (state is BSTReportFiltersState) {
                _strBSTSelectedWing = state.strBSTSelectedWing;
                _strBSTSelectedCenter = state.strBSTSelectedCenter;
                _strBSTSelectedRegion = state.strBSTSelectedRegion;
                _strBSTSabhaYear =
                    Utils().nullSafeWithDefaultString(state.strBSTSabhaYear, Utils().getCurrentDate("yyyy"));

                //FOR ADD SELECTED FILTERS
                BlocProvider.of<ParamsBloc>(context).add(BSTReportFiltersEvent(
                  _strBSTSelectedWing,
                  _strBSTSelectedCenter,
                  _strBSTSelectedRegion,
                  _strBSTSabhaYear,
                ));

                _scrollController.refreshCompleted();
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
                                          "BST Reports",
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
                                          "$_totalBSTReports",
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
                                      builder: (context) => BSTFilter(
                                        _search.text,
                                        onSelectFilter: (bool isFiltered) {
                                          isFilter = isFiltered;
                                          if (isFilter) {
                                            pageKey = 1;
                                            _showLoadingIndicator();
                                            loading = true;
                                            if (_scrollControllerList.positions.isNotEmpty) {
                                              _scrollControllerList
                                                  .jumpTo(_scrollControllerList.position.minScrollExtent);
                                            }
                                          }
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
                                                  _strBSTSelectedWing = "";
                                                  _strBSTSelectedCenter = "";
                                                  _strBSTSelectedRegion = "";
                                                  _strBSTSabhaYear = Utils().getCurrentDate("yyyy");

                                                  BlocProvider.of<BSTReportBloc>(context).add(
                                                    BSTReportEvent.loadBSTReports(
                                                      context,
                                                      _strBSTSelectedWing,
                                                      _strBSTSelectedCenter,
                                                      _strBSTSelectedRegion,
                                                      _strBSTSabhaYear,
                                                      pageKey,
                                                      _pageSize,
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
                                                _showLoadingIndicator();
                                                BlocProvider.of<BSTReportBloc>(context).add(
                                                  BSTReportEvent.loadBSTReports(
                                                    context,
                                                    _strBSTSelectedWing,
                                                    _strBSTSelectedCenter,
                                                    _strBSTSelectedRegion,
                                                    "",
                                                    pageKey,
                                                    _pageSize,
                                                    _search.text,
                                                  ),
                                                );
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
                        if (_bstReportItems!.isEmpty)
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
                              context,
                              _strBSTSelectedWing,
                              _strBSTSelectedCenter,
                              _strBSTSelectedRegion,
                              _strBSTSabhaYear,
                              pageKey,
                              _pageSize,
                            );
                          },
                          header: const WaterDropMaterialHeader(),
                          controller: _scrollController,
                          child: ListView.builder(
                            controller: _scrollControllerList,
                            shrinkWrap: true,
                            itemCount: (_bstReportItems?.length ?? 0) + 1,
                            itemBuilder: (context, index) {
                              return (_bstReportItems!.length == index)
                                  ? SizedBox(
                                      height: 40,
                                    )
                                  : Column(
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
                                                    .nullSafeWithDefaultString(_bstReportItems![index]!.average, "0")) /
                                                100),
                                            center: ((double.parse(Utils().nullSafeWithDefaultString(
                                                            _bstReportItems![index]!.average, "0")) /
                                                        100) ==
                                                    100)
                                                ? Icon(
                                                    Icons.done_all,
                                                    color: Color(0xff45e588),
                                                    size: 21.6,
                                                  )
                                                : Text(
                                                    "${Utils().nullSafeWithDefaultString(_bstReportItems![index]!.average, "0")}%",
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
                                                            _bstReportItems![index]!.average, "0")) ==
                                                        100)
                                                    ? Color(0xff3AE280)
                                                    : Color(0xffFFE69B),
                                                (double.parse(Utils().nullSafeWithDefaultString(
                                                            _bstReportItems![index]!.average, "0")) ==
                                                        100)
                                                    ? Color(0xffB0FFD2)
                                                    : Color(0xffFFD1D1),
                                              ],
                                            ),
                                          ),
                                          title: Text(
                                            Utils().nullSafeString(_bstReportItems![index]!.year),
                                            style: TextStyle(
                                                fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              ((double.parse(Utils().nullSafeWithDefaultString(
                                                              _bstReportItems![index]!.average, "0")) /
                                                          100) <
                                                      1.0)
                                                  ? Text(Utils().nullSafeString(
                                                      Utils().nullSafeString(_bstReportItems![index]!.RegionName) +
                                                          " | " +
                                                          Utils().nullSafeString(_bstReportItems![index]!.CenterName) +
                                                          " | " +
                                                          Utils().nullSafeString(_bstReportItems![index]!.wingName)))
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(7.2),
                                                        color: Colors.green.shade50,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(3.6),
                                                        child: Text(
                                                          Utils().nullSafeString(Utils()
                                                                  .nullSafeString(_bstReportItems![index]!.RegionName) +
                                                              " | " +
                                                              Utils()
                                                                  .nullSafeString(_bstReportItems![index]!.CenterName) +
                                                              " | " +
                                                              Utils()
                                                                  .nullSafeString(_bstReportItems![index]!.wingName)),
                                                          style: TextStyle(color: Colors.green, fontSize: 13.68),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    _needToUpdateDashboardReports = true;
                                                    //FOR ADD SELECTED REPORT-ID
                                                    BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(
                                                      _bstReportItems![index]!,
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
                                                    "Manage Niyam Assessment",
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
                                                    _needToUpdateDashboardReports = true;
                                                    //FOR ADD SELECTED REPORT-ID
                                                    BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(
                                                      _bstReportItems![index]!,
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
                                          height: 7.32,
                                        ),
                                      ],
                                    );
                            },
                            // ),
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
                                    _bstReportItems!.isEmpty
                                        ? "Showing no results based on filters. "
                                        : ((_search.text.isEmpty)
                                            ? "Showing all ${_totalBSTReports.toString()}  result. "
                                            : "Showing all ${_bstReportItems!.length}  result. "),
                                    style: TextStyle(
                                      fontSize: 12.6,
                                      color: Color(0xFF4F4F4F),
                                    ),
                                  ),
                                  isFilter
                                      ? GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              _showLoadingIndicator();
                                              isFilter = false;
                                              loading = true;
                                              _strBSTSelectedWing = "";
                                              _strBSTSelectedCenter = "";
                                              _strBSTSelectedRegion = "";
                                              _strBSTSabhaYear = Utils().getCurrentDate("yyyy");

                                              //FOR ADD SELECTED FILTERS
                                              if (_search.text.isNotEmpty) {
                                                BlocProvider.of<BSTReportBloc>(context).add(
                                                  BSTReportEvent.loadBSTReports(
                                                      context,
                                                      _strBSTSelectedWing,
                                                      _strBSTSelectedCenter,
                                                      _strBSTSelectedRegion,
                                                      "",
                                                      pageKey,
                                                      _pageSize,
                                                      _search.text),
                                                );
                                                BlocProvider.of<ParamsBloc>(context).add(BSTReportFiltersEvent(
                                                  "",
                                                  "",
                                                  "",
                                                  "",
                                                ));
                                                if (_scrollControllerList.positions.isNotEmpty) {
                                                  _scrollControllerList
                                                      .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                }
                                              } else {
                                                BlocProvider.of<BSTReportBloc>(context).add(
                                                  BSTReportEvent.loadBSTReports(
                                                      context,
                                                      _strBSTSelectedWing,
                                                      _strBSTSelectedCenter,
                                                      _strBSTSelectedRegion,
                                                      _strBSTSabhaYear,
                                                      pageKey,
                                                      _pageSize,
                                                      ""),
                                                );
                                                BlocProvider.of<ParamsBloc>(context).add(BSTReportFiltersEvent(
                                                  "",
                                                  "",
                                                  "",
                                                  "",
                                                ));
                                                if (_scrollControllerList.positions.isNotEmpty) {
                                                  _scrollControllerList
                                                      .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                }
                                              }
                                            });
                                          },
                                          child: Text(
                                            "Clear Filters",
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
                                              builder: (context) => BSTFilter(
                                                _search.text,
                                                onSelectFilter: (
                                                  bool isFiltered,
                                                ) {
                                                  setState(() {
                                                    _showLoadingIndicator();
                                                    isFilter = isFiltered;
                                                    if (isFilter) {
                                                      _showLoadingIndicator();
                                                      loading = true;
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
        ));
  }

  //region POPUP MENU FOR CREATE REPORT
  void _showCreateReportPopupMenu(Offset offset) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy + 20, 0, 0),
      items: [
        PopupMenuItem<String>(
          child: const Text('Create ALL BST Reports'),
          onTap: () {
            //FOR GET CAMPUS HANGOUT REGION
            _showLoadingIndicator();
            BlocProvider.of<ManageNiyamReportBloc>(context).add(ManageNiyamReportEvent.createAllBSTReport(
              context,
            ));
          },
        ),
        PopupMenuItem<String>(
          child: const Text('Create Center BST Reports'),
          onTap: () {
            BlocProvider.of<ParamsBloc>(context).add(CreateCenterBSTReportEvent(
              _bstReportModel!.search_filter!.bst_centers,
            ));

            VRouter.of(context).to(CreateCenterBSTReport.id);
          },
        ),
      ],
      elevation: 8.0,
    );
  }
  //endregion
}
