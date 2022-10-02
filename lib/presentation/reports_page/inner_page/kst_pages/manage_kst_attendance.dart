import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/manage_kst_attendance_model.dart';
import 'package:flutter_app/models/manage_kst_report_model.dart';
import 'package:flutter_app/models/take_kst_attendance_request_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../Bloc/kst_data_update_bloc.dart';
import '../../../../Bloc/manage_kst_reports_bloc.dart';
import '../../../../loader.dart';
import '../../../../preferences.dart';
import '../../kst_report_model.dart';
import 'manage_kst_attendance_fillters.dart';
import 'manage_kst_report.dart';

class ManageKSTAttendance extends StatefulWidget {
  static String id = "manageKSTAttendance";
  static String path = "${ManageKSTReport.path}/$id";

  const ManageKSTAttendance({Key? key}) : super(key: key);

  @override
  _ManageKSTAttendanceState createState() => _ManageKSTAttendanceState();
}

class _ManageKSTAttendanceState extends State<ManageKSTAttendance> {
  //FOR PAGINATION
  int _totalKSTReports = 0;
  int _currentPage = 1;
  static const _pageSize = 50;
  int pageKey = 1;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  int _currentIndex = 0;
  int _currentParentIndex = 0;
  String? _previousSelectedOption = "";
  bool checkClearFilter = false;

  bool _isLoading = false;
  bool? isCallBackFilter;
  bool _needToUpdateDashboardReports = false;

  ManageKSTAttendanceModel? _manageKSTAttendanceModel;
  List<ManageKSTAttendanceListDataModel?> _kstReportItems = [];
  List<ManageKSTAttendanceListDataModel?> _searchItems = [];
  List<ManageKSTAttendanceListDataModel?> _allRecords = [];

  KSTReportListDataModel? _kstReportItem;
  ManageKSTReportListDataModel? _manageKSTReportListDataModel;
  bool searchByName = false;

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";
  bool loading = true;

  //region CHECK FOR WHETHER IS FOR SEARCH

  void onRefresh(
    context,
    id,
    isForEditMode(),
    _strSelectedWing,
    _strSelectedCenter,
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
      _kstReportItems = [];
    }

    //FOR GET REPORTS
    BlocProvider.of<ManageKSTReportBloc>(context).add(ManageKSTReportEvent.manageKSTAttendance(
      context,
      id,
      isForEditMode(),
      _strSelectedWing,
      _strSelectedCenter,
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
      "",
    ));
  }

  _ManageKSTAttendanceState() {
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

  //FOR KST REPORT FILTERS
  String _strSelectedWing = "";
  String _strSelectedCenter = "";
  String _strSelectedRegion = "";
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
    if (paramsBloc is KSTReportDetailsState) {
      _kstReportItem = paramsBloc.kstReportListDataModel;
      _manageKSTReportListDataModel = paramsBloc.manageKSTReportListDataModel;

      _strSelectedWing = Utils().nullSafeString(_manageKSTReportListDataModel!.wing_id);
      _strSelectedCenter = Utils().nullSafeString(_manageKSTReportListDataModel!.host_center_id);
      _strSelectedRegion = Utils().nullSafeString(_manageKSTReportListDataModel!.region_id);
    }

    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context)
        .add(KSTReportDetailsEvent(_kstReportItem, _manageKSTReportListDataModel, null, null));
    _showLoadingIndicator();
    //FOR GET MANAGE KST ATTENDANCE
    BlocProvider.of<ManageKSTReportBloc>(context).add(ManageKSTReportEvent.manageKSTAttendance(
      context,
      Utils().nullSafeString(_manageKSTReportListDataModel!.id),
      isForEditMode(),
      _strSelectedWing,
      _strSelectedCenter,
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
      "",
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<KSTDataUpdateBloc, KSTDataUpdateState>(
          listener: (context, state) {
            state.maybeWhen(
                takeKSTAttendance: (takeKSTAttendanceModel, l) {
                  if (l == LoadingStatus.Done) {
                    _hideLoadingIndicator();
                    if (takeKSTAttendanceModel != null) {
                      if (!takeKSTAttendanceModel.has_error!) {
                      } else {
                        _kstReportItems[_currentIndex]!.dynamic_field![_currentParentIndex]!.selected =
                            _previousSelectedOption;
                      }
                    } else {
                      _kstReportItems[_currentIndex]!.dynamic_field![_currentParentIndex]!.selected =
                          _previousSelectedOption;
                    }
                  } else {
                    if (l == LoadingStatus.Error) {
                      setState(() {
                        _hideLoadingIndicator();
                        _kstReportItems.clear();
                        _totalKSTReports = 0;
                      });
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ManageKSTReportBloc, ManageKSTReportState>(
          listener: (context, state) {
            state.maybeWhen(
                manageKSTAttendance: (manageKSTAttendanceModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _kstReportItems.clear();
                    _hideLoadingIndicator();
                    _totalKSTReports = 0;
                    if (manageKSTAttendanceModel != null && manageKSTAttendanceModel.kst_attendance_result != null) {
                      _manageKSTAttendanceModel = manageKSTAttendanceModel;
                      _totalKSTReports = Utils().nullSafeInt(_manageKSTAttendanceModel!.kst_attendance_result!.total);
                      if (_manageKSTAttendanceModel!.kst_attendance_result!.data!.length == _allRecords.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allRecords = _manageKSTAttendanceModel!.kst_attendance_result!.data;
                      _allRecords = allRecords!
                          .map(
                            (e) => ManageKSTAttendanceListDataModel.fromJson(
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
                                (e) => ManageKSTAttendanceListDataModel.fromJson(
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
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is ManageKSTAttendanceFiltersState) {
              _strSelectedWing = state.strSelectedWing;
              _strSelectedCenter = state.strSelectedCenter;
              _strSelectedRegion = state.strSelectedRegion;
              _strSearchUserId = state.strSearchUserId;
              _strGroup = state.strGroup;
              _strSubGroup = state.strSubGroup;
              _strSchoolYear = Utils().nullSafeString(state.strSchoolYear);
              _strFirstName = state.strFirstName;
              _strMiddleName = state.strMiddleName;
              _strLastName = state.strLastName;

              //FOR ADD SELECTED FILTERS
              BlocProvider.of<ParamsBloc>(context).add(ManageKSTAttendanceFiltersEvent(
                _strSelectedWing,
                _strSelectedCenter,
                _strSelectedRegion,
                _strSearchUserId,
                _strGroup,
                _strSubGroup,
                _strSchoolYear,
                _strFirstName,
                _strMiddleName,
                _strLastName,
              ));

              //  _pagingController.refresh();
            }
          },
        ),
      ],
      child: Stack(children: [
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
                                    "Manage Attendance",
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
                              openFilter();
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
                                              isCallBackFilter = false;
                                              searchByName = false;
                                              checkClearFilter = true;
                                              _search.text = "";
                                              pageKey = 1;
                                            });
                                            /*             _strSelectedWing = "";
                                            _strSelectedCenter = "";
                                            _strSelectedRegion = "";
                                            _strSearchUserId = "";
                                            _strGroup = "";
                                            _strSubGroup = "";
                                            _strSchoolYear = "";
                                            _strFirstName = "";
                                            _strMiddleName = "";
                                            _strLastName = "";*/
                                            _showLoadingIndicator();
                                            BlocProvider.of<ManageKSTReportBloc>(context)
                                                .add(ManageKSTReportEvent.manageKSTAttendance(
                                              context,
                                              Utils().nullSafeString(_manageKSTReportListDataModel!.id),
                                              isForEditMode(),
                                              _strSelectedWing,
                                              _strSelectedCenter,
                                              _strSelectedRegion,
                                              _strSearchUserId,
                                              _strGroup,
                                              _strSubGroup,
                                              _strSchoolYear,
                                              _strFirstName,
                                              _strMiddleName,
                                              _strLastName,
                                              1,
                                              _pageSize,
                                              "",
                                            ));
                                            if (_scrollControllerList.positions.isNotEmpty) {
                                              _scrollControllerList
                                                  .jumpTo(_scrollControllerList.position.minScrollExtent);
                                            }
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
                                          loading = true;
                                          _showLoadingIndicator();
                                          BlocProvider.of<ManageKSTReportBloc>(context)
                                              .add(ManageKSTReportEvent.manageKSTAttendance(
                                            context,
                                            Utils().nullSafeString(_manageKSTReportListDataModel!.id),
                                            isForEditMode(),
                                            _strSelectedWing,
                                            _strSelectedCenter,
                                            _strSelectedRegion,
                                            _strSearchUserId,
                                            _strGroup,
                                            _strSubGroup,
                                            _strSchoolYear,
                                            _search.text,
                                            _strMiddleName,
                                            _strLastName,
                                            1,
                                            _pageSize,
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
                        context,
                        _manageKSTReportListDataModel!.id,
                        isForEditMode,
                        _strSelectedWing,
                        _strSelectedCenter,
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
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (_kstReportItems.length) + 1,
                        itemBuilder: (context, index) => (_kstReportItems.length == index)
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
                                            (_kstReportItems[index]!).isExpand = val;
                                          },
                                        );
                                      },
                                      collapsedIconColor: Colors.black,
                                      iconColor: Colors.black,
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Utils().nullSafeString((_kstReportItems[index]!.full_name)) +
                                                " (" +
                                                Utils().nullSafeString(
                                                    Utils().nullSafeString(_kstReportItems[index]!.user_id)) +
                                                ")",
                                            style: TextStyle(
                                                fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 3.6),
                                            child: Text(Utils().nullSafeString(
                                                Utils().nullSafeString(_kstReportItems[index]!.RegionName) +
                                                    " | " +
                                                    Utils().nullSafeString(_kstReportItems[index]!.CenterName) +
                                                    " | " +
                                                    Utils().nullSafeString(_kstReportItems[index]!.group_name))),
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
                                              child: Text(Utils().nullSafeString(
                                                  "Grade: " + Utils().nullSafeString(_kstReportItems[index]!.grade))),
                                            ),
                                          ],
                                        ),
                                        ListView(
                                          shrinkWrap: true, //
                                          padding: EdgeInsets.zero,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: List.generate(_kstReportItems[index]!.dynamic_field!.length,
                                                  (parentIndex) {
                                                var currentItem = _kstReportItems[index]!.dynamic_field![parentIndex]!;

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
                                                                    currentItem.label, "Session ${(parentIndex + 1)}"),
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
                                                                  "Select Status".trim(),
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
                                                                        newValue as MKSTADOptionsModel;
                                                                    _currentIndex = index;
                                                                    _currentParentIndex = parentIndex;
                                                                    _previousSelectedOption = _kstReportItems[index]!
                                                                        .dynamic_field![parentIndex]!
                                                                        .selected;
                                                                    _kstReportItems[index]!
                                                                        .dynamic_field![parentIndex]!
                                                                        .selected = selectedDropdownItem.id;

                                                                    var item = _kstReportItems[index]!;

                                                                    //FOR TAKE KST ATTENDANCE
                                                                    _showLoadingIndicator();
                                                                    var params = TakeKSTAttendanceRequestModel(
                                                                      Utils().nullSafeString(
                                                                          loginModel!.login_user_type.toString()),
                                                                      Utils()
                                                                          .nullSafeString(loginModel.login_parent_type),
                                                                      Utils().nullSafeString(loginModel.role),
                                                                      Utils()
                                                                          .nullSafeInt(loginModel.bkms_id)
                                                                          .toString(),
                                                                      Utils().nullSafeString(
                                                                          _manageKSTReportListDataModel!.id),
                                                                      Utils().nullSafeString(item.user_id),
                                                                      Utils().nullSafeString(item.group_name),
                                                                      Utils().nullSafeString(_manageKSTAttendanceModel!
                                                                          .kst_attendance_filter!
                                                                          .kst_manage_report_data!
                                                                          .wingName),
                                                                      Utils().nullSafeString(item.grade),
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
                                                                    );
                                                                    BlocProvider.of<KSTDataUpdateBloc>(context)
                                                                        .add(KSTDataUpdateEvent.takeKSTAttendance(
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
                              )),
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
                              _kstReportItems.isEmpty
                                  ? "Showing no results based on filters. "
                                  : ((_search.text.isEmpty)
                                      ? "Showing all ${_totalKSTReports.toString()}  result. "
                                      : "Showing all ${_kstReportItems.length}  result. "),
                              style: TextStyle(
                                fontSize: 12.6,
                                color: const Color(0xFF4F4F4F),
                              ),
                            ),
                            (isCallBackFilter ?? false)
                                ? GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      setState(() {
                                        isCallBackFilter = false;
                                        loading = true;
                                      });

                                      _strSearchUserId = "";
                                      _strGroup = "";
                                      _strSubGroup = "";
                                      _strSchoolYear = "";
                                      _strFirstName = "";
                                      _strMiddleName = "";
                                      _strLastName = "";

                                      if (_search.text.isEmpty) {
                                        _showLoadingIndicator();
                                        BlocProvider.of<ManageKSTReportBloc>(context)
                                            .add(ManageKSTReportEvent.manageKSTAttendance(
                                          context,
                                          Utils().nullSafeString(_manageKSTReportListDataModel!.id),
                                          isForEditMode(),
                                          _strSelectedWing,
                                          _strSelectedCenter,
                                          _strSelectedRegion,
                                          _strSearchUserId,
                                          _strGroup,
                                          _strSubGroup,
                                          _strSchoolYear,
                                          _strFirstName,
                                          _strMiddleName,
                                          _strLastName,
                                          1,
                                          _pageSize,
                                          "",
                                        ));
                                      } else {
                                        _showLoadingIndicator();
                                        BlocProvider.of<ManageKSTReportBloc>(context)
                                            .add(ManageKSTReportEvent.manageKSTAttendance(
                                          context,
                                          Utils().nullSafeString(_manageKSTReportListDataModel!.id),
                                          isForEditMode(),
                                          _strSelectedWing,
                                          _strSelectedCenter,
                                          _strSelectedRegion,
                                          _strSearchUserId,
                                          _strGroup,
                                          _strSubGroup,
                                          _strSchoolYear,
                                          _search.text,
                                          _strMiddleName,
                                          _strLastName,
                                          1,
                                          _pageSize,
                                          _search.text,
                                        ));
                                        if (_scrollControllerList.positions.isNotEmpty) {
                                          _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
                                        }
                                      }
                                    },
                                    child: Text(
                                      "Clear Filters",
                                      style: TextStyle(fontSize: 12.6, color: Colors.blue),
                                    ),
                                  )
                                : GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      openFilter();
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

    if (_strSelectedCenter.isNotEmpty) {
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
      builder: (context) => ManageKSTAttendanceFilter(
        onSelectFilter: (
          bool callBackFilter,
          String selectedWing,
          String selectedCenter,
          String selectedRegion,
          String selectedSearchUserId,
          String selectedUserGroup,
          String selectedSubGroup,
          String selectedSchoolYear,
          String firstName,
          String middleName,
          String lastName,
        ) {
          setState(() {
            if (callBackFilter) {
              _allRecords.clear();
              if (_scrollControllerList.positions.isNotEmpty) {
                loading = true;
                _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
              }
            }
            isCallBackFilter = callBackFilter;
            _strSelectedWing = selectedWing;
            _strSelectedCenter = selectedCenter;
            _strSelectedRegion = selectedRegion;
            _strSearchUserId = selectedSearchUserId;
            _strGroup = selectedUserGroup;
            _strSubGroup = selectedSubGroup;
            _strSchoolYear = selectedSchoolYear;
            _strFirstName = firstName;
            _strMiddleName = middleName;
            _strLastName = lastName;
            (_search.text.isNotEmpty)
                ? BlocProvider.of<ManageKSTReportBloc>(context).add(
                    ManageKSTReportEvent.manageKSTAttendance(
                      context,
                      Utils().nullSafeString(_manageKSTReportListDataModel!.id),
                      isForEditMode(),
                      _strSelectedWing,
                      _strSelectedCenter,
                      _strSelectedRegion,
                      _strSearchUserId,
                      _strGroup,
                      _strSubGroup,
                      _strSchoolYear,
                      _search.text,
                      _strMiddleName,
                      _strLastName,
                      1,
                      50,
                      _search.text,
                    ),
                  )
                : BlocProvider.of<ManageKSTReportBloc>(context).add(
                    ManageKSTReportEvent.manageKSTAttendance(
                      context,
                      Utils().nullSafeString(_manageKSTReportListDataModel!.id),
                      isForEditMode(),
                      _strSelectedWing,
                      _strSelectedCenter,
                      _strSelectedRegion,
                      _strSearchUserId,
                      _strGroup,
                      _strSubGroup,
                      _strSchoolYear,
                      _strFirstName,
                      _strMiddleName,
                      _strLastName,
                      1,
                      50,
                      "",
                    ),
                  );
            _showLoadingIndicator();
          });
        },
        isCallBackFilter: !checkClearFilter,
      ),
    );
  }
}
