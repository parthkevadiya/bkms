import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/karyakar_goshthi_report_bloc.dart';
import 'package:flutter_app/models/goshthi_report_attendance_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/update_goshthi_held_status_request_model.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../Bloc/goshthi_data_update_bloc.dart';
import '../../../../Bloc/goshthi_report_attendance_bloc.dart';
import '../../../../loader.dart';
import '../../../../preferences.dart';
import '../goshthi_attendance_fillters.dart';
import '../karyakar_goshti_report.dart';

class GoshthiReportAll extends StatefulWidget {
  static String id = "goshthiReportAll";
  static String path = "${KaryakarGoshtiReport.path}/$id";
  // final double question;
  double? questionsCurrentProgress;
  final bool route;
  GoshthiReportAll({
    Key? key,
    required this.questionsCurrentProgress,
    required this.route,
  }) : super(key: key);
  @override
  _GoshthiReportAllState createState() => _GoshthiReportAllState();
}

class _GoshthiReportAllState extends State<GoshthiReportAll> with TickerProviderStateMixin {
  // double _questionsCurrentProgress = 0;
  double _totalProgress = 1.0;

  List<GoshthiAttendanceDataModel?>? _goshthiAttendanceItems = [];
  List<GoshthiAttendanceDataModel?> _allRecords = [];
  ScrollController _scrollControllerList = ScrollController();

  String _karyakar_goshti_sabha_id = "";
  String _strSabhaDate = "";
  String _strWing = "";
  String _strCenter = "";
  String _strRegion = "";
  String _strSabhaLabel = "";
  String _strGender = "";
  String _strGoshthiHeld = "";

  String _strSelectedUserWing = "";
  String _strSelectedGoshthiDate = "";
  String _strSelectedGoshthiRegion = "";
  String _strSelectedGoshthiCenter = "";
  String _strSelectedGender = "";
  String _strSelectedGoshthiMonth = "";

  int _currentIndex = 0;

  //FOR MANAGE VISIBILITY
  bool _isSearchHasToVisible = false;
  bool _isAttendanceHasToVisible = false;

  //FOR PAGINATION
  int _currentPage = 1;
  int _totalRecords = 0;
  final int _pageSize = 50;
  int pageKey = 1;
  bool loading = true;
  bool isFilter = false;
  bool searchByName = false;

  final RefreshController _scrollController = RefreshController();

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  GoshthiReportAttendanceModel? _goshthiReportAttendanceModel;

  String _strSabhaMonth = Utils().getCurrentDate("MMMM");
  String _strSabhaYear = Utils().getCurrentDate("yyyy");

  String _checkFilter = /*"1"*/ "2";

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;
  void onRefresh(
    context,
    _karyakar_goshti_sabha_id,
    currentPage,
    pageSize,
    _searchText,
    _strSelectedUserWing,
    _strSelectedGoshthiCenter,
    _strSelectedGoshthiRegion,
    _checkFilter,
    _strSelectedGender,
  ) {
    currentPage = pageKey;
    if (pageKey == 1) {
      _goshthiAttendanceItems = [];
    }
    BlocProvider.of<GoshthiReportAttendanceBloc>(context).add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
      context,
      _karyakar_goshti_sabha_id,
      currentPage.toString(),
      pageSize.toString(),
      _searchText,
      _strSelectedUserWing,
      _strSelectedGoshthiCenter,
      _strSelectedGoshthiRegion,
      _checkFilter,
      _strSelectedGender,
    ));
  }

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
    _checkFilter = /*"1"*/ "2";

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;

    if (paramsBloc is GoshthiReportDetailsState) {
      _karyakar_goshti_sabha_id = paramsBloc.karyakar_goshti_sabha_id;
      _strSabhaDate = paramsBloc.strSabhaDate;
      _strWing = paramsBloc.strWing;
      _strCenter = paramsBloc.strCenter;
      _strRegion = paramsBloc.strRegion;
      _strSabhaLabel = paramsBloc.strSabhaLabel;
      _strGender = paramsBloc.strGender;
      _strGoshthiHeld = paramsBloc.strGoshthiHeld;
    }

    _isAttendanceHasToVisible = _strGoshthiHeld == "1";

    if (_isAttendanceHasToVisible) {
      _showLoadingIndicator();
      //FOR GET GOSHTHI REPORTS QUESTIONS
      BlocProvider.of<GoshthiReportAttendanceBloc>(context).add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
        context,
        _karyakar_goshti_sabha_id,
        "$_currentPage",
        "$_pageSize",
        _search.text,
        Utils().nullSafeWithDefaultString(_strSelectedUserWing, _strWing),
        Utils().nullSafeWithDefaultString(_strSelectedGoshthiCenter, _strCenter),
        Utils().nullSafeWithDefaultString(_strSelectedGoshthiRegion, _strRegion),
        _checkFilter,
        Utils().nullSafeWithDefaultString(_strSelectedGender, _strGender).toLowerCase(),
      ));
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var pstate = BlocProvider.of<ParamsBloc>(context).state;
        var stste = pstate is GoshthiReportDetailsState ? pstate.saveState : null;
        BlocProvider.of<ParamsBloc>(context).add(SaveEvent(stste));
        return true;
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<GoshthiDataUpdateBloc, GoshthiDataUpdateState>(
            listener: (context, state) {
              state.maybeWhen(
                  updateGoshthiHeldStatus: (updateGoshthiHeldStatusModel) {
                    setState(() {
                      if (updateGoshthiHeldStatusModel != null) {
                        if (updateGoshthiHeldStatusModel.has_error!) {
                          _strGoshthiHeld = _strGoshthiHeld == "1" ? "0" : "1";
                        }
                      } else {
                        _strGoshthiHeld = _strGoshthiHeld == "1" ? "0" : "1";
                      }

                      _isAttendanceHasToVisible = _strGoshthiHeld == "1";
                      _needToUpdateDashboardReports = true;
                    });
                  },
                  submitGoshthiReportAttendance: (submitGoshthiReportAttendanceModel, l) {
                    if (l == LoadingStatus.Done) {
                      if (submitGoshthiReportAttendanceModel != null) {
                        _hideLoadingIndicator();
                        if (submitGoshthiReportAttendanceModel.has_error!) {
                          _goshthiAttendanceItems![_currentIndex]!.status =
                              Utils().nullSafeString(_goshthiAttendanceItems![_currentIndex]!.status) == "present"
                                  ? "absent"
                                  : "present";
                        }
                      } else {
                        _goshthiAttendanceItems![_currentIndex]!.status =
                            Utils().nullSafeString(_goshthiAttendanceItems![_currentIndex]!.status) == "present"
                                ? "absent"
                                : "present";
                      }
                    } else {
                      if (l == LoadingStatus.Error) {
                        setState(() {
                          _hideLoadingIndicator();
                          _goshthiAttendanceItems!.clear();
                          _totalRecords = 0;
                        });
                      }
                    }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<GoshthiReportAttendanceBloc, GoshthiReportAttendanceState>(
            listener: (context, state) {
              state.maybeWhen(
                  goshthiReportAttendance: (goshthiReportAttendanceModel, l) {
                    if (l == LoadingStatus.Done) {
                      _goshthiAttendanceItems!.clear();
                      _hideLoadingIndicator();
                      _totalRecords = 0;
                      if (goshthiReportAttendanceModel != null &&
                          goshthiReportAttendanceModel.attendance_result != null) {
                        _goshthiReportAttendanceModel = goshthiReportAttendanceModel;
                        _totalRecords = Utils().nullSafeInt(goshthiReportAttendanceModel.attendance_result!.total);

                        if (_goshthiReportAttendanceModel!.attendance_result!.data!.length == _allRecords.length) {
                          setState(() {
                            loading = false;
                          });
                        } else {
                          _scrollController.loadComplete();
                        }
                        final allRecords = _goshthiReportAttendanceModel!.attendance_result!.data;
                        _allRecords = allRecords!
                            .map(
                              (e) => GoshthiAttendanceDataModel.fromJson(
                                jsonDecode(
                                  jsonEncode(e),
                                ),
                              ),
                            )
                            .toList();
                        _goshthiAttendanceItems!.clear();
                        _goshthiAttendanceItems!.addAll(
                          List.from(
                            allRecords
                                .map(
                                  (e) => GoshthiAttendanceDataModel.fromJson(
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
                        _goshthiAttendanceItems!.clear();
                        _totalRecords = 0;
                      });
                    }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<ParamsBloc, ParamsState>(
            listener: (context, state) {
              if (state is GoshthiAttendanceFiltersState) {
                _strSelectedUserWing = state.strSelectedUserWing;
                _strSelectedGoshthiDate = Utils().nullSafeWithDefaultString(state.strSelectedGoshthiDate,
                    Utils().getCurrentDate(Utils().nullSafeString(Constant.defaultDateFormatWeb)));
                _strSelectedGoshthiRegion = state.strSelectedGoshthiRegion;
                _strSelectedGoshthiCenter = state.strSelectedGoshthiCenter;
                _strSelectedGender = state.strSelectedGender;
                _strSelectedGoshthiMonth = state.strSelectedGoshthiMonth;

                //FOR ADD SELECTED FILTERS
                BlocProvider.of<ParamsBloc>(context).add(GoshthiAttendanceFiltersEvent(
                  _strSelectedUserWing,
                  _strSelectedGoshthiDate,
                  _strSelectedGoshthiRegion,
                  _strSelectedGoshthiCenter,
                  _strSelectedGender,
                  _strSelectedGoshthiMonth,
                ));
                _scrollController.requestRefresh();
                //_pagingController.refresh();
              }
            },
          ),
        ],
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xffFFFBEF),
                      Color(0xffFFF5F5),
                      Color(0xffEFF9FF),
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
                                  .add(UpdateDashBoardEvent(_needToUpdateDashboardReports));
                            } else {
                              BlocProvider.of<KaryakarGoshthiReportBloc>(context).add(
                                  KaryakarGoshthiReportEvent.loadGoshthiReports(
                                      context, 1, _pageSize, "", "", _strSabhaMonth, _strSabhaYear, "", ""));
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
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      Utils().changeDateFormatString(
                                          _strSabhaDate, Constant.defaultDateFormat, "MMMM dd, yyyy"),
                                      style: TextStyle(fontSize: 28.08, fontWeight: FontWeight.bold),
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
                                  builder: (context) => GoshthiAttendanceFilter(
                                    _strWing,
                                    _isAttendanceHasToVisible,
                                    _karyakar_goshti_sabha_id,
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
                              child: Icon(
                                Icons.sort,
                                color: Colors.blue,
                                size: 21.6,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                _strSabhaLabel,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16.2,
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
              SizedBox(
                height: 10.98,
              ),
              LinearPercentIndicator(
                linearGradient: (widget.questionsCurrentProgress == _totalProgress)
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff6FCF97), Color(0xff6FCF97)])
                    : LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                        Color(0xffFFDADA),
                        Color(0xffFFC592),
                      ]),
                padding: EdgeInsets.only(left: 18, right: 18),
                width: 360,
                lineHeight: 10.98,
                percent: widget.questionsCurrentProgress!,
                backgroundColor: Colors.grey[200],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 3.6,
                  left: 14.4,
                  right: 14.4,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.grey[400],
                      size: 25.2,
                    ),
                    Expanded(
                      child: Text(
                        "  " + (widget.questionsCurrentProgress! * 100).toInt().toString() + "%" + " Complete",
                        style: TextStyle(
                            color: (widget.questionsCurrentProgress == _totalProgress) ? Colors.green : Colors.orange,
                            fontSize: 14.4),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 21.96,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: getThirdStageMargin(Utils().nullSafeString(""))),
                    child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 16.2,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: Utils().nullSafeString("Was goshthi held?"),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.2, color: Colors.grey[700])),
                          new TextSpan(
                              text: "*",
                              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.2, color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.32, left: getThirdStageMargin(Utils().nullSafeString(""))),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: getThirdStageMargin(Utils().nullSafeString(""))),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        top: 7.32,
                        bottom: 14.64,
                      ),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            if ((index == 0 && _strGoshthiHeld == "0") || (index == 1 && _strGoshthiHeld == "1")) {
                              //FOR PREVENT DUPLICATE ENTRY
                              _strGoshthiHeld = ((index == 0) ? "1" : "0");

                              List<StatusArrayModel> statusArrayModel = [];
                              if (_goshthiAttendanceItems != null) {
                                for (int v = 0; v < _goshthiAttendanceItems!.length; v++) {
                                  if (_goshthiAttendanceItems![v] != null) {
                                    var item = _goshthiAttendanceItems![v];
                                    if (Utils().nullSafeString(item!.status).isNotEmpty) {
                                      //FOR ADD ONLY SELECTED USER
                                      statusArrayModel.add(StatusArrayModel(item.id, item.status));
                                    }
                                  }
                                }
                              }

                              final _pref = await Preferences.getInstance();
                              LoginModel? loginModel = await _pref.getToken();
                              UpdateGoshthiHeldStatusRequestModel updateGoshthiHeldStatusRequestModel =
                                  UpdateGoshthiHeldStatusRequestModel(
                                Utils().nullSafeString(loginModel!.login_user_type.toString()),
                                Utils().nullSafeString(loginModel.login_parent_type),
                                Utils().nullSafeString(loginModel.role),
                                Utils().nullSafeInt(loginModel.bkms_id).toString(),
                                _karyakar_goshti_sabha_id,
                                Utils().nullSafeWithDefaultString(_strSelectedGoshthiCenter, _strCenter),
                                Utils().nullSafeWithDefaultString(_strSelectedGoshthiRegion, _strRegion),
                                _strGoshthiHeld,
                                Utils().nullSafeWithDefaultString(
                                    _strSelectedGoshthiDate, Utils().getCurrentDate(Constant.defaultDateFormatWeb)),
                                _strSabhaLabel,
                                Utils().nullSafeWithDefaultString(_strSelectedUserWing, _strWing),
                                "$_totalRecords",
                                statusArrayModel,
                              );

                              setState(() {
                                // calculateProgress();

                                // _showLoadingIndicator();
                                BlocProvider.of<GoshthiDataUpdateBloc>(context).add(
                                    GoshthiDataUpdateEvent.updateGoshthiHeldStatus(
                                        context, updateGoshthiHeldStatusRequestModel));
                              });
                            }
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: getFirstStageMargin("")),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 7.2),
                                        padding: EdgeInsets.all(1.44),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18),
                                          border: Border.all(
                                              color: (_strGoshthiHeld == (index == 0 ? "1" : "0"))
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              width: 1.44),
                                        ),
                                        child: Icon(
                                          Icons.done,
                                          color:
                                              (_strGoshthiHeld == (index == 0 ? "1" : "0")) ? Colors.blue : Colors.grey,
                                          size: 10.8,
                                        ),
                                      ),
                                      Text(
                                        Utils().nullSafeString(index == 0 ? "Yes" : "No"),
                                        style: TextStyle(
                                            fontSize: 14.4,
                                            color: (_strGoshthiHeld == (index == 0 ? "1" : "0"))
                                                ? Colors.blue
                                                : Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              _isAttendanceHasToVisible
                  ? Container(
                      margin: EdgeInsets.only(left: 18, right: 18, top: 7.2),
                      child: Text(
                        "Karyakar Goshthi Attendance List:",
                        style: TextStyle(fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                      ),
                    )
                  : Container(),
              _isSearchHasToVisible
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
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
                                              isFilter = true;
                                              _search.text = "";
                                              loading = true;
                                              searchByName = false;
                                            });
                                            BlocProvider.of<GoshthiReportAttendanceBloc>(context)
                                                .add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
                                              context,
                                              _karyakar_goshti_sabha_id,
                                              "$_currentPage",
                                              "$_pageSize",
                                              _search.text,
                                              _strWing,
                                              _strCenter,
                                              _strRegion,
                                              _checkFilter,
                                              _strGender.toLowerCase(),
                                            ));
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
                                        _showLoadingIndicator();
                                        BlocProvider.of<GoshthiReportAttendanceBloc>(context)
                                            .add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
                                          context,
                                          _karyakar_goshti_sabha_id,
                                          "$_currentPage",
                                          "$_pageSize",
                                          _search.text,
                                          _strWing,
                                          _strCenter,
                                          _strRegion,
                                          _checkFilter,
                                          _strGender.toLowerCase(),
                                        ));
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
                    )
                  : Container(),
              _isAttendanceHasToVisible
                  ? Flexible(
                      child: Stack(
                        children: [
                          if (_goshthiAttendanceItems!.isEmpty)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                _karyakar_goshti_sabha_id,
                                _currentPage.toString(),
                                _pageSize.toString(),
                                _search.text,
                                Utils().nullSafeWithDefaultString(_strSelectedUserWing, _strWing),
                                Utils().nullSafeWithDefaultString(_strSelectedGoshthiCenter, _strCenter),
                                Utils().nullSafeWithDefaultString(_strSelectedGoshthiRegion, _strRegion),
                                _checkFilter,
                                Utils().nullSafeWithDefaultString(_strSelectedGender, _strGender).toLowerCase(),
                              );
                            },
                            header: const WaterDropMaterialHeader(),
                            controller: _scrollController,
                            child: ListView.builder(
                              controller: _scrollControllerList,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: (_goshthiAttendanceItems?.length ?? 0) + 1,
                              itemBuilder: (context, index) => (_goshthiAttendanceItems!.length == index)
                                  ? SizedBox(
                                      height: 40,
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(left: 18, right: 18),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _currentIndex = index;
                                                _goshthiAttendanceItems![index]!.status =
                                                    Utils().nullSafeString(_goshthiAttendanceItems![index]!.status) ==
                                                            "present"
                                                        ? "absent"
                                                        : "present";

                                                //FOR SUBMIT GOSHTHI ATTENDANCE
                                                _showLoadingIndicator();
                                                BlocProvider.of<GoshthiDataUpdateBloc>(context)
                                                    .add(GoshthiDataUpdateEvent.submitGoshthiReportAttendance(
                                                  context,
                                                  _karyakar_goshti_sabha_id,
                                                  Utils().nullSafeString(_goshthiAttendanceItems![index]!.id),
                                                  Utils().nullSafeString(_goshthiAttendanceItems![index]!.status) ==
                                                          "present"
                                                      ? "present"
                                                      : "absent",
                                                ));
                                              });
                                              // }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                right: 10.8,
                                              ),
                                              padding: EdgeInsets.all(
                                                1.62,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(3.6),
                                                border: Border.all(
                                                    color: (Utils().nullSafeString(
                                                                _goshthiAttendanceItems![index]!.status) ==
                                                            "present")
                                                        ? Colors.green
                                                        : (Utils()
                                                                .nullSafeString(_goshthiAttendanceItems![index]!.status)
                                                                .isNotEmpty
                                                            ? Colors.grey
                                                            : Colors.black54),
                                                    width: 1.44),
                                              ),
                                              child: Icon(
                                                Icons.done,
                                                color:
                                                    (Utils().nullSafeString(_goshthiAttendanceItems![index]!.status) ==
                                                            "present")
                                                        ? Colors.green
                                                        : Colors.white,
                                                size: 10.8,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10.8, bottom: 7.2, right: 7.2),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 12.6,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            Utils().nullSafeString(
                                                                    /*isForSearch()? _searchItems![index]!.name:*/ _goshthiAttendanceItems![
                                                                            index]!
                                                                        .FirstName) +
                                                                " " +
                                                                Utils().nullSafeString(
                                                                    /*isForSearch()? _searchItems![index]!.name:*/ _goshthiAttendanceItems![
                                                                            index]!
                                                                        .LastName),
                                                            style: TextStyle(
                                                                fontSize: 16.2,
                                                                color: Color(0xFF4F4F4F),
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                          Text(
                                                            Utils().nullSafeWithDefaultString(
                                                                /*isForSearch()? _searchItems![index]!.email:*/ _goshthiAttendanceItems![
                                                                        index]!
                                                                    .email,
                                                                "Email Id"),
                                                            style: TextStyle(color: Color(0xFF828282), fontSize: 13.68),
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
                                            ),
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
                                      _goshthiAttendanceItems!.isEmpty
                                          ? "Showing no results based on filters. "
                                          : ((_search.text.isEmpty)
                                              ? "Showing all ${_totalRecords.toString()}  result. "
                                              : "Showing all ${_goshthiAttendanceItems!.length}  result. "),
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
                                              loading = true;
                                              _showLoadingIndicator();
                                              _strSelectedUserWing = "";
                                              _strSelectedGoshthiDate = Utils().getCurrentDate(
                                                  Utils().nullSafeString(Constant.defaultDateFormatWeb));
                                              if (_search.text.isNotEmpty) {
                                                _currentPage = 1;
                                                //FOR ADD SELECTED FILTERS
                                                BlocProvider.of<ParamsBloc>(context).add(GoshthiAttendanceFiltersEvent(
                                                  _strSelectedUserWing,
                                                  _strSelectedGoshthiDate,
                                                  _strSelectedGoshthiRegion,
                                                  _strSelectedGoshthiCenter,
                                                  _strSelectedGender,
                                                  _strSelectedGoshthiMonth,
                                                ));
                                                BlocProvider.of<GoshthiReportAttendanceBloc>(context)
                                                    .add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
                                                  context,
                                                  _karyakar_goshti_sabha_id,
                                                  "$_currentPage",
                                                  "$_pageSize",
                                                  _search.text,
                                                  _strWing,
                                                  _strCenter,
                                                  _strRegion,
                                                  _checkFilter,
                                                  _strGender.toLowerCase(),
                                                ));
                                              } else {
                                                //FOR ADD SELECTED FILTERS
                                                _currentPage = 1;
                                                BlocProvider.of<ParamsBloc>(context).add(GoshthiAttendanceFiltersEvent(
                                                  _strSelectedUserWing,
                                                  _strSelectedGoshthiDate,
                                                  _strSelectedGoshthiRegion,
                                                  _strSelectedGoshthiCenter,
                                                  _strSelectedGender,
                                                  _strSelectedGoshthiMonth,
                                                ));
                                                BlocProvider.of<GoshthiReportAttendanceBloc>(context)
                                                    .add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
                                                  context,
                                                  _karyakar_goshti_sabha_id,
                                                  "$_currentPage",
                                                  "$_pageSize",
                                                  "",
                                                  _strWing,
                                                  _strCenter,
                                                  _strRegion,
                                                  _checkFilter,
                                                  _strGender.toLowerCase(),
                                                ));
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
                                                builder: (context) => GoshthiAttendanceFilter(
                                                  _strWing,
                                                  _isAttendanceHasToVisible,
                                                  _karyakar_goshti_sabha_id,
                                                  _search.text,
                                                  onSelectFilter: (bool isFiltered) {
                                                    isFilter = isFiltered;
                                                    if (isFilter) {
                                                      _showLoadingIndicator();
                                                      pageKey = 1;
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
                    )
                  : Container(),
            ],
          ),
          Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
        ]),
      ),
    );
  }

  //region FOR GET FIRST STAGE MARGIN
  double getFirstStageMargin(String value) {
    double margin = 0.0;
    if (value.isNotEmpty) {
      margin = 7.32;
    }
    return margin;
  }

  //endregion

  //region FOR GET SECOND STAGE MARGIN
  double getSecondStageMargin(String value) {
    double margin = 7.32;
    if (value.isNotEmpty) {
      margin = 21.96;
    }
    return margin;
  }
//endregion

  //region FOR GET THIRD STAGE MARGIN
  double getThirdStageMargin(String value) {
    double margin = 21.96;
    if (value.isNotEmpty) {
      margin = 36.6;
    }
    return margin;
  }
  //endregion

  //region FOR CALCULATE PROGRESS
  void calculateProgress() {
    widget.questionsCurrentProgress = _strGoshthiHeld.isNotEmpty ? 1.0 : 0.0;
  }
//endregion
}
