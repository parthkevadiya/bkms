import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/reports_page/reports.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';
import '../../../Bloc/campus_hangout_bloc.dart';
import '../../../loader.dart';
import '../../../preferences.dart';
import '../campus_hangout_model.dart';
import 'campus_hangout_fillters.dart';
import 'campus_hangout_pages/create_campus_hangout_report.dart';
import 'campus_hangout_pages/submit_campus_hangout_report.dart';
import 'campus_hangout_pages/view_hangout.dart';

class CampusHangout extends StatefulWidget {
  static String id = "campusHangoutReport";
  static String path = "${Reports.path}/$id";

  const CampusHangout({Key? key}) : super(key: key);

  @override
  _CampusHangoutState createState() => _CampusHangoutState();
}

class _CampusHangoutState extends State<CampusHangout> {
  //FOR PAGINATION
  int _totalCampusHangouts = 0;
  int _currentPage = 1;
  int pageKey = 1;
  static const _pageSize = 50;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  bool _isLoading = false;
  bool isFilter = false;

  bool _needToUpdateDashboardReports = false;

  CampusHangoutModel? _campusHangoutModel;
  List<CampusHangoutDataModel?>? _campusHangoutItems = [];
  List<CampusHangoutDataModel?>? _searchItems = [];
  List<CampusHangoutDataModel?> _allReports = [];

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";
  bool? isCallBackFilter;
  bool checkClearFilter = false;

  //region CHECK FOR WHETHER IS FOR SEARCH

  //region PERFORM SEARCH OPERATIONS ON REPORTS LIST
  void searchOperation() {
    _searchItems!.clear();
    if (_isSearching) {
      for (int i = 0; i < _campusHangoutItems!.length; i++) {
        CampusHangoutDataModel campusHangoutDataModel = _campusHangoutItems![i]!;
        if (Utils().nullSafeString(campusHangoutDataModel.year).toLowerCase().contains(_searchText.toLowerCase())) {
          _searchItems!.add(campusHangoutDataModel);
        }
      }
    }
  }
  //endregion

  _CampusHangoutState() {
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

  //FOR CAMPUS HANGOUT FILTERS
  String _strCHSelectedWing = "";
  String _strCHSelectedCampus = "";
  String _strCHSelectedRegion = "";
  String _strCHSelectedYear =
      (DateTime.now().year - ((DateTime.now().month >= 1 && DateTime.now().month <= 6) ? 1 : 0)).toString();

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
    _strCHSelectedWing,
    _strCHSelectedCampus,
    _strCHSelectedRegion,
    _strCHSelectedYear,
  ) {
    // _currentPage = pageKey;
    if (pageKey == 1) {
      _campusHangoutItems = [];
    }
    //FOR GET RECORDS
    BlocProvider.of<CampusHangoutReportBloc>(context).add(CampusHangoutReportEvent.campusHangout(
      context,
      page,
      _pageSize,
      _strCHSelectedWing,
      _strCHSelectedCampus,
      _strCHSelectedRegion,
      _strCHSelectedYear,
      "",
    ));
  }

  @override
  void initState() {
    _showLoadingIndicator();
    _campusHangoutItems!.clear();
    BlocProvider.of<CampusHangoutReportBloc>(context).add(CampusHangoutReportEvent.campusHangout(
      context,
      pageKey,
      _pageSize,
      _strCHSelectedWing,
      _strCHSelectedCampus,
      _strCHSelectedRegion,
      _strCHSelectedYear,
      "",
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<CampusHangoutReportBloc, CampusHangoutReportState>(
            listener: (context, state) {
              state.maybeWhen(
                  campusHangout: (campusHangoutModel, l) async {
                    if (l == LoadingStatus.Done) {
                      _campusHangoutItems!.clear();
                      _hideLoadingIndicator();
                      _totalCampusHangouts = 0;
                      BlocProvider.of<ParamsBloc>(context).add(
                        CampusHangoutFiltersEvent(
                          _strCHSelectedWing,
                          _strCHSelectedCampus,
                          _strCHSelectedRegion,
                          _strCHSelectedYear,
                        ),
                      );
                      if (campusHangoutModel != null && campusHangoutModel.campus_hangout_list != null) {
                        _campusHangoutModel = campusHangoutModel;
                        _totalCampusHangouts = Utils().nullSafeInt(_campusHangoutModel!.campus_hangout_list!.total);
                        if (_campusHangoutModel!.campus_hangout_list!.data!.length == _allReports.length) {
                          setState(() {
                            loading = false;
                          });
                        } else {
                          _scrollController.loadComplete();
                        }
                        final allReports = _campusHangoutModel!.campus_hangout_list!.data;
                        _allReports = allReports!
                            .map(
                              (e) => CampusHangoutDataModel.fromJson(
                                jsonDecode(
                                  jsonEncode(e),
                                ),
                              ),
                            )
                            .toList();

                        _campusHangoutItems!.clear();
                        _campusHangoutItems!.addAll(
                          List.from(
                            allReports
                                .map(
                                  (e) => CampusHangoutDataModel.fromJson(
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
                        final _pref = await Preferences.getInstance();
                        LoginModel? loginModel = await _pref.getToken();
                        campusHangoutModel.roleType = Utils().nullSafeString(loginModel!.role);
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
                        _campusHangoutItems!.clear();
                        _totalCampusHangouts = 0;
                      });
                    }
                  },
                  orElse: () {});
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
                                          "Campus Hangout",
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
                                          "$_totalCampusHangouts",
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
                                    openFilter();
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
                                                    isCallBackFilter = false;
                                                    checkClearFilter = true;
                                                    _search.text = "";
                                                    loading = true;
                                                    pageKey = 1;
                                                  });
                                                  _strCHSelectedWing = "";
                                                  _strCHSelectedCampus = "";
                                                  _strCHSelectedRegion = "";
                                                  String _strCHSelectedYear = (DateTime.now().year -
                                                          ((DateTime.now().month >= 1 && DateTime.now().month <= 6)
                                                              ? 1
                                                              : 0))
                                                      .toString();

                                                  BlocProvider.of<CampusHangoutReportBloc>(context)
                                                      .add(CampusHangoutReportEvent.campusHangout(
                                                    context,
                                                    pageKey,
                                                    _pageSize,
                                                    _strCHSelectedWing,
                                                    _strCHSelectedCampus,
                                                    _strCHSelectedRegion,
                                                    _strCHSelectedYear,
                                                    "",
                                                  ));
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
                                                BlocProvider.of<CampusHangoutReportBloc>(context)
                                                    .add(CampusHangoutReportEvent.campusHangout(
                                                  context,
                                                  1,
                                                  _pageSize,
                                                  _strCHSelectedWing,
                                                  _strCHSelectedCampus,
                                                  _strCHSelectedRegion,
                                                  "",
                                                  _search.text,
                                                ));
                                                if (_scrollControllerList.positions.isNotEmpty) {
                                                  _scrollControllerList
                                                      .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                }
                                                _allReports.clear();
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
                        if (_campusHangoutItems!.isEmpty)
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
                            onRefresh(
                              context,
                              pageKey,
                              _pageSize,
                              _strCHSelectedWing,
                              _strCHSelectedCampus,
                              _strCHSelectedRegion,
                              _strCHSelectedYear,
                            );
                          },
                          header: const WaterDropMaterialHeader(),
                          controller: _scrollController,
                          child: ListView.builder(
                            controller: _scrollControllerList,
                            itemCount: (_campusHangoutItems?.length ?? 0) + 1,
                            itemBuilder: (context, index) => (_campusHangoutItems!.length == index)
                                ? SizedBox(
                                    height: 40,
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      //FOR ADD SELECTED ITEM
                                      BlocProvider.of<ParamsBloc>(context).add(
                                        CampusHangoutDetailsEvent(
                                          _campusHangoutItems![index],
                                          null,
                                        ),
                                      );
                                      VRouter.of(context).to(ViewHangout.id);
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
                                            percent: (int.parse(Utils().nullSafeWithDefaultString(
                                                    _campusHangoutItems![index]!.average, "0")) /
                                                100),
                                            center: ((double.parse(Utils().nullSafeWithDefaultString(
                                                            _campusHangoutItems![index]!.average, "0")) /
                                                        100) ==
                                                    100)
                                                ? Icon(
                                                    Icons.done_all,
                                                    color: Color(0xff45e588),
                                                    size: 21.6,
                                                  )
                                                : Text(
                                                    "${Utils().nullSafeWithDefaultString(_campusHangoutItems![index]!.average, "0")}%",
                                                    style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                  ),
                                            backgroundColor: Colors.grey.shade300,
                                            radius: 20.88,
                                            lineWidth: 5.4,
                                            linearGradient: LinearGradient(
                                              end: Alignment.topCenter,
                                              begin: Alignment.bottomCenter,
                                              colors: <Color>[
                                                (int.parse(Utils().nullSafeWithDefaultString(
                                                            _campusHangoutItems![index]!.average, "0")) ==
                                                        100)
                                                    ? Color(0xff3AE280)
                                                    : Color(0xffffe69b),
                                                (int.parse(Utils().nullSafeWithDefaultString(
                                                            _campusHangoutItems![index]!.average, "0")) ==
                                                        100)
                                                    ? Color(0xffB0FFD2)
                                                    : Color(0xffFFD1D1),
                                              ],
                                            ),
                                          ),
                                          title: Text(
                                            Utils().nullSafeString(_campusHangoutItems![index]!.year),
                                            style: TextStyle(
                                                fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              ((int.parse(Utils().nullSafeWithDefaultString(
                                                              _campusHangoutItems![index]!.average, "0")) /
                                                          100) <
                                                      1.0)
                                                  ? Text(Utils().nullSafeString(Utils()
                                                          .nullSafeString(_campusHangoutItems![index]!.RegionName) +
                                                      " | " +
                                                      Utils().nullSafeString(_campusHangoutItems![index]!.CenterName) +
                                                      " | " +
                                                      Utils().nullSafeString(_campusHangoutItems![index]!.wingName)))
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(7.2),
                                                        color: Colors.green.shade50,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(3.6),
                                                        child: Text(
                                                          Utils().nullSafeString(Utils().nullSafeString(
                                                                  _campusHangoutItems![index]!.RegionName) +
                                                              " | " +
                                                              Utils().nullSafeString(
                                                                  _campusHangoutItems![index]!.CenterName) +
                                                              " | " +
                                                              Utils().nullSafeString(
                                                                  _campusHangoutItems![index]!.wingName)),
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
                                    _campusHangoutItems!.isEmpty
                                        ? "Showing no results based on filters. "
                                        : ((_search.text.isEmpty)
                                            ? "Showing all ${_totalCampusHangouts.toString()}  result. "
                                            : "Showing all ${_campusHangoutItems!.length}  result. "),
                                    style: TextStyle(
                                      fontSize: 12.6,
                                      color: Color(0xFF4F4F4F),
                                    ),
                                  ),
                                  (isCallBackFilter ?? false)
                                      ? GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              isCallBackFilter = false;
                                            });
                                            if (_search.text.isNotEmpty) {
                                              pageKey = 1;
                                              _showLoadingIndicator();
                                              BlocProvider.of<CampusHangoutReportBloc>(context)
                                                  .add(CampusHangoutReportEvent.campusHangout(
                                                context,
                                                pageKey,
                                                _pageSize,
                                                "",
                                                "",
                                                "",
                                                "",
                                                _search.text,
                                              ));

                                              if (_scrollControllerList.positions.isNotEmpty) {
                                                _scrollControllerList
                                                    .jumpTo(_scrollControllerList.position.minScrollExtent);
                                              }
                                            } else {
                                              _strCHSelectedYear = (DateTime.now().year -
                                                      ((DateTime.now().month >= 1 && DateTime.now().month <= 6)
                                                          ? 1
                                                          : 0))
                                                  .toString();
                                              pageKey = 1;
                                              _showLoadingIndicator();
                                              BlocProvider.of<CampusHangoutReportBloc>(context)
                                                  .add(CampusHangoutReportEvent.campusHangout(
                                                context,
                                                pageKey,
                                                _pageSize,
                                                "",
                                                "",
                                                "",
                                                _strCHSelectedYear,
                                                "",
                                              ));
                                              BlocProvider.of<ParamsBloc>(context).add(
                                                CampusHangoutFiltersEvent(
                                                  "",
                                                  "",
                                                  "",
                                                  "",
                                                ),
                                              );
                                              if (_scrollControllerList.positions.isNotEmpty) {
                                                _scrollControllerList
                                                    .jumpTo(_scrollControllerList.position.minScrollExtent);
                                              }
                                            }
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
                                              builder: (context) => openFilter(),
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
                        // Positioned(
                        //   bottom: (Platform.isIOS)
                        //       ? ScreenSize.height * 0.13
                        //       : 21.96,
                        //   left: 18,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(
                        //           7.2),
                        //     ),
                        //     child: Padding(
                        //       padding: EdgeInsets.all(
                        //         7.2,
                        //       ),
                        //       child: Row(
                        //         children: [
                        //           Text(
                        //             "Showing no results based on filters. ",
                        //             style: TextStyle(
                        //               fontSize: 12.6,
                        //               color: const Color(0xFF4F4F4F),
                        //             ),
                        //           ),
                        //           GestureDetector(
                        //             behavior: HitTestBehavior.opaque,
                        //             onTap: () {
                        //               setState(() {
                        //                 isFilter = false;
                        //               });
                        //
                        //               BlocProvider.of<CampusHangoutReportBloc>(context)
                        //                   .add(CampusHangoutCampusHangoutReportEvent.campusHangout(
                        //                 context,
                        //                 _currentPage,
                        //                 _pageSize,
                        //                 "",
                        //                 "",
                        //                 "",
                        //                 _strCHSelectedYear,
                        //               ));
                        //
                        //               _showLoadingIndicator();
                        //             },
                        //             child: Text(
                        //               "Clear filters",
                        //               style: TextStyle(
                        //                   fontSize:
                        //                   12.6,
                        //                   color: Colors.blue),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
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

  openFilter() {
    showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(14.4),
          topLeft: Radius.circular(14.4),
        ),
      ),
      expand: false,
      context: context,
      builder: (context) => CampusHangoutFilter(
        onSelectFilter: (
          bool callBackFilter,
          String selectedWing,
          String selectedCampus,
          String selectedRegion,
          String selectedYear,
        ) {
          setState(() {
            if (callBackFilter) {
              _allReports.clear();
              if (_scrollControllerList.positions.isNotEmpty) {
                loading = true;
                _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
              }
            }
            isCallBackFilter = callBackFilter;
            _strCHSelectedWing = selectedWing.toString();
            _strCHSelectedCampus = selectedCampus.toString();
            _strCHSelectedRegion = selectedRegion.toString();
            _strCHSelectedYear = selectedYear.toString();
            BlocProvider.of<CampusHangoutReportBloc>(context).add(CampusHangoutReportEvent.campusHangout(
              context,
              1,
              50,
              _strCHSelectedWing,
              _strCHSelectedCampus,
              _strCHSelectedRegion,
              _strCHSelectedYear,
              "",
            ));
            _showLoadingIndicator();
          });
        },
        isCallBackFilter: !checkClearFilter,
      ),
    );
  }

  //region POPUP MENU FOR CREATE REPORT
  void _showCreateReportPopupMenu(Offset offset) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy + 20, 0, 0),
      items: [
        PopupMenuItem<String>(
          child: const Text('Submit Campus Hangout Report'),
          onTap: () {
            VRouter.of(context).to(SubmitCampusHangoutReport.id);
          },
        ),
        PopupMenuItem<String>(
          child: const Text('Create Campus Hangout Report'),
          onTap: () {
            BlocProvider.of<ParamsBloc>(context).add(
              CreateCampusHangoutReportEvent(
                _campusHangoutModel!.search_filter!.campus_region,
              ),
            );
            VRouter.of(context).to(CreateCampusHangoutReport.id);
          },
        ),
      ],
      elevation: 8.0,
    );
  }
}
