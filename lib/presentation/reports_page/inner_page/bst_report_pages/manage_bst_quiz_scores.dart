import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/manage_bst_attendance_report_bloc.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/manage_bst_quiz_score_model.dart';
import 'package:flutter_app/models/manage_bst_report_model.dart';
import 'package:flutter_app/models/save_bst_quiz_score_request_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bst_report_model.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/bst_report_pages/manage_report.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../Bloc/bst_data_update_bloc.dart';
import '../../../../loader.dart';
import '../../../../preferences.dart';
import 'manage_bst_quiz_score_fillters.dart';

class ManageBSTQuizScores extends StatefulWidget {
  static String id = "manageBSTQuizScores";
  static String path = "${ManageReport.path}/$id";

  const ManageBSTQuizScores({Key? key}) : super(key: key);

  @override
  _ManageBSTQuizScoresState createState() => _ManageBSTQuizScoresState();
}

class _ManageBSTQuizScoresState extends State<ManageBSTQuizScores> {
  //FOR PAGINATION
  int _totalBSTQuizScores = 0;
  int _currentPage = 1;
  int pageKey = 1;
  static const _pageSize = 50;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  int _currentIndex = 0;
  int _currentParentIndex = 0;
  String? _peviousSelectedOption = "";
  bool isFilter = false;

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;

  ManageBSTQuizScoreModel? _manageBSTQuizModel;
  List<ManageBSTQuizListDataModel?>? _manageBSTQuizItems = [];
  List<ManageBSTQuizListDataModel?>? _searchItems = [];
  List<ManageBSTQuizListDataModel?>? _allReports = [];

  BSTReportListDataModel? _bstReportItem;
  ManageBSTReportListDataModel? _manageBSTReportListDataModel;
  bool loading = true;

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  //region CHECK FOR WHETHER IS FOR SEARCH

  void onRefresh(
    context,
    id,
    isForEditMode(),
    _strSelectedWing,
    _strSelectedRegion,
    _strSearchUserId,
    _strGroup,
    _strSubGroup,
    _strSchoolYear,
    _strFirstName,
    _strMiddleName,
    _strLastName,
    _currentPage,
    _pageSize,
  ) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _manageBSTQuizItems = [];
    }
    BlocProvider.of<ManageBstAttendanceReportBloc>(context).add(ManageBstAttendanceReportEvent.manageBSTQuizScore(
      context,
      Utils().nullSafeString(_manageBSTReportListDataModel!.id),
      isForEditMode(),
      _strSelectedWing,
      _strSelectedRegion,
      _strSelectedCenter,
      _strSearchUserId,
      _strGroup,
      _strSubGroup,
      _strSchoolYear,
      _strFirstName,
      _strMiddleName,
      _strLastName,
      _currentPage,
      _pageSize,
      "",
    ));
  }

  //region PERFORM SEARCH OPERATIONS ON REPORTS LIST
  void searchOperation() {
    _searchItems!.clear();
    if (_isSearching) {
      for (int i = 0; i < _manageBSTQuizItems!.length; i++) {
        ManageBSTQuizListDataModel manageBSTQuizListDataModel = _manageBSTQuizItems![i]!;
        if (Utils().nullSafeString(manageBSTQuizListDataModel.name).toLowerCase().contains(_searchText.toLowerCase())) {
          _searchItems!.add(manageBSTQuizListDataModel);
        }
      }
    }
  }
  //endregion

  _ManageBSTQuizScoresState() {
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
  String _strSelectedWing = "";
  String _strSelectedRegion = "";
  String _strSelectedCenter = "";
  String _strSearchUserId = "";
  String _strGroup = "";
  String _strSubGroup = "";
  String _strSchoolYear = "";
  String _strFirstName = "";
  String _strMiddleName = "";
  String _strLastName = "";

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
    if (paramsBloc is BSTReportDetailsState) {
      _bstReportItem = paramsBloc.bstReportItem;
      _manageBSTReportListDataModel = paramsBloc.manageBSTReportListDataModel;

      _strSelectedWing = Utils().nullSafeString(_manageBSTReportListDataModel!.wing_id);
      _strSelectedRegion = Utils().nullSafeString(_manageBSTReportListDataModel!.region_id);
    }
    _showLoadingIndicator();
    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(_bstReportItem, _manageBSTReportListDataModel));
    //FOR GET MANAGE BST QUIZ SCORES
    BlocProvider.of<ManageBstAttendanceReportBloc>(context).add(ManageBstAttendanceReportEvent.manageBSTQuizScore(
      context,
      Utils().nullSafeString(_manageBSTReportListDataModel!.id),
      isForEditMode(),
      _strSelectedWing,
      _strSelectedRegion,
      _strSelectedCenter,
      _strSearchUserId,
      _strGroup,
      _strSubGroup,
      _strSchoolYear,
      _strFirstName,
      _strMiddleName,
      _strLastName,
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
        BlocListener<BSTDataUpdateBloc, BSTDataUpdateState>(
          listener: (context, state) {
            state.maybeWhen(
                saveBSTQuizScore: (saveBSTQuizScoreModel, l) {
                  if (l == LoadingStatus.Done) {
                    _hideLoadingIndicator();
                    if (saveBSTQuizScoreModel != null) {
                      if (!saveBSTQuizScoreModel.has_error!) {
                        if (_search.text.isNotEmpty) {
                          _scrollController.requestRefresh();
                          //_pagingController.refresh();
                        }
                      } else {
                        _manageBSTQuizItems![_currentIndex]!.dynamic_field![_currentParentIndex]!.selected =
                            _peviousSelectedOption;
                      }
                    } else {
                      _manageBSTQuizItems![_currentIndex]!.dynamic_field![_currentParentIndex]!.selected =
                          _peviousSelectedOption;
                    }
                  } else {
                    if (l == LoadingStatus.Error) {
                      _hideLoadingIndicator();
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ManageBstAttendanceReportBloc, ManageBstAttendanceReportState>(
          listener: (context, state) {
            state.maybeWhen(
                manageBSTQuizScore: (manageBSTQuizScoreModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _manageBSTQuizItems!.clear();
                    _hideLoadingIndicator();
                    _totalBSTQuizScores = 0;
                    if (manageBSTQuizScoreModel != null && manageBSTQuizScoreModel.bst_quiz_list != null) {
                      _manageBSTQuizModel = manageBSTQuizScoreModel;
                      _totalBSTQuizScores = Utils().nullSafeInt(_manageBSTQuizModel!.bst_quiz_list!.total);

                      if (pageKey == 1) {
                        _allReports!.clear();
                      }
                      if (_manageBSTQuizModel!.bst_quiz_list!.data!.length == _allReports!.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allReports = _manageBSTQuizModel!.bst_quiz_list!.data;
                      _allReports = allReports!
                          .map(
                            (e) => ManageBSTQuizListDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _manageBSTQuizItems!.clear();
                      _manageBSTQuizItems!.addAll(
                        List.from(
                          allReports
                              .map(
                                (e) => ManageBSTQuizListDataModel.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                      // _reportItems!
                      //     .addAll(_reportModel!.sabha_result!.data!);
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
                      _manageBSTQuizItems!.clear();
                      _totalBSTQuizScores = 0;
                    });
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is ManageBSTQuizScoreFiltersState) {
              _strSelectedWing = state.strSelectedWing;
              _strSelectedRegion = state.strSelectedRegion;
              _strSearchUserId = state.strSearchUserId;
              _strGroup = state.strGroup;
              _strSubGroup = state.strSubGroup;
              _strSchoolYear = Utils().nullSafeString(state.strSchoolYear);
              _strFirstName = state.strFirstName;
              _strMiddleName = state.strMiddleName;
              _strLastName = state.strLastName;

              //FOR ADD SELECTED FILTERS
              BlocProvider.of<ParamsBloc>(context).add(ManageBSTQuizScoreFiltersEvent(
                _strSelectedWing,
                _strSelectedRegion,
                _strSearchUserId,
                _strGroup,
                _strSubGroup,
                _strSchoolYear,
                _strFirstName,
                _strMiddleName,
                _strLastName,
              ));

              // _pagingController.refresh();
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
                    bottom: 21.6,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //FOR ADD STATUS FOR UPDATE GOSHTHI REPORTS
                          BlocProvider.of<ParamsBloc>(context).add(UpdateDashBoardEvent(_needToUpdateDashboardReports));
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
                                    "Manage Quiz Score",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 28.8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width: 7.2),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5.124),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text(
                                    "$_totalBSTQuizScores",
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
                                builder: (context) => ManageBSTQuizScoreFilter(
                                  _search.text,
                                  _manageBSTReportListDataModel!.id,
                                  onSelectFilter: (bool isFiltered) {
                                    isFilter = isFiltered;
                                    if (isFilter) {
                                      _showLoadingIndicator();
                                      loading = true;
                                      if (_scrollControllerList.positions.isNotEmpty) {
                                        _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
                                      }
                                    }
                                  },
                                ),
                              );
                            },
                            child: Icon(
                              Icons.sort,
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
                                            });
                                            // _strSelectedCenter = "";
                                            // _strSearchUserId = "";
                                            // _strGroup = "";
                                            // _strSubGroup = "";
                                            // _strSchoolYear = Utils().getCurrentDate("yyyy");
                                            // _strFirstName = "";
                                            // _strMiddleName = "";
                                            // _strLastName = "";
                                            _showLoadingIndicator();

                                            BlocProvider.of<ManageBstAttendanceReportBloc>(context)
                                                .add(ManageBstAttendanceReportEvent.manageBSTQuizScore(
                                              context,
                                              Utils().nullSafeString(_manageBSTReportListDataModel!.id),
                                              isForEditMode(),
                                              _strSelectedWing,
                                              _strSelectedRegion,
                                              _strSelectedCenter,
                                              _strSearchUserId,
                                              _strGroup,
                                              _strSubGroup,
                                              "",
                                              _strFirstName,
                                              _strMiddleName,
                                              _strLastName,
                                              _currentPage,
                                              _pageSize,
                                              "",
                                            ));
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
                                          BlocProvider.of<ManageBstAttendanceReportBloc>(context)
                                              .add(ManageBstAttendanceReportEvent.manageBSTQuizScore(
                                            context,
                                            Utils().nullSafeString(_manageBSTReportListDataModel!.id),
                                            isForEditMode(),
                                            _strSelectedWing,
                                            _strSelectedRegion,
                                            _strSelectedCenter,
                                            _strSearchUserId,
                                            _strGroup,
                                            _strSubGroup,
                                            _strSchoolYear,
                                            _strFirstName,
                                            _strMiddleName,
                                            _strLastName,
                                            _currentPage,
                                            _pageSize,
                                            _search.text,
                                          ));
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
                      // Material(
                      //   color: Colors.transparent,
                      //   elevation: 10.8,
                      //   child: TextField(
                      //     controller: _search,
                      //     onChanged: (val) {
                      //       //VAAPGLKNS RECORDS NOTE
                      //       // searchOperation(val);
                      //
                      //       _searchText = val;
                      //       searchOperation();
                      //     },
                      //     decoration: InputDecoration(
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: Colors.blue,
                      //             width: 1.44),
                      //       ),
                      //       contentPadding: EdgeInsets.symmetric(
                      //           vertical: 10.8),
                      //       fillColor: Colors.white,
                      //       filled: true,
                      //       hintText: "Search for a Report",
                      //       hintStyle: TextStyle(
                      //           fontSize: 14.4),
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //         borderRadius: BorderRadius.circular(
                      //             5.4),
                      //       ),
                      //       prefixIcon: Icon(
                      //         Icons.search,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Stack(
                children: [
                  if (_manageBSTQuizItems!.isEmpty)
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
                        Utils().nullSafeString(_manageBSTReportListDataModel!.id),
                        isForEditMode,
                        _strSelectedWing,
                        _strSelectedRegion,
                        _strSearchUserId,
                        _strGroup,
                        _strSubGroup,
                        _strSchoolYear,
                        _strFirstName,
                        _strMiddleName,
                        _strLastName,
                        pageKey,
                        _pageSize,
                      );
                    },
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                        controller: _scrollControllerList,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: (_manageBSTQuizItems?.length ?? 0) + 1,
                        itemBuilder: (context, index) {
                          return (_manageBSTQuizItems?.length == index)
                              ? SizedBox(
                                  height: 60,
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.6),
                                      child: ExpansionTile(
                                        initiallyExpanded: false,
                                        onExpansionChanged: (val) {
                                          setState(
                                            () {
                                              (_manageBSTQuizItems![index]!).isExpand = val;
                                            },
                                          );
                                        },
                                        collapsedIconColor: Colors.black,
                                        iconColor: Colors.black,
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Utils().nullSafeString(_manageBSTQuizItems![index]!.name) +
                                                  " (" +
                                                  Utils().nullSafeString(
                                                      Utils().nullSafeString(_manageBSTQuizItems![index]!.user_id)) +
                                                  ")",
                                              style: TextStyle(
                                                  fontSize: 16.2,
                                                  color: Color(0xFF4F4F4F),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 3.6),
                                              child: Text(Utils().nullSafeString(Utils()
                                                      .nullSafeString(_manageBSTQuizItems![index]!.RegionName) +
                                                  " | " +
                                                  Utils().nullSafeString(_manageBSTQuizItems![index]!.CenterName) +
                                                  " | " +
                                                  Utils()
                                                      .nullSafeString(_manageBSTQuizItems![index]!.user_group_name))),
                                            ),
                                          ],
                                        ),
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 5.4,
                                                  left: 14.4,
                                                  right: 14.4,
                                                ),
                                                child: Text(Utils().nullSafeString("Grade: " +
                                                    Utils().nullSafeString(_manageBSTQuizItems![index]!.grade))),
                                              ),
                                            ],
                                          ),
                                          ListView(
                                            shrinkWrap: true, //
                                            padding: EdgeInsets.zero,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: List.generate(
                                                    _manageBSTQuizItems![index]!.dynamic_field!.length, (parentIndex) {
                                                  var currentItem =
                                                      _manageBSTQuizItems![index]!.dynamic_field![parentIndex]!;

                                                  var selectedDropdownItem;
                                                  var options = currentItem.options;

                                                  if (options != null) {
                                                    if (Utils().nullSafeString(currentItem.selected).isNotEmpty) {
                                                      final stateIndex = options.indexWhere((element) =>
                                                          element!.id.toString() ==
                                                          Utils().nullSafeString(currentItem.selected));
                                                      if (stateIndex >= 0) {
                                                        selectedDropdownItem = options[stateIndex];
                                                      } else {
                                                        selectedDropdownItem = options[0];
                                                      }
                                                    } else {
                                                      selectedDropdownItem = options[0];
                                                    }
                                                  }

                                                  return (options != null)
                                                      ? Column(
                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                          children: [
                                                            Container(
                                                                margin: EdgeInsets.only(top: 7.32, left: 14.4),
                                                                child: Text(
                                                                  Utils().nullSafeWithDefaultString(
                                                                      currentItem.label, "Quiz ${(parentIndex + 1)}"),
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 10.8,
                                                                      color: Colors.black),
                                                                )),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF2F2F2),
                                                                  borderRadius: BorderRadius.circular(3.6)),
                                                              margin: EdgeInsets.only(
                                                                top: 3.66,
                                                                left: 15.372,
                                                                right: 15.372,
                                                              ),
                                                              child: DropdownButtonHideUnderline(
                                                                child: DropdownButton(
                                                                  itemHeight: null,
                                                                  isExpanded: true,
                                                                  hint: Text(
                                                                    "Select Score".trim(),
                                                                    style: TextStyle(
                                                                      fontSize: 12.6,
                                                                    ),
                                                                  ),
                                                                  value: selectedDropdownItem,
                                                                  onChanged: (newValue) async {
                                                                    final _pref = await Preferences.getInstance();
                                                                    LoginModel? loginModel = await _pref.getToken();

                                                                    setState(() {
                                                                      var selectedDropdownItem =
                                                                          newValue as MBSTQDOptionsModel;
                                                                      _currentIndex = index;
                                                                      _currentParentIndex = parentIndex;
                                                                      _peviousSelectedOption =
                                                                          _manageBSTQuizItems![index]!
                                                                              .dynamic_field![parentIndex]!
                                                                              .selected;
                                                                      _manageBSTQuizItems![index]!
                                                                          .dynamic_field![parentIndex]!
                                                                          .selected = selectedDropdownItem.id;

                                                                      var item = _manageBSTQuizItems![index]!;

                                                                      //FOR SAVE QUIZ SCORE
                                                                      _showLoadingIndicator();
                                                                      var params = SaveBSTQuizScoreRequestModel(
                                                                        Utils().nullSafeString(
                                                                            loginModel!.login_user_type.toString()),
                                                                        Utils().nullSafeString(
                                                                            loginModel.login_parent_type),
                                                                        Utils().nullSafeString(loginModel.role),
                                                                        Utils()
                                                                            .nullSafeInt(loginModel.bkms_id)
                                                                            .toString(),
                                                                        Utils().nullSafeString(
                                                                            _manageBSTReportListDataModel!.id),
                                                                        Utils().nullSafeString(item.user_id),
                                                                        Utils().nullSafeString(item.user_group_name),
                                                                        Utils().nullSafeString(_manageBSTQuizModel!
                                                                            .search_filter!
                                                                            .bst_fall_spring_report_data!
                                                                            .wingName),
                                                                        Utils()
                                                                            .nullSafeString(item.user_school_year_name),
                                                                        item.dynamic_field!.length > 0
                                                                            ? Utils().nullSafeString(
                                                                                item.dynamic_field![0]!.selected)
                                                                            : "",
                                                                        item.dynamic_field!.length > 1
                                                                            ? Utils().nullSafeString(
                                                                                item.dynamic_field![1]!.selected)
                                                                            : "",
                                                                        item.dynamic_field!.length > 2
                                                                            ? Utils().nullSafeString(
                                                                                item.dynamic_field![2]!.selected)
                                                                            : "",
                                                                        item.dynamic_field!.length > 3
                                                                            ? Utils().nullSafeString(
                                                                                item.dynamic_field![3]!.selected)
                                                                            : "",
                                                                        item.dynamic_field!.length > 4
                                                                            ? Utils().nullSafeString(
                                                                                item.dynamic_field![4]!.selected)
                                                                            : "",
                                                                        item.dynamic_field!.length > 5
                                                                            ? Utils().nullSafeString(
                                                                                item.dynamic_field![5]!.selected)
                                                                            : "",
                                                                        item.dynamic_field!.length > 6
                                                                            ? Utils().nullSafeString(
                                                                                item.dynamic_field![6]!.selected)
                                                                            : "",
                                                                      );
                                                                      BlocProvider.of<BSTDataUpdateBloc>(context)
                                                                          .add(BSTDataUpdateEvent.saveBSTQuizScore(
                                                                        context,
                                                                        params,
                                                                      ));
                                                                    });
                                                                  },
                                                                  items: options.map((item) {
                                                                    return DropdownMenuItem(
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          Container(
                                                                              margin: EdgeInsets.only(
                                                                                left: 7.2,
                                                                              ),
                                                                              child: Text(
                                                                                  Utils()
                                                                                      .nullSafeString(item!.value)
                                                                                      .trim(),
                                                                                  style: TextStyle(
                                                                                    fontSize: 12.6,
                                                                                  ))),
                                                                        ],
                                                                      ),
                                                                      value: item,
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Container();
                                                }),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7.32,
                                          ),
                                        ],
                                      ),
                                    ),
                                    /*Divider(
                                          7.32,
                                        ),*/
                                  ],
                                );
                        }),
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
                              _manageBSTQuizItems!.isEmpty
                                  ? "Showing no results based on filters. "
                                  : ((_search.text.isEmpty)
                                      ? "Showing all ${_totalBSTQuizScores.toString()}  result. "
                                      : "Showing all ${_manageBSTQuizItems!.length}  result. "),
                              style: TextStyle(
                                fontSize: 12.6,
                                color: Color(0xFF4F4F4F),
                              ),
                            ),
                            (isFilter)
                                ? GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      isFilter = false;
                                      _showLoadingIndicator();
                                      _strSelectedWing = Utils().nullSafeString(_manageBSTReportListDataModel!.wing_id);
                                      _strSelectedRegion =
                                          Utils().nullSafeString(_manageBSTReportListDataModel!.region_id);
                                      _strSearchUserId = "";
                                      _strGroup = "";
                                      _strSubGroup = "";
                                      _strSchoolYear = "";
                                      _strFirstName = "";
                                      _strMiddleName = "";
                                      _strLastName = "";

                                      //FOR ADD SELECTED FILTERS
                                      if (_search.text.isNotEmpty) {
                                        // BlocProvider.of<ParamsBloc>(context).add(ManageBSTQuizScoreFiltersEvent(
                                        //   _strSelectedWing,
                                        //   _strSelectedRegion,
                                        //   _strSearchUserId,
                                        //   _strGroup,
                                        //   _strSubGroup,
                                        //   _strSchoolYear,
                                        //   _strFirstName,
                                        //   _strMiddleName,
                                        //   _strLastName,
                                        // ));
                                        pageKey = 1;
                                        BlocProvider.of<ManageBstAttendanceReportBloc>(context)
                                            .add(ManageBstAttendanceReportEvent.manageBSTQuizScore(
                                          context,
                                          Utils().nullSafeString(_manageBSTReportListDataModel!.id),
                                          isForEditMode(),
                                          _strSelectedWing,
                                          _strSelectedRegion,
                                          _strSelectedCenter,
                                          _strSearchUserId,
                                          _strGroup,
                                          _strSubGroup,
                                          _strSchoolYear,
                                          _strFirstName,
                                          _strMiddleName,
                                          _strLastName,
                                          _currentPage,
                                          _pageSize,
                                          _search.text,
                                        ));
                                        if (_scrollControllerList.positions.isNotEmpty) {
                                          _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
                                        }
                                      } else {
                                        //   BlocProvider.of<ParamsBloc>(context).add(ManageBSTQuizScoreFiltersEvent(
                                        //     _strSelectedWing,
                                        //     _strSelectedRegion,
                                        //     _strSearchUserId,
                                        //     _strGroup,
                                        //     _strSubGroup,
                                        //     _strSchoolYear,
                                        //     _strFirstName,
                                        //     _strMiddleName,
                                        //     _strLastName,
                                        //   ));
                                        pageKey = 1;
                                        BlocProvider.of<ManageBstAttendanceReportBloc>(context)
                                            .add(ManageBstAttendanceReportEvent.manageBSTQuizScore(
                                          context,
                                          Utils().nullSafeString(_manageBSTReportListDataModel!.id),
                                          isForEditMode(),
                                          _strSelectedWing,
                                          _strSelectedRegion,
                                          _strSelectedCenter,
                                          _strSearchUserId,
                                          _strGroup,
                                          _strSubGroup,
                                          _strSchoolYear,
                                          _strFirstName,
                                          _strMiddleName,
                                          _strLastName,
                                          _currentPage,
                                          _pageSize,
                                          "",
                                        ));
                                        if (_scrollControllerList.positions.isNotEmpty) {
                                          _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
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
                                        builder: (context) => ManageBSTQuizScoreFilter(
                                          _search.text,
                                          _manageBSTReportListDataModel!.id,
                                          onSelectFilter: (bool isFiltered) {
                                            isFilter = isFiltered;
                                            if (isFilter) {
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
      ]),
    );
  }

  //region FOR CHECK WHETHER IS FILTERS PARAMS FILLED OR NOT
  String isForEditMode() {
    if (_strSelectedWing.isNotEmpty) {
      return "2";
    }

    if (_strSelectedRegion.isNotEmpty) {
      return "2";
    }

    if (_strSearchUserId.isNotEmpty) {
      return "2";
    }

    if (_strGroup.isNotEmpty) {
      return "2";
    }

    if (_strSubGroup.isNotEmpty) {
      return "2";
    }

    if (_strSchoolYear.isNotEmpty) {
      return "2";
    }

    if (_strFirstName.isNotEmpty) {
      return "2";
    }

    if (_strMiddleName.isNotEmpty) {
      return "2";
    }

    if (_strLastName.isNotEmpty) {
      return "2";
    }

    return "1";
  }
//endregion
}
