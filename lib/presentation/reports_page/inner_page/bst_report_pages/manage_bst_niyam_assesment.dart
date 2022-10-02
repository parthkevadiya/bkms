import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/bst_report_bloc.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/manage_bst_niyam_assesment_model.dart';
import 'package:flutter_app/models/update_bst_niyam_assesment_score_request_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bst_report_model.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../Bloc/bst_data_update_bloc.dart';
import '../../../../Bloc/manage_niyam_report_bloc.dart';
import '../../../../loader.dart';
import '../../../../preferences.dart';
import '../bst_report.dart';
import 'manage_bst_niyam_assesment_fillters.dart';

class ManageBSTNiyamAssesment extends StatefulWidget {
  static String id = "manageBSTNiyamAssesment";
  static String path = "${BSTReport.path}/$id";
  final bool route;
  ManageBSTNiyamAssesment({Key? key, required this.route}) : super(key: key);

  @override
  _ManageBSTNiyamAssesmentState createState() => _ManageBSTNiyamAssesmentState();
}

class _ManageBSTNiyamAssesmentState extends State<ManageBSTNiyamAssesment> {
  bool isFilter = false;
  //FOR PAGINATION
  int _totalBSTNiyamAssesments = 0;
  int _currentPage = 1;
  static const _pageSize = 50;
  // final PagingController<int, MNAListDataModel> _pagingController =
  //     PagingController(firstPageKey: 1);

  int _currentIndex = 0;
  int _currentParentIndex = 0;
  String? _peviousSelectedOption = "";

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;

  ManageBSTNiyamAssesmentModel? _manageBSTNiyamAssesmentModel;
  List<MNAListDataModel?>? _bstNiyamAssesmentDataItems = [];
  List<MNAListDataModel?>? _allRecords = [];
  List<MNAListDataModel?>? _searchItems = [];
  ScrollController _scrollControllerList = ScrollController();

  BSTReportListDataModel? _bstReportItem;

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  //region CHECK FOR WHETHER IS FOR SEARCH
  // bool isForSearch() {
  //   return _searchItems!.length != 0 || _searchText.isNotEmpty;
  // }

  //region PERFORM SEARCH OPERATIONS
  void searchOperation() {
    _searchItems!.clear();
    if (_isSearching) {
      for (int i = 0; i < _bstNiyamAssesmentDataItems!.length; i++) {
        MNAListDataModel mnaListDataModel = _bstNiyamAssesmentDataItems![i]!;
        if (Utils().nullSafeString(mnaListDataModel.full_name).toLowerCase().contains(_searchText.toLowerCase())) {
          _searchItems!.add(mnaListDataModel);
        }
      }
    }
  }
  //endregion

  _ManageBSTNiyamAssesmentState() {
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

  //FOR BST FILTERS
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

  final RefreshController _scrollController = RefreshController();
  bool loading = true;
  void onRefresh(
      context,
      bstReportItemId,
      // isForEditMode(),
      strSelectedWing,
      strSelectedRegion,
      strSelectedCenter,
      strSearchUserId,
      strGroup,
      strSubGroup,
      strSchoolYear,
      strFirstName,
      strMiddleName,
      strLastName,
      pageKey,
      pageSize,
      val) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _bstNiyamAssesmentDataItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<ManageNiyamReportBloc>(context).add(ManageNiyamReportEvent.manageBSTNiyamAssesment(
      context,
      bstReportItemId,
      isForEditMode(),
      strSelectedWing,
      strSelectedRegion,
      strSelectedCenter,
      strSearchUserId,
      strGroup,
      strSubGroup,
      strSchoolYear,
      strFirstName,
      strMiddleName,
      strLastName,
      pageKey,
      pageSize,
      "",
    ));
  }

  @override
  void initState() {
    _showLoadingIndicator();
    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(_bstReportItem, null));
    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is BSTReportDetailsState) {
      _bstReportItem = paramsBloc.bstReportItem;

      _strSelectedWing = Utils().nullSafeString(_bstReportItem!.wing_id);
      _strSelectedRegion = Utils().nullSafeString(_bstReportItem!.region_id);
    }
    //FOR GET MANAGE BST NIYAM ASSESMENTS
    _showLoadingIndicator();
    BlocProvider.of<ManageNiyamReportBloc>(context).add(ManageNiyamReportEvent.manageBSTNiyamAssesment(
      context,
      Utils().nullSafeString(_bstReportItem!.id),
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
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BSTDataUpdateBloc, BSTDataUpdateState>(
            listener: (context, state) {
              state.maybeWhen(
                  updateBSTNiyamAssesmentScore: (updateBSTNiyamAssesmentScoreModel, l) {
                    if (l == LoadingStatus.Done) {
                      _hideLoadingIndicator();
                      if (updateBSTNiyamAssesmentScoreModel != null) {
                        if (!updateBSTNiyamAssesmentScoreModel.has_error!) {
                          if (_search.text.isNotEmpty) {
                            _scrollController.requestRefresh();
                          }
                        } else {
                          _bstNiyamAssesmentDataItems![_currentIndex]!.dynamic_field![_currentParentIndex]!.selected =
                              _peviousSelectedOption;
                        }
                      } else {
                        _bstNiyamAssesmentDataItems![_currentIndex]!.dynamic_field![_currentParentIndex]!.selected =
                            _peviousSelectedOption;
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
          BlocListener<ManageNiyamReportBloc, ManageNiyamReportState>(
            listener: (context, state) {
              state.maybeWhen(
                  manageBSTNiyamAssesment: (manageBSTNiyamAssesmentModel, l) async {
                    if (l == LoadingStatus.Done) {
                      _bstNiyamAssesmentDataItems!.clear();
                      _hideLoadingIndicator();
                      _totalBSTNiyamAssesments = 0;

                      if (manageBSTNiyamAssesmentModel != null &&
                          manageBSTNiyamAssesmentModel.bst_niyam_assessment_result != null) {
                        _manageBSTNiyamAssesmentModel = manageBSTNiyamAssesmentModel;
                        _totalBSTNiyamAssesments =
                            Utils().nullSafeInt(_manageBSTNiyamAssesmentModel!.bst_niyam_assessment_result!.total);

                        if (_manageBSTNiyamAssesmentModel!.bst_niyam_assessment_result!.data!.length ==
                            _allRecords!.length) {
                          setState(() {
                            loading = false;
                          });
                        } else {
                          _scrollController.loadComplete();
                        }
                        final allRecords = _manageBSTNiyamAssesmentModel!.bst_niyam_assessment_result!.data;
                        _allRecords = allRecords!
                            .map(
                              (e) => MNAListDataModel.fromJson(
                                jsonDecode(
                                  jsonEncode(e),
                                ),
                              ),
                            )
                            .toList();
                        _bstNiyamAssesmentDataItems!.clear();
                        _bstNiyamAssesmentDataItems!.addAll(
                          List.from(
                            allRecords
                                .map(
                                  (e) => MNAListDataModel.fromJson(
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
                        _bstNiyamAssesmentDataItems!.clear();
                        _totalBSTNiyamAssesments = 0;
                      });
                    }
                    // if (manageBSTNiyamAssesmentModel != null) {
                    //   if (manageBSTNiyamAssesmentModel
                    //           .bst_niyam_assessment_result !=
                    //       null) {
                    //     _manageBSTNiyamAssesmentModel =
                    //         manageBSTNiyamAssesmentModel;
                    //     _totalBSTNiyamAssesments = Utils().nullSafeInt(
                    //         _manageBSTNiyamAssesmentModel!
                    //             .bst_niyam_assessment_result!.total);
                    //     _bstNiyamAssesmentDataItems!.addAll(
                    //         _manageBSTNiyamAssesmentModel!
                    //             .bst_niyam_assessment_result!.data!);
                    //
                    //     var isLastPage =
                    //         _bstNiyamAssesmentDataItems!.length < _pageSize;
                    //
                    //     List<MNAListDataModel> newItems = [];
                    //     if (_manageBSTNiyamAssesmentModel!
                    //             .bst_niyam_assessment_result!.data !=
                    //         null) {
                    //       for (var v = 0;
                    //           v <
                    //               _manageBSTNiyamAssesmentModel!
                    //                   .bst_niyam_assessment_result!
                    //                   .data!
                    //                   .length;
                    //           v++) {
                    //         newItems.add(_manageBSTNiyamAssesmentModel!
                    //             .bst_niyam_assessment_result!.data![v]!);
                    //       }
                    //     }
                    //
                    //     if (isLastPage) {
                    //       _pagingController.appendLastPage(newItems);
                    //     } else {
                    //       // final nextPageKey = _currentPage + newItems.length;
                    //       final nextPageKey = _currentPage + 1;
                    //       _pagingController.appendPage(newItems, nextPageKey);
                    //     }
                    //   }
                    // }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<ParamsBloc, ParamsState>(
            listener: (context, state) {
              if (state is ManageBSTNiyamAssesmentFiltersState) {
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
                BlocProvider.of<ParamsBloc>(context).add(ManageBSTNiyamAssesmentFiltersEvent(
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
                ));

                // _pagingController.refresh();
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
                                //FOR ADD STATUS FOR UPDATE REPORTS
                                if (widget.route) {
                                  BlocProvider.of<ParamsBloc>(context)
                                      .add(UpdateDashBoardEvent(true /*_needToUpdateDashboardReports*/));
                                } else {
                                  BlocProvider.of<BSTReportBloc>(context).add(
                                    BSTReportEvent.loadBSTReports(context, "", "", "", "", 1, _pageSize, ""),
                                  );
                                }
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
                                          "Manage Niyam Assesment",
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
                                          "$_totalBSTNiyamAssesments",
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
                                      builder: (context) => ManageBSTNiyamAssesmentFilter(
                                        _search.text,
                                        manageBSTNiyamId: Utils().nullSafeString(_bstReportItem!.id),
                                        onSelectFilter: (bool isFiltered) {
                                          _showLoadingIndicator();
                                          isFilter = isFiltered;
                                          if (isFilter) {
                                            loading = true;
                                            _currentPage = 1;
                                            if (_scrollControllerList.positions.isNotEmpty) {
                                              _scrollControllerList
                                                  .jumpTo(_scrollControllerList.position.minScrollExtent);
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
                                                    _currentPage = 1;
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

                                                  BlocProvider.of<ManageNiyamReportBloc>(context)
                                                      .add(ManageNiyamReportEvent.manageBSTNiyamAssesment(
                                                    context,
                                                    Utils().nullSafeString(_bstReportItem!.id),
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
                                                _currentPage = 1;
                                                _showLoadingIndicator();
                                                BlocProvider.of<ManageNiyamReportBloc>(context)
                                                    .add(ManageNiyamReportEvent.manageBSTNiyamAssesment(
                                                  context,
                                                  Utils().nullSafeString(_bstReportItem!.id),
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
                                                  _search.text,
                                                ));
                                                if (_scrollControllerList.positions.isNotEmpty) {
                                                  _scrollControllerList
                                                      .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                }
                                                _allRecords!.clear();
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
                        if (_bstNiyamAssesmentDataItems!.isEmpty)
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
                            _currentPage++;
                            onRefresh(
                                context,
                                Utils().nullSafeString(_bstReportItem!.id),
                                //isForEditMode(),
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
                                false);
                          },
                          header: const WaterDropMaterialHeader(),
                          controller: _scrollController,
                          child: ListView.builder(
                            controller: _scrollControllerList,
                            shrinkWrap: true,
                            itemCount: (_bstNiyamAssesmentDataItems?.length ?? 0) + 1,
                            itemBuilder: (context, index) {
                              return (_bstNiyamAssesmentDataItems!.length == index)
                                  ? SizedBox(
                                      height: 60,
                                    )
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 3.6,
                                          ),
                                          child: ExpansionTile(
                                            initiallyExpanded: false,
                                            onExpansionChanged: (val) {
                                              setState(
                                                () {
                                                  _bstNiyamAssesmentDataItems![index]!.isExpand = val;
                                                },
                                              );
                                            },
                                            collapsedIconColor: Colors.black,
                                            iconColor: Colors.black,
                                            title: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Utils().nullSafeString(
                                                          _bstNiyamAssesmentDataItems![index]!.full_name) +
                                                      " (" +
                                                      Utils().nullSafeString(Utils().nullSafeString(
                                                          _bstNiyamAssesmentDataItems![index]!.user_id)) +
                                                      ")",
                                                  style: TextStyle(
                                                      fontSize: 16.2,
                                                      color: Color(0xFF4F4F4F),
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 3.6),
                                                  child: Text(Utils().nullSafeString(Utils().nullSafeString(
                                                          _bstNiyamAssesmentDataItems![index]!.RegionName) +
                                                      " | " +
                                                      Utils().nullSafeString(
                                                          _bstNiyamAssesmentDataItems![index]!.CenterName) +
                                                      " | " +
                                                      Utils().nullSafeString(
                                                          _bstNiyamAssesmentDataItems![index]!.group_name))),
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
                                                        Utils().nullSafeString(
                                                            _bstNiyamAssesmentDataItems![index]!.grade))),
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
                                                        _bstNiyamAssesmentDataItems![index]!.dynamic_field!.length,
                                                        (parentIndex) {
                                                      var currentItem = _bstNiyamAssesmentDataItems![index]!
                                                          .dynamic_field![parentIndex]!;

                                                      var selectedDropdownItem;
                                                      var options = currentItem.option;

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
                                                                          currentItem.label,
                                                                          "Score ${(parentIndex + 1)}"),
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
                                                                              newValue as MNADFOptionsModel;
                                                                          _currentIndex = index;
                                                                          _currentParentIndex = parentIndex;
                                                                          _peviousSelectedOption =
                                                                              _bstNiyamAssesmentDataItems![index]!
                                                                                  .dynamic_field![parentIndex]!
                                                                                  .selected;
                                                                          _bstNiyamAssesmentDataItems![index]!
                                                                              .dynamic_field![parentIndex]!
                                                                              .selected = selectedDropdownItem.id;

                                                                          var item =
                                                                              _bstNiyamAssesmentDataItems![index]!;

                                                                          //FOR UPDATE NIYAM ASSESMENT SCORE
                                                                          _showLoadingIndicator();
                                                                          var params =
                                                                              UpdateBSTNiyamAssesmentScoreRequestModel(
                                                                            Utils().nullSafeString(
                                                                                loginModel!.login_user_type.toString()),
                                                                            Utils().nullSafeString(
                                                                                loginModel.login_parent_type),
                                                                            Utils().nullSafeString(loginModel.role),
                                                                            Utils()
                                                                                .nullSafeInt(loginModel.bkms_id)
                                                                                .toString(),
                                                                            Utils().nullSafeString(_bstReportItem!.id),
                                                                            Utils().nullSafeString(item.user_id),
                                                                            Utils().nullSafeString(item.group_name),
                                                                            Utils().nullSafeString(
                                                                                _manageBSTNiyamAssesmentModel!
                                                                                    .search_filter!
                                                                                    .bst_report_data!
                                                                                    .wingName),
                                                                            Utils().nullSafeString(
                                                                                item.user_school_year_name),
                                                                            item.dynamic_field!.length > 0
                                                                                ? Utils().nullSafeString(
                                                                                    item.dynamic_field![0]!.selected)
                                                                                : "",
                                                                            item.dynamic_field!.length > 1
                                                                                ? Utils().nullSafeString(
                                                                                    item.dynamic_field![1]!.selected)
                                                                                : "",
                                                                          );
                                                                          BlocProvider.of<BSTDataUpdateBloc>(context)
                                                                              .add(BSTDataUpdateEvent
                                                                                  .updateBSTNiyamAssesmentScore(
                                                                            context,
                                                                            params,
                                                                          ));
                                                                        });
                                                                      },
                                                                      items: options.map((item) {
                                                                        return DropdownMenuItem(
                                                                          child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
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
                                    _bstNiyamAssesmentDataItems!.isEmpty
                                        ? "Showing no results based on filters. "
                                        : ((_search.text.isEmpty)
                                            ? "Showing all ${_totalBSTNiyamAssesments.toString()}  result. "
                                            : "Showing all ${_bstNiyamAssesmentDataItems!.length}  result. "),
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
                                              _strSearchUserId = "";
                                              _strGroup = "";
                                              _strSubGroup = "";
                                              _strSchoolYear = "";
                                              _strFirstName = "";
                                              _strMiddleName = "";
                                              _strLastName = "";
                                              if (_search.text.isNotEmpty) {
                                                _currentPage = 1;
                                                _showLoadingIndicator();
                                                BlocProvider.of<ManageNiyamReportBloc>(context)
                                                    .add(ManageNiyamReportEvent.manageBSTNiyamAssesment(
                                                  context,
                                                  Utils().nullSafeString(_bstReportItem!.id),
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
                                                BlocProvider.of<ParamsBloc>(context)
                                                    .add(ManageBSTNiyamAssesmentFiltersEvent(
                                                  "",
                                                  "",
                                                  "",
                                                  "",
                                                  "",
                                                  "",
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
                                                _currentPage = 1;
                                                _showLoadingIndicator();
                                                BlocProvider.of<ManageNiyamReportBloc>(context)
                                                    .add(ManageNiyamReportEvent.manageBSTNiyamAssesment(
                                                  context,
                                                  Utils().nullSafeString(_bstReportItem!.id),
                                                  isForEditMode(),
                                                  _strSelectedWing,
                                                  _strSelectedRegion,
                                                  _strSelectedCenter,
                                                  _strSearchUserId,
                                                  _strGroup,
                                                  _strSubGroup,
                                                  _strSchoolYear,
                                                  "",
                                                  "",
                                                  "",
                                                  _currentPage,
                                                  _pageSize,
                                                  "",
                                                ));
                                                BlocProvider.of<ParamsBloc>(context)
                                                    .add(ManageBSTNiyamAssesmentFiltersEvent(
                                                  "",
                                                  "",
                                                  "",
                                                  "",
                                                  "",
                                                  "",
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
                                              builder: (context) => ManageBSTNiyamAssesmentFilter(
                                                _search.text,
                                                manageBSTNiyamId: Utils().nullSafeString(_bstReportItem!.id),
                                                onSelectFilter: (
                                                  bool isFiltered,
                                                ) {
                                                  setState(() {
                                                    _showLoadingIndicator();
                                                    isFilter = isFiltered;
                                                    if (isFilter) {
                                                      loading = true;
                                                      _currentPage = 1;
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
