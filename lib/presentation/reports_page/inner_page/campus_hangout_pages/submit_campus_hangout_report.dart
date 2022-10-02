import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/campus_hangout_region_model.dart';
import 'package:flutter_app/models/campus_wise_hangout_types_model.dart';
import 'package:flutter_app/models/h_region_wise_campus_model.dart';
import 'package:flutter_app/models/hangout_type_wise_questions_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_attendance_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_attendance_request_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_report_request_model.dart';
import 'package:flutter_app/models/submit_interaction_questions_request_model.dart';
import 'package:flutter_app/models/take_campus_hangout_attendance_request_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/homepage/innerpage/take_picture_screen.dart';
import 'package:flutter_app/presentation/reports_page/bloc/report_bloc.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../Bloc/campus_hangout_data_update_bloc.dart';
import '../../../../Bloc/view_hangout_report_bloc.dart';
import '../../../../loader.dart';
import '../../../../preferences.dart';
import '../campus_hangout.dart';
import 'campus_hangout_attendance_fillters.dart';

class SubmitCampusHangoutReport extends StatefulWidget {
  static String id = "submitCampusHangoutReport";
  static String path = "${CampusHangout.path}/$id";

  @override
  _SubmitCampusHangoutReportState createState() => _SubmitCampusHangoutReportState();
}

class _SubmitCampusHangoutReportState extends State<SubmitCampusHangoutReport> with TickerProviderStateMixin {
  List<CHRegionModel?>? _regionItems = [];
  CHRegionModel? _selectedRegion;

  List<HCampusModel?>? _campusItems = [];
  HCampusModel? _selectedCampus;

  List<HangoutTypesModel?>? _hangoutTypesItems = [];
  HangoutTypesModel? _selectedHangoutType;

  SubmitCampusHangoutAttendanceModel? _submitCampusHangoutAttendanceModel;
  List<SCHAttendanceListModel?>? _attendanceItems = [];
  int _currentAttendanceIndex = 0;
  String _strPreviousAttendanceStatus = "";
  String _strSabhaId = "";
  String _strCampusHangoutId = "";

  List<HTWFormFieldsModel?>? _dynamicQuestionsItems = [];
  List<SubmitCampusHangoutReportRequestModel> _submitCampusHangoutReportRequestModel = [];

  //FOR CAMPUS HANGOUT ATTENDANCE FILTERS
  String _strFSchoolYear = "";
  String _strFFirstName = "";
  String _strFMiddleName = "";
  String _strFLastName = "";
  String _strFUserId = "";

  bool _isLoading = false;

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
    super.initState();

    //FOR GET CAMPUS HANGOUT REGION
    _showLoadingIndicator();
    BlocProvider.of<CampusHangOutDataUpdateBloc>(context).add(CampusHangOutDataUpdateEvent.campusHangoutRegion(
      context,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CampusHangOutDataUpdateBloc, CampusHangOutDataUpdateState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                campusHangoutRegion: (campusHangoutRegionModel) {
                  if (campusHangoutRegionModel != null) {
                    _regionItems = campusHangoutRegionModel.regions!;
                    /*if ((_regionItems != null && _regionItems!.length > 0)) {
                        final regionIndex = _regionItems!.indexWhere((element) => element!.id.toString() == Utils().nullSafeString(campusHangoutRegionModel.user_region_id));
                        if (regionIndex >= 0) {
                          _selectedRegion = _regionItems![regionIndex]!;
                        }
                      }*/
                  }
                },
                hRegionWiseCampus: (hRegionWiseCampusModel) {
                  if (hRegionWiseCampusModel != null) {
                    _campusItems = hRegionWiseCampusModel.campus!;
                  }
                },
                campusWiseHangoutTypes: (campusWiseHangoutTypes) {
                  if (campusWiseHangoutTypes != null) {
                    _hangoutTypesItems = campusWiseHangoutTypes.hangout_types!;
                  }
                },
                hangoutTypeWiseQuestions: (hangoutTypeWiseQuestionsModel) {
                  if (hangoutTypeWiseQuestionsModel != null) {
                    if (hangoutTypeWiseQuestionsModel.form_fields != null) {
                      _dynamicQuestionsItems = hangoutTypeWiseQuestionsModel.form_fields;
                    }
                  }
                },
                submitCampusHangoutAttendance: (submitCampusHangoutAttendanceModel) {
                  if (submitCampusHangoutAttendanceModel != null) {
                    if (submitCampusHangoutAttendanceModel.attendance_list != null) {
                      _submitCampusHangoutAttendanceModel = submitCampusHangoutAttendanceModel;
                      _strSabhaId = Utils().nullSafeString(_submitCampusHangoutAttendanceModel!.campus_sabha_id);
                      _attendanceItems = _submitCampusHangoutAttendanceModel!.attendance_list;
                    }
                  }
                },
                takeCampusHangoutAttendance: (takeCampusHangoutAttendanceModel) {
                  if (takeCampusHangoutAttendanceModel != null) {
                    if (takeCampusHangoutAttendanceModel.has_error!) {
                      _attendanceItems![_currentAttendanceIndex]!.status = _strPreviousAttendanceStatus;
                    } else {
                      _strCampusHangoutId =
                          Utils().nullSafeString(takeCampusHangoutAttendanceModel.campus_hangout_id.toString());
                    }
                  } else {
                    _attendanceItems![_currentAttendanceIndex]!.status = _strPreviousAttendanceStatus;
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<CampusHangoutBloc, CampusHangoutState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                submitCampusHangoutReport: (submitCampusHangoutReportModel) {
                  if (submitCampusHangoutReportModel != null && !submitCampusHangoutReportModel.has_error!) {
                    clearAll();
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) async {
            if (state is CampusHangoutAttendanceFiltersState) {
              _strFSchoolYear = state.strFSchoolYear;
              _strFFirstName = state.strFFirstName;
              _strFMiddleName = state.strFMiddleName;
              _strFLastName = state.strFLastName;
              _strFUserId = state.strFUserId;

              //FOR ADD SELECTED FILTERS
              BlocProvider.of<ParamsBloc>(context).add(CampusHangoutAttendanceFiltersEvent(
                _strFSchoolYear,
                _strFFirstName,
                _strFMiddleName,
                _strFLastName,
                _strFUserId,
              ));

              final _pref = await Preferences.getInstance();
              LoginModel? loginModel = await _pref.getToken();

              //FOR GET CAMPUS HANGOUT ATTENDANCE
              var params = SubmitCampusHangoutAttendanceRequestModel(
                Utils().nullSafeString(loginModel!.login_user_type.toString()),
                Utils().nullSafeString(loginModel.login_parent_type),
                Utils().nullSafeString(loginModel.role),
                Utils().nullSafeInt(loginModel.bkms_id).toString(),
                Utils().nullSafeString(_dynamicQuestionsItems![0]!.fields![0]!.value),
                _selectedHangoutType!.id.toString(),
                _selectedCampus!.id.toString(),
                _selectedRegion!.id.toString(),
                "2",
                _strFSchoolYear,
                _strFFirstName,
                _strFMiddleName,
                _strFLastName,
                _strFUserId,
              );

              _attendanceItems = [];
              _showLoadingIndicator();
              BlocProvider.of<CampusHangOutDataUpdateBloc>(context)
                  .add(CampusHangOutDataUpdateEvent.submitCampusHangoutAttendance(context, params));
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
                    bottom: 21.6,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
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
                                    "Submit Campus Hangout",
                                    style: TextStyle(fontSize: 28.08, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Campus Hangout Report",
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
            Flexible(
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 14.4,
                                right: 14.4,
                              ),
                              child: Container(
                                height: 695.4,
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 14.4),
                                      child: RichText(
                                        text: new TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: new TextStyle(
                                            fontSize: 14.4,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            new TextSpan(
                                                text: "1. Region",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.black)),
                                            new TextSpan(
                                                text: "*",
                                                style: new TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 7.32, left: getSecondStageMargin(Utils().nullSafeString(""))),
                                      child: DropdownButton<CHRegionModel>(
                                        hint: Text('  Choose Region'),
                                        isExpanded: true,
                                        itemHeight: null,
                                        value: _selectedRegion == null ? null : _selectedRegion,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 21.6,
                                        ),
                                        style: TextStyle(fontSize: 12.6, color: Colors.black),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedRegion = value!;

                                            _campusItems = [];
                                            _selectedCampus = null;

                                            _hangoutTypesItems = [];
                                            _selectedHangoutType = null;

                                            _dynamicQuestionsItems = [];

                                            _attendanceItems = [];

                                            //FOR GET REGION WISE CAMPUS
                                            _showLoadingIndicator();
                                            BlocProvider.of<CampusHangOutDataUpdateBloc>(context).add(
                                                CampusHangOutDataUpdateEvent.hRegionWiseCampus(
                                                    context, Utils().nullSafeInt(_selectedRegion!.id).toString()));
                                          });
                                        },
                                        items: _regionItems!.map(
                                          (value) {
                                            return DropdownMenuItem(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  7.2,
                                                ),
                                                child: Text(Utils().nullSafeString(value!.RegionName)),
                                              ),
                                              value: value,
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18.3,
                                    ),
                                    RichText(
                                      text: new TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: new TextStyle(
                                          fontSize: 14.4,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text: "2. Campus",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.black)),
                                          new TextSpan(
                                              text: "*",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.red)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 7.32, left: getSecondStageMargin(Utils().nullSafeString(""))),
                                      child: DropdownButton<HCampusModel>(
                                        hint: Text('  Choose Campus'),
                                        isExpanded: true,
                                        itemHeight: null,
                                        value: _selectedCampus == null ? null : _selectedCampus,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 21.6,
                                        ),
                                        style: TextStyle(fontSize: 12.6, color: Colors.black),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedCampus = value!;

                                            _hangoutTypesItems = [];
                                            _selectedHangoutType = null;

                                            _dynamicQuestionsItems = [];

                                            _attendanceItems = [];

                                            //FOR GET CAMPUS WISE HANGOUT TYPES
                                            _showLoadingIndicator();
                                            BlocProvider.of<CampusHangOutDataUpdateBloc>(context).add(
                                                CampusHangOutDataUpdateEvent.campusWiseHangoutTypes(
                                                    context, Utils().nullSafeString(_selectedCampus!.id)));
                                          });
                                        },
                                        items: _campusItems!.map(
                                          (value) {
                                            return DropdownMenuItem(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  7.2,
                                                ),
                                                child: Text(Utils().nullSafeString(value!.campus_name)),
                                              ),
                                              value: value,
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18.3,
                                    ),
                                    RichText(
                                      text: new TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: new TextStyle(
                                          fontSize: 14.4,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text: "3. Hangout Type",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.black)),
                                          new TextSpan(
                                              text: "*",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.red)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 7.32, left: getSecondStageMargin(Utils().nullSafeString(""))),
                                      child: DropdownButton<HangoutTypesModel>(
                                        hint: Text('  Choose Hangout Type'),
                                        isExpanded: true,
                                        itemHeight: null,
                                        value: _selectedHangoutType == null ? null : _selectedHangoutType,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 21.6,
                                        ),
                                        style: TextStyle(fontSize: 12.6, color: Colors.black),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedHangoutType = value!;

                                            _dynamicQuestionsItems = [];

                                            _attendanceItems = [];

                                            //FOR GET HANGOUT TYPE WISE DYNAMIC QUESTIONS
                                            _showLoadingIndicator();
                                            BlocProvider.of<CampusHangOutDataUpdateBloc>(context).add(
                                                CampusHangOutDataUpdateEvent.hangoutTypeWiseQuestions(context,
                                                    Utils().nullSafeString(_selectedHangoutType!.id.toString())));
                                          });
                                        },
                                        items: _hangoutTypesItems!.map(
                                          (value) {
                                            return DropdownMenuItem(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  7.2,
                                                ),
                                                child: Text(Utils().nullSafeString(value!.wingName)),
                                              ),
                                              value: value,
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18.3,
                                    ),
                                    (_dynamicQuestionsItems != null && _dynamicQuestionsItems!.length > 0)
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: List.generate(_dynamicQuestionsItems!.length, (parentIndex) {
                                              var currentItem = _dynamicQuestionsItems![parentIndex]!;
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: List.generate(currentItem.fields!.length, (fieldIndex) {
                                                  var field = currentItem.fields![fieldIndex];
                                                  if (field != null) {
                                                    if (field.type == Constant.brftSELECT) {
                                                      var selectedDropdownItem;
                                                      var options = field.options;

                                                      if (Utils().nullSafeString(field.selected).isNotEmpty &&
                                                          options != null) {
                                                        final stateIndex = options.indexWhere((element) =>
                                                            element!.id.toString() ==
                                                            Utils().nullSafeString(field.selected));
                                                        if (stateIndex >= 0) {
                                                          selectedDropdownItem = options[stateIndex];
                                                        }
                                                      } else {
                                                        selectedDropdownItem = null;
                                                      }

                                                      return Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 14.64,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Utils().nullSafeString(field.placeholder).isNotEmpty
                                                              ? SizedBox(
                                                                  height: 7.32,
                                                                )
                                                              : Container(),
                                                          Utils().nullSafeString(field.placeholder).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.placeholder),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 12.6,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ))
                                                              : Container(),
                                                          options != null
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: 7.32,
                                                                      bottom: 10.98,
                                                                      left: Utils()
                                                                              .nullSafeString(field.placeholder)
                                                                              .isNotEmpty
                                                                          ? getThirdStageMargin(
                                                                              Utils().nullSafeString(currentItem.label))
                                                                          : getSecondStageMargin(Utils()
                                                                              .nullSafeString(currentItem.label))),
                                                                  child: DropdownButton(
                                                                    itemHeight: null,
                                                                    isExpanded: true,
                                                                    hint: Text(
                                                                      Utils().nullSafeString(field.placeholder).trim(),
                                                                      style: TextStyle(
                                                                        fontSize: 12.6,
                                                                      ),
                                                                    ),
                                                                    value: selectedDropdownItem,
                                                                    onChanged: (currentItem
                                                                            .fields![fieldIndex]!.is_readonly!)
                                                                        ? null
                                                                        : (newValue) {
                                                                            if (!currentItem
                                                                                .fields![fieldIndex]!.is_readonly!) {
                                                                              setState(() {
                                                                                var selectedDropdownItem =
                                                                                    newValue as HTWOptionsItems;
                                                                                _dynamicQuestionsItems![parentIndex]!
                                                                                    .fields![fieldIndex]!
                                                                                    .selected = selectedDropdownItem.id;
                                                                              });
                                                                            }
                                                                          },
                                                                    items: options.map((item) {
                                                                      return DropdownMenuItem(
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            (/*(selectedDropdownItem != null && (item!.id != (selectedDropdownItem as Options).id)) &&*/ ((options
                                                                                                .indexOf(item) ==
                                                                                            0 ||
                                                                                        (options.indexOf(item) - 1) >=
                                                                                                0 &&
                                                                                            (Utils().nullSafeString(
                                                                                                    item!.header)) !=
                                                                                                (Utils().nullSafeString(
                                                                                                    options[options.indexOf(
                                                                                                                item) -
                                                                                                            1]!
                                                                                                        .header)))) &&
                                                                                    (Utils().nullSafeString(
                                                                                            item!.header))
                                                                                        .isNotEmpty)
                                                                                ? Text(
                                                                                    Utils().nullSafeString(item.header),
                                                                                    style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 12.6),
                                                                                  )
                                                                                : Container(),
                                                                            Container(
                                                                                margin: EdgeInsets.only(
                                                                                    left: getFirstStageMargin(Utils()
                                                                                        .nullSafeString(item!.header))),
                                                                                child: Text(
                                                                                    Utils()
                                                                                        .nullSafeString(item.value)
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
                                                                )
                                                              : Container(height: 60),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftRADIO) {
                                                      var selectedDropdownItem;
                                                      var options = field.options;

                                                      if (Utils().nullSafeString(field.selected).isNotEmpty &&
                                                          options != null) {
                                                        final stateIndex = options.indexWhere(
                                                            (element) => element!.id.toString() == field.selected);
                                                        if (stateIndex >= 0) {
                                                          selectedDropdownItem = options[stateIndex];
                                                        }
                                                      } else {
                                                        selectedDropdownItem = null;
                                                      }

                                                      return Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 14.64,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Utils().nullSafeString(field.placeholder).isNotEmpty
                                                              ? SizedBox(
                                                                  height: 7.32,
                                                                )
                                                              : Container(),
                                                          Utils().nullSafeString(field.placeholder).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.placeholder),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 12.6,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ))
                                                              : Container(),
                                                          options != null
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: 7.32,
                                                                      left: Utils()
                                                                              .nullSafeString(field.placeholder)
                                                                              .isNotEmpty
                                                                          ? getThirdStageMargin(
                                                                              Utils().nullSafeString(currentItem.label))
                                                                          : getSecondStageMargin(Utils()
                                                                              .nullSafeString(currentItem.label))),
                                                                  child: DropdownButton(
                                                                    itemHeight: null,
                                                                    isExpanded: true,
                                                                    hint: Text(
                                                                      Utils().nullSafeString(field.placeholder).trim(),
                                                                      style: TextStyle(
                                                                        fontSize: 12.6,
                                                                      ),
                                                                    ),
                                                                    value: selectedDropdownItem,
                                                                    onChanged: (currentItem
                                                                            .fields![fieldIndex]!.is_readonly!)
                                                                        ? null
                                                                        : (newValue) {
                                                                            if (!currentItem
                                                                                .fields![fieldIndex]!.is_readonly!) {
                                                                              setState(() {
                                                                                var selectedDropdownItem =
                                                                                    newValue as HTWOptionsItems;
                                                                                _dynamicQuestionsItems![parentIndex]!
                                                                                    .fields![fieldIndex]!
                                                                                    .selected = selectedDropdownItem.id;
                                                                              });
                                                                            }
                                                                          },
                                                                    items: options.map((item) {
                                                                      return DropdownMenuItem(
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            (/*(selectedDropdownItem != null && (item!.id != (selectedDropdownItem as Options).id)) &&*/ ((options
                                                                                                .indexOf(item) ==
                                                                                            0 ||
                                                                                        (options.indexOf(item) - 1) >=
                                                                                                0 &&
                                                                                            (Utils().nullSafeString(
                                                                                                    item!.header)) !=
                                                                                                (Utils().nullSafeString(
                                                                                                    options[options.indexOf(
                                                                                                                item) -
                                                                                                            1]!
                                                                                                        .header)))) &&
                                                                                    (Utils().nullSafeString(
                                                                                            item!.header))
                                                                                        .isNotEmpty)
                                                                                ? Text(
                                                                                    Utils().nullSafeString(item.header),
                                                                                    style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 12.6),
                                                                                  )
                                                                                : Container(),
                                                                            Container(
                                                                                margin: EdgeInsets.only(
                                                                                    left: getFirstStageMargin(Utils()
                                                                                        .nullSafeString(item!.header))),
                                                                                child: Text(
                                                                                    Utils()
                                                                                        .nullSafeString(item.value)
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
                                                                )
                                                              : Container(height: 60),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftDROPDOWN) {
                                                      var selectedDropdownItem;
                                                      var options = field.options;

                                                      if (Utils().nullSafeString(field.selected).isNotEmpty &&
                                                          options != null) {
                                                        final stateIndex = options.indexWhere(
                                                            (element) => element!.id.toString() == field.selected);
                                                        if (stateIndex >= 0) {
                                                          selectedDropdownItem = options[stateIndex];
                                                        }
                                                      } else {
                                                        selectedDropdownItem = null;
                                                      }

                                                      return Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 14.64,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Utils().nullSafeString(field.placeholder).isNotEmpty
                                                              ? SizedBox(
                                                                  height: 7.32,
                                                                )
                                                              : Container(),
                                                          Utils().nullSafeString(field.placeholder).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.placeholder),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 12.6,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ))
                                                              : Container(),
                                                          options != null
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: 7.32,
                                                                      left: Utils()
                                                                              .nullSafeString(field.placeholder)
                                                                              .isNotEmpty
                                                                          ? getThirdStageMargin(
                                                                              Utils().nullSafeString(currentItem.label))
                                                                          : getSecondStageMargin(Utils()
                                                                              .nullSafeString(currentItem.label))),
                                                                  child: DropdownButton(
                                                                    itemHeight: null,
                                                                    isExpanded: true,
                                                                    hint: Text(
                                                                      Utils().nullSafeString(field.placeholder).trim(),
                                                                      style: TextStyle(
                                                                        fontSize: 12.6,
                                                                      ),
                                                                    ),
                                                                    value: selectedDropdownItem,
                                                                    onChanged: (currentItem
                                                                            .fields![fieldIndex]!.is_readonly!)
                                                                        ? null
                                                                        : (newValue) {
                                                                            if (!currentItem
                                                                                .fields![fieldIndex]!.is_readonly!) {
                                                                              setState(() {
                                                                                var selectedDropdownItem =
                                                                                    newValue as HTWOptionsItems;
                                                                                _dynamicQuestionsItems![parentIndex]!
                                                                                    .fields![fieldIndex]!
                                                                                    .selected = selectedDropdownItem.id;
                                                                              });
                                                                            }
                                                                          },
                                                                    items: options.map((item) {
                                                                      return DropdownMenuItem(
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            (/*(selectedDropdownItem != null && (item!.id != (selectedDropdownItem as Options).id)) &&*/ ((options
                                                                                                .indexOf(item) ==
                                                                                            0 ||
                                                                                        (options.indexOf(item) - 1) >=
                                                                                                0 &&
                                                                                            (Utils().nullSafeString(
                                                                                                    item!.header)) !=
                                                                                                (Utils().nullSafeString(
                                                                                                    options[options.indexOf(
                                                                                                                item) -
                                                                                                            1]!
                                                                                                        .header)))) &&
                                                                                    (Utils().nullSafeString(
                                                                                            item!.header))
                                                                                        .isNotEmpty)
                                                                                ? Text(
                                                                                    Utils().nullSafeString(item.header),
                                                                                    style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 12.6),
                                                                                  )
                                                                                : Container(),
                                                                            Container(
                                                                                margin: EdgeInsets.only(
                                                                                    left: getFirstStageMargin(Utils()
                                                                                        .nullSafeString(item!.header))),
                                                                                child: Text(
                                                                                    Utils()
                                                                                        .nullSafeString(item.value)
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
                                                                )
                                                              : Container(height: 60),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftTEXTBOX) {
                                                      final TextEditingController _controller =
                                                          new TextEditingController();
                                                      _controller.text = Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value);
                                                      _controller.selection = TextSelection.fromPosition(
                                                          TextPosition(offset: _controller.text.length));

                                                      return Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 21.96,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getSecondStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: Column(
                                                              children: [
                                                                TextField(
                                                                  enabled:
                                                                      (!currentItem.fields![fieldIndex]!.is_readonly!),
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      currentItem.fields![fieldIndex]!.value = value;
                                                                    });
                                                                  },
                                                                  textInputAction: TextInputAction.next,
                                                                  keyboardType: TextInputType.text,
                                                                  controller: _controller,
                                                                  decoration: InputDecoration(
                                                                    hintText: Utils().nullSafeString(
                                                                        currentItem.fields![fieldIndex]!.placeholder),
                                                                    suffixIcon: (currentItem
                                                                                .fields![fieldIndex]!.is_required! &&
                                                                            Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value)
                                                                                .isEmpty)
                                                                        ? Padding(
                                                                            padding: EdgeInsets.only(left: 28.8),
                                                                            child: Icon(
                                                                              Icons.warning_amber_outlined,
                                                                              color: Colors.red,
                                                                              size: 18,
                                                                            ),
                                                                          )
                                                                        : SizedBox(),
                                                                  ),
                                                                  focusNode: FocusNode(),
                                                                ),
                                                                (currentItem.fields![fieldIndex]!.is_required! &&
                                                                        Utils()
                                                                            .nullSafeString(
                                                                                currentItem.fields![fieldIndex]!.value)
                                                                            .isEmpty)
                                                                    ? Padding(
                                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                                        child: Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(7.2),
                                                                                  color: Color(0x1FEB5757),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(3.6),
                                                                                  child: Text(
                                                                                    Utils().nullSafeString(currentItem
                                                                                        .fields![fieldIndex]!
                                                                                        .validation_message),
                                                                                    style: TextStyle(
                                                                                        color: Color(0xffEB5757),
                                                                                        fontSize: 10.8),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7.32,
                                                          ),
                                                          Utils().nullSafeString(field.help_text).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.help_text),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 10.8,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftNUMERIC_TEXTBOX) {
                                                      final TextEditingController _controller =
                                                          new TextEditingController();
                                                      _controller.text = Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value);
                                                      _controller.selection = TextSelection.fromPosition(
                                                          TextPosition(offset: _controller.text.length));

                                                      return Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 21.96,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getSecondStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: Column(
                                                              children: [
                                                                TextField(
                                                                  enabled:
                                                                      !currentItem.fields![fieldIndex]!.is_readonly!,
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      currentItem.fields![fieldIndex]!.value = value;
                                                                    });
                                                                  },
                                                                  textInputAction: TextInputAction.next,
                                                                  keyboardType: TextInputType.number,
                                                                  controller: _controller,
                                                                  decoration: InputDecoration(
                                                                    hintText: Utils().nullSafeString(
                                                                        currentItem.fields![fieldIndex]!.placeholder),
                                                                    suffixIcon: (currentItem
                                                                                .fields![fieldIndex]!.is_required! &&
                                                                            Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value)
                                                                                .isEmpty)
                                                                        ? Padding(
                                                                            padding: EdgeInsets.only(left: 28.8),
                                                                            child: Icon(
                                                                              Icons.warning_amber_outlined,
                                                                              color: Colors.red,
                                                                              size: 18,
                                                                            ),
                                                                          )
                                                                        : SizedBox(),
                                                                  ),
                                                                  focusNode: FocusNode(),
                                                                ),
                                                                (currentItem.fields![fieldIndex]!.is_required! &&
                                                                        Utils()
                                                                            .nullSafeString(
                                                                                currentItem.fields![fieldIndex]!.value)
                                                                            .isEmpty)
                                                                    ? Padding(
                                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                                        child: Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(7.2),
                                                                                  color: Color(0x1FEB5757),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(3.6),
                                                                                  child: Text(
                                                                                    Utils().nullSafeString(currentItem
                                                                                        .fields![fieldIndex]!
                                                                                        .validation_message),
                                                                                    style: TextStyle(
                                                                                        color: Color(0xffEB5757),
                                                                                        fontSize: 10.8),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7.32,
                                                          ),
                                                          Utils().nullSafeString(field.help_text).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.help_text),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 10.8,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftTEXTAREA) {
                                                      final TextEditingController _controller =
                                                          new TextEditingController();
                                                      _controller.text = Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value);
                                                      _controller.selection = TextSelection.fromPosition(
                                                          TextPosition(offset: _controller.text.length));

                                                      return Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 21.96,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getSecondStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: Column(
                                                              children: [
                                                                TextField(
                                                                  enabled:
                                                                      !currentItem.fields![fieldIndex]!.is_readonly!,
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      currentItem.fields![fieldIndex]!.value = value;
                                                                    });
                                                                  },
                                                                  textInputAction: TextInputAction.next,
                                                                  keyboardType: TextInputType.streetAddress,
                                                                  minLines: 2,
                                                                  maxLines: 4,
                                                                  controller: _controller,
                                                                  decoration: InputDecoration(
                                                                    hintText: Utils().nullSafeString(
                                                                        currentItem.fields![fieldIndex]!.placeholder),
                                                                    suffixIcon: (currentItem
                                                                                .fields![fieldIndex]!.is_required! &&
                                                                            Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value)
                                                                                .isEmpty)
                                                                        ? Padding(
                                                                            padding: EdgeInsets.only(left: 28.8),
                                                                            child: Icon(
                                                                              Icons.warning_amber_outlined,
                                                                              color: Colors.red,
                                                                              size: 18,
                                                                            ),
                                                                          )
                                                                        : SizedBox(),
                                                                  ),
                                                                  focusNode: FocusNode(),
                                                                ),
                                                                (currentItem.fields![fieldIndex]!.is_required! &&
                                                                        Utils()
                                                                            .nullSafeString(
                                                                                currentItem.fields![fieldIndex]!.value)
                                                                            .isEmpty)
                                                                    ? Padding(
                                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                                        child: Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(7.2),
                                                                                  color: Color(0x1FEB5757),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(3.6),
                                                                                  child: Text(
                                                                                    Utils().nullSafeString(currentItem
                                                                                        .fields![fieldIndex]!
                                                                                        .validation_message),
                                                                                    style: TextStyle(
                                                                                        color: Color(0xffEB5757),
                                                                                        fontSize: 10.8),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7.32,
                                                          ),
                                                          Utils().nullSafeString(field.help_text).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.help_text),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 10.8,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftEMAIL) {
                                                      final TextEditingController _controller =
                                                          new TextEditingController();
                                                      _controller.text = Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value);
                                                      _controller.selection = TextSelection.fromPosition(
                                                          TextPosition(offset: _controller.text.length));

                                                      return Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 21.96,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getSecondStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: Column(
                                                              children: [
                                                                TextField(
                                                                  enabled:
                                                                      !currentItem.fields![fieldIndex]!.is_readonly!,
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      currentItem.fields![fieldIndex]!.value = value;
                                                                    });
                                                                  },
                                                                  textInputAction: TextInputAction.next,
                                                                  keyboardType: TextInputType.emailAddress,
                                                                  controller: _controller,
                                                                  decoration: InputDecoration(
                                                                    hintText: Utils().nullSafeString(
                                                                        currentItem.fields![fieldIndex]!.placeholder),
                                                                    suffixIcon: (currentItem
                                                                                .fields![fieldIndex]!.is_required! &&
                                                                            (Utils()
                                                                                    .nullSafeString(currentItem
                                                                                        .fields![fieldIndex]!.value)
                                                                                    .isEmpty ||
                                                                                !Utils().validateEmail(Utils()
                                                                                    .nullSafeString(currentItem
                                                                                        .fields![fieldIndex]!.value))))
                                                                        ? Padding(
                                                                            padding: EdgeInsets.only(left: 28.8),
                                                                            child: Icon(
                                                                              Icons.warning_amber_outlined,
                                                                              color: Colors.red,
                                                                              size: 18,
                                                                            ),
                                                                          )
                                                                        : SizedBox(),
                                                                  ),
                                                                  focusNode: FocusNode(),
                                                                ),
                                                                (currentItem.fields![fieldIndex]!.is_required! &&
                                                                        (Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value)
                                                                                .isEmpty ||
                                                                            !Utils().validateEmail(Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value))))
                                                                    ? Padding(
                                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                                        child: Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(7.2),
                                                                                  color: Color(0x1FEB5757),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(3.6),
                                                                                  child: Text(
                                                                                    (Utils()
                                                                                                .nullSafeString(
                                                                                                    currentItem
                                                                                                        .fields![
                                                                                                            fieldIndex]!
                                                                                                        .value)
                                                                                                .isNotEmpty &&
                                                                                            !Utils().validateEmail(
                                                                                                Utils().nullSafeString(
                                                                                                    currentItem
                                                                                                        .fields![
                                                                                                            fieldIndex]!
                                                                                                        .value)))
                                                                                        ? "Please enter valid Email Address."
                                                                                        : "Please enter your Email Address.",
                                                                                    style: TextStyle(
                                                                                        color: Color(0xffEB5757),
                                                                                        fontSize: 10.8),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7.32,
                                                          ),
                                                          Utils().nullSafeString(field.help_text).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.help_text),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 10.8,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftTELEPHONE) {
                                                      final TextEditingController _controller =
                                                          new TextEditingController();
                                                      _controller.text = Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value);
                                                      _controller.selection = TextSelection.fromPosition(
                                                          TextPosition(offset: _controller.text.length));

                                                      return Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 21.96,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getSecondStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: Column(
                                                              children: [
                                                                TextField(
                                                                  enabled:
                                                                      !currentItem.fields![fieldIndex]!.is_readonly!,
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      currentItem.fields![fieldIndex]!.value = value;
                                                                    });
                                                                  },
                                                                  textInputAction: TextInputAction.next,
                                                                  keyboardType: TextInputType.phone,
                                                                  maxLength: 15,
                                                                  controller: _controller,
                                                                  decoration: InputDecoration(
                                                                    counterText: '',
                                                                    hintText: Utils().nullSafeString(
                                                                        currentItem.fields![fieldIndex]!.placeholder),
                                                                    suffixIcon: (currentItem
                                                                                .fields![fieldIndex]!.is_required! &&
                                                                            (Utils()
                                                                                    .nullSafeString(currentItem
                                                                                        .fields![fieldIndex]!.value)
                                                                                    .isEmpty ||
                                                                                (Utils()
                                                                                            .nullSafeString(currentItem
                                                                                                .fields![fieldIndex]!
                                                                                                .value)
                                                                                            .length <
                                                                                        10 ||
                                                                                    Utils()
                                                                                            .nullSafeString(currentItem
                                                                                                .fields![fieldIndex]!
                                                                                                .value)
                                                                                            .length >
                                                                                        15)))
                                                                        ? Padding(
                                                                            padding: EdgeInsets.only(left: 28.8),
                                                                            child: Icon(
                                                                              Icons.warning_amber_outlined,
                                                                              color: Colors.red,
                                                                              size: 18,
                                                                            ),
                                                                          )
                                                                        : SizedBox(),
                                                                  ),
                                                                  focusNode: FocusNode(),
                                                                ),
                                                                (currentItem.fields![fieldIndex]!.is_required! &&
                                                                        (Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value)
                                                                                .isEmpty ||
                                                                            (Utils()
                                                                                        .nullSafeString(currentItem
                                                                                            .fields![fieldIndex]!.value)
                                                                                        .length <
                                                                                    10 ||
                                                                                Utils()
                                                                                        .nullSafeString(currentItem
                                                                                            .fields![fieldIndex]!.value)
                                                                                        .length >
                                                                                    15)))
                                                                    ? Padding(
                                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                                        child: Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(7.2),
                                                                                  color: Color(0x1FEB5757),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(3.6),
                                                                                  child: Text(
                                                                                    (Utils()
                                                                                                .nullSafeString(
                                                                                                    currentItem
                                                                                                        .fields![
                                                                                                            fieldIndex]!
                                                                                                        .value)
                                                                                                .isNotEmpty &&
                                                                                            (Utils()
                                                                                                    .nullSafeString(
                                                                                                        currentItem
                                                                                                            .fields![
                                                                                                                fieldIndex]!
                                                                                                            .value)
                                                                                                    .isEmpty ||
                                                                                                (Utils()
                                                                                                            .nullSafeString(currentItem
                                                                                                                .fields![
                                                                                                                    fieldIndex]!
                                                                                                                .value)
                                                                                                            .length <
                                                                                                        10 ||
                                                                                                    Utils()
                                                                                                            .nullSafeString(currentItem
                                                                                                                .fields![
                                                                                                                    fieldIndex]!
                                                                                                                .value)
                                                                                                            .length >
                                                                                                        15)))
                                                                                        ? "Please enter valid Telephone Number."
                                                                                        : "Please enter your Telephone Number.",
                                                                                    style: TextStyle(
                                                                                        color: Color(0xffEB5757),
                                                                                        fontSize: 10.8),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7.32,
                                                          ),
                                                          Utils().nullSafeString(field.help_text).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.help_text),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 10.8,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftDATE) {
                                                      return Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 21.96,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Utils().nullSafeString(field.placeholder).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label)),
                                                                      top: 7.32,
                                                                      bottom: 3.66),
                                                                  child: Text(Utils().nullSafeString(field.placeholder),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 12.6,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                )
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left:
                                                                    Utils().nullSafeString(field.placeholder).isNotEmpty
                                                                        ? getThirdStageMargin(
                                                                            Utils().nullSafeString(currentItem.label))
                                                                        : getSecondStageMargin(
                                                                            Utils().nullSafeString(currentItem.label))),
                                                            child: Column(
                                                              children: [
                                                                RaisedButton(
                                                                  onPressed: () =>
                                                                      (currentItem.fields![fieldIndex]!.is_readonly!)
                                                                          ? null
                                                                          : _selectDate(
                                                                              context,
                                                                              Utils().stringToDateTime(
                                                                                  Utils().nullSafeString(field.value),
                                                                                  Constant.defaultDateFormatWeb),
                                                                              parentIndex,
                                                                              fieldIndex),
                                                                  child: Text(
                                                                      Utils().changeDateFormat(
                                                                          Utils().stringToDateTime(
                                                                              Utils().nullSafeWithDefaultString(
                                                                                  field.value,
                                                                                  Utils().getCurrentDate(
                                                                                      Constant.defaultDateFormatWeb)),
                                                                              Constant.defaultDateFormatWeb),
                                                                          "dd MMMM yyyy"),
                                                                      style: TextStyle(
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 3.66,
                                                          ),
                                                          Utils().nullSafeString(field.help_text).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: Utils()
                                                                              .nullSafeString(field.placeholder)
                                                                              .isNotEmpty
                                                                          ? getThirdStageMargin(
                                                                              Utils().nullSafeString(currentItem.label))
                                                                          : getSecondStageMargin(Utils()
                                                                              .nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.help_text),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 10.8,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ],
                                                      );
                                                    }

                                                    if (field.type == Constant.brftFILE) {
                                                      return Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          parentIndex != 0
                                                              ? SizedBox(
                                                                  height: 21.96,
                                                                )
                                                              : Container(),
                                                          (fieldIndex == 0 &&
                                                                  Utils().nullSafeString(currentItem.label).isNotEmpty)
                                                              ? Container(
                                                                  margin: EdgeInsets.only(bottom: 14.64),
                                                                  child: Text(
                                                                    Utils().nullSafeString(currentItem.label),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.4,
                                                                        color: Colors.black),
                                                                  ))
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(currentItem.label))),
                                                            child: RichText(
                                                              text: new TextSpan(
                                                                // Note: Styles for TextSpans must be explicitly defined.
                                                                // Child text spans will inherit styles from parent
                                                                style: new TextStyle(
                                                                  fontSize: 14.4,
                                                                  color: Colors.black,
                                                                ),
                                                                children: <TextSpan>[
                                                                  new TextSpan(
                                                                      text: Utils().nullSafeString(field.label),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                  new TextSpan(
                                                                      text:
                                                                          currentItem.fields![fieldIndex]!.is_required!
                                                                              ? "*"
                                                                              : "",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.4,
                                                                          color: Colors.red)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Utils().nullSafeString(field.placeholder).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: getSecondStageMargin(
                                                                          Utils().nullSafeString(currentItem.label)),
                                                                      top: 7.32,
                                                                      bottom: 3.66),
                                                                  child: Text(Utils().nullSafeString(field.placeholder),
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 12.6,
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly!
                                                                              ? Colors.grey[600]
                                                                              : Colors.black)),
                                                                )
                                                              : Container(),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left:
                                                                    Utils().nullSafeString(field.placeholder).isNotEmpty
                                                                        ? getThirdStageMargin(
                                                                            Utils().nullSafeString(currentItem.label))
                                                                        : getSecondStageMargin(
                                                                            Utils().nullSafeString(currentItem.label))),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 7.32,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () async {
                                                                    if (!currentItem
                                                                        .fields![fieldIndex]!.is_readonly!) {
                                                                      if (await Permission.storage
                                                                          .request()
                                                                          .isGranted) {
                                                                        if (Platform.isAndroid || Platform.isIOS) {
                                                                          _showAttachmentPickerDialog(
                                                                              parentIndex, fieldIndex);
                                                                        } else {
                                                                          FilePickerResult? result =
                                                                              await FilePicker.platform.pickFiles();
                                                                          if (result != null) {
                                                                            setState(() {
                                                                              _dynamicQuestionsItems![parentIndex]!
                                                                                      .fields![fieldIndex]!
                                                                                      .value =
                                                                                  Utils().nullSafeString(
                                                                                      result.files.single.path);
                                                                            });
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  },
                                                                  child: (Utils()
                                                                              .nullSafeString(currentItem
                                                                                  .fields![fieldIndex]!.value)
                                                                              .isEmpty ||
                                                                          Utils().validateWebURL(Utils().nullSafeString(
                                                                              currentItem.fields![fieldIndex]!.value)))
                                                                      ? FadeInImage.assetNetwork(
                                                                          fit: BoxFit.fitHeight,
                                                                          height: 72,
                                                                          width: 72,
                                                                          placeholder: "assets/spinner.gif",
                                                                          image: Utils().nullSafeWithDefaultString(
                                                                              currentItem.fields![fieldIndex]!.value,
                                                                              Constant.defaultAttachmentImage),
                                                                        )
                                                                      : Utils().hasImageExtensions(Utils().nullSafeString(
                                                                              currentItem.fields![fieldIndex]!.value))
                                                                          ? Image.file(
                                                                              File(Utils().nullSafeString(currentItem
                                                                                  .fields![fieldIndex]!.value)),
                                                                              height: 72,
                                                                              width: 72,
                                                                              fit: BoxFit.fitHeight,
                                                                            )
                                                                          : Text(
                                                                              File(Utils().nullSafeString(currentItem
                                                                                      .fields![fieldIndex]!.value))
                                                                                  .path
                                                                                  .split('/')
                                                                                  .last,
                                                                              style: TextStyle(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontSize: 12.6,
                                                                                  color: Colors.lightBlue)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7.32,
                                                          ),
                                                          Utils().nullSafeString(field.help_text).isNotEmpty
                                                              ? Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: Utils()
                                                                              .nullSafeString(field.placeholder)
                                                                              .isNotEmpty
                                                                          ? getThirdStageMargin(
                                                                              Utils().nullSafeString(currentItem.label))
                                                                          : getSecondStageMargin(Utils()
                                                                              .nullSafeString(currentItem.label))),
                                                                  child: Text(
                                                                    Utils().nullSafeString(field.help_text),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 10.8,
                                                                        color: currentItem
                                                                                .fields![fieldIndex]!.is_readonly!
                                                                            ? Colors.grey[600]
                                                                            : Colors.black),
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ],
                                                      );
                                                    }

                                                    (parentIndex == (_dynamicQuestionsItems!.length - 1))
                                                        ? Container(
                                                            height: 14.64,
                                                          )
                                                        : Container();
                                                  }
                                                  return Container();
                                                }),
                                              );
                                            }),
                                          )
                                        : Container(),
                                    (_attendanceItems != null && _attendanceItems!.length > 0 || isForFilter() == 2)
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                              top: 29.28,
                                              bottom: 7.2,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  "Attendees List:",
                                                  style: TextStyle(
                                                      fontSize: 16.2,
                                                      color: Color(0xFF4F4F4F),
                                                      fontWeight: FontWeight.bold),
                                                )),
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
                                                      builder: (context) =>
                                                          SCHAFilter(_submitCampusHangoutAttendanceModel),
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
                                          )
                                        : Container(),
                                    (_attendanceItems != null && _attendanceItems!.length > 0)
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: List.generate(_attendanceItems!.length, (parentIndex) {
                                              var currentItem = _attendanceItems![parentIndex]!;
                                              return Row(
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: 7.2,
                                                            bottom: 7.2,
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 3.6),
                                                                child: Text(
                                                                  Utils().nullSafeString(currentItem.FirstName) +
                                                                      " " +
                                                                      Utils().nullSafeString(currentItem.MiddleName) +
                                                                      " " +
                                                                      Utils().nullSafeString(currentItem.LastName) +
                                                                      " (" +
                                                                      Utils().nullSafeString(currentItem.user_id) +
                                                                      ")",
                                                                  style: TextStyle(
                                                                      fontSize: 14.4,
                                                                      color: Color(0xFF4F4F4F),
                                                                      fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 3.6),
                                                                child: Text(
                                                                  Utils().nullSafeString(currentItem.RegionName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(currentItem.CenterName) +
                                                                      " | " +
                                                                      Utils().nullSafeString(currentItem.group_name),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 12.6),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 3.6),
                                                                child: Text(
                                                                  Utils().nullSafeWithDefaultString(
                                                                      /*isForSearch()? _searchItems![index]!.email:*/ currentItem
                                                                          .email,
                                                                      "Email Id"),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 12.6),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 3.6),
                                                                child: Text(
                                                                  "Grade: " + Utils().nullSafeString(currentItem.grade),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 12.6),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 3.6),
                                                                child: Text(
                                                                  "Campus: " +
                                                                      Utils().nullSafeString(currentItem.campus_name),
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 12.6),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 5.4),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      'Present',
                                                                      style: TextStyle(
                                                                          fontSize: 12.6,
                                                                          color: Colors.blue,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 20,
                                                                      child: Radio(
                                                                        value: Constant.asPresent,
                                                                        groupValue:
                                                                            Utils().nullSafeString(currentItem.status),
                                                                        activeColor: Colors.blue,
                                                                        onChanged: (value) async {
                                                                          final _pref = await Preferences.getInstance();
                                                                          LoginModel? loginModel =
                                                                              await _pref.getToken();
                                                                          setState(() {
                                                                            if (Utils().nullSafeString(
                                                                                    _attendanceItems![parentIndex]!
                                                                                        .status) !=
                                                                                Constant.asPresent) {
                                                                              _currentAttendanceIndex = parentIndex;
                                                                              _strPreviousAttendanceStatus = Utils()
                                                                                  .nullSafeString(
                                                                                      _attendanceItems![parentIndex]!
                                                                                          .status);
                                                                              _attendanceItems![parentIndex]!.status =
                                                                                  value.toString();

                                                                              //FOR TAKE ATTENDANCE
                                                                              var params =
                                                                                  TakeCampusHangoutAttendanceRequestModel(
                                                                                Utils().nullSafeString(loginModel!
                                                                                    .login_user_type
                                                                                    .toString()),
                                                                                Utils().nullSafeString(
                                                                                    loginModel.login_parent_type),
                                                                                Utils().nullSafeString(loginModel.role),
                                                                                Utils()
                                                                                    .nullSafeInt(loginModel.bkms_id)
                                                                                    .toString(),
                                                                                _strSabhaId,
                                                                                Utils().nullSafeString(
                                                                                    currentItem.user_id),
                                                                                Utils().nullSafeString(
                                                                                    _attendanceItems![parentIndex]!
                                                                                        .status),
                                                                                Utils().nullSafeString(
                                                                                    currentItem.group_name),
                                                                                _selectedHangoutType!.wingName
                                                                                    .toString(),
                                                                                Utils()
                                                                                    .nullSafeString(currentItem.grade),
                                                                                Utils().nullSafeString(
                                                                                    _dynamicQuestionsItems![0]!
                                                                                        .fields![0]!
                                                                                        .value),
                                                                                _selectedHangoutType!.id.toString(),
                                                                              );

                                                                              _showLoadingIndicator();
                                                                              BlocProvider.of<
                                                                                          CampusHangOutDataUpdateBloc>(
                                                                                      context)
                                                                                  .add(CampusHangOutDataUpdateEvent
                                                                                      .takeCampusHangoutAttendance(
                                                                                context,
                                                                                params,
                                                                              ));
                                                                            }
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Absent',
                                                                      style: TextStyle(
                                                                          fontSize: 12.6,
                                                                          color: Colors.red,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 20,
                                                                      child: Radio(
                                                                        value: Constant.asAbsent,
                                                                        groupValue:
                                                                            Utils().nullSafeString(currentItem.status),
                                                                        activeColor: Colors.red,
                                                                        onChanged: (value) async {
                                                                          final _pref = await Preferences.getInstance();
                                                                          LoginModel? loginModel =
                                                                              await _pref.getToken();
                                                                          setState(() {
                                                                            if (Utils().nullSafeString(
                                                                                    _attendanceItems![parentIndex]!
                                                                                        .status) !=
                                                                                Constant.asAbsent) {
                                                                              _currentAttendanceIndex = parentIndex;
                                                                              _strPreviousAttendanceStatus = Utils()
                                                                                  .nullSafeString(
                                                                                      _attendanceItems![parentIndex]!
                                                                                          .status);
                                                                              _attendanceItems![parentIndex]!.status =
                                                                                  value.toString();
                                                                              ;

                                                                              //FOR TAKE ATTENDANCE
                                                                              var params =
                                                                                  TakeCampusHangoutAttendanceRequestModel(
                                                                                Utils().nullSafeString(loginModel!
                                                                                    .login_user_type
                                                                                    .toString()),
                                                                                Utils().nullSafeString(
                                                                                    loginModel.login_parent_type),
                                                                                Utils().nullSafeString(loginModel.role),
                                                                                Utils()
                                                                                    .nullSafeInt(loginModel.bkms_id)
                                                                                    .toString(),
                                                                                _strSabhaId,
                                                                                Utils().nullSafeString(
                                                                                    currentItem.user_id),
                                                                                Utils().nullSafeString(
                                                                                    _attendanceItems![parentIndex]!
                                                                                        .status),
                                                                                Utils().nullSafeString(
                                                                                    currentItem.group_name),
                                                                                _selectedHangoutType!.wingName
                                                                                    .toString(),
                                                                                Utils()
                                                                                    .nullSafeString(currentItem.grade),
                                                                                Utils().nullSafeString(
                                                                                    _dynamicQuestionsItems![0]!
                                                                                        .fields![0]!
                                                                                        .value),
                                                                                _selectedHangoutType!.id.toString(),
                                                                              );

                                                                              _showLoadingIndicator();
                                                                              BlocProvider.of<
                                                                                          CampusHangOutDataUpdateBloc>(
                                                                                      context)
                                                                                  .add(CampusHangOutDataUpdateEvent
                                                                                      .takeCampusHangoutAttendance(
                                                                                context,
                                                                                params,
                                                                              ));
                                                                            }
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Late',
                                                                      style: TextStyle(
                                                                          fontSize: 12.6,
                                                                          color: Colors.orange,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 20,
                                                                      child: Radio(
                                                                        value: Constant.asLate,
                                                                        groupValue:
                                                                            Utils().nullSafeString(currentItem.status),
                                                                        activeColor: Colors.orange,
                                                                        onChanged: (value) async {
                                                                          final _pref = await Preferences.getInstance();
                                                                          LoginModel? loginModel =
                                                                              await _pref.getToken();
                                                                          setState(() {
                                                                            if (Utils().nullSafeString(
                                                                                    _attendanceItems![parentIndex]!
                                                                                        .status) !=
                                                                                Constant.asLate) {
                                                                              _currentAttendanceIndex = parentIndex;
                                                                              _strPreviousAttendanceStatus = Utils()
                                                                                  .nullSafeString(
                                                                                      _attendanceItems![parentIndex]!
                                                                                          .status);
                                                                              _attendanceItems![parentIndex]!.status =
                                                                                  value.toString();

                                                                              //FOR TAKE ATTENDANCE
                                                                              var params =
                                                                                  TakeCampusHangoutAttendanceRequestModel(
                                                                                Utils().nullSafeString(loginModel!
                                                                                    .login_user_type
                                                                                    .toString()),
                                                                                Utils().nullSafeString(
                                                                                    loginModel.login_parent_type),
                                                                                Utils().nullSafeString(loginModel.role),
                                                                                Utils()
                                                                                    .nullSafeInt(loginModel.bkms_id)
                                                                                    .toString(),
                                                                                _strSabhaId,
                                                                                Utils().nullSafeString(
                                                                                    currentItem.user_id),
                                                                                Utils().nullSafeString(
                                                                                    _attendanceItems![parentIndex]!
                                                                                        .status),
                                                                                Utils().nullSafeString(
                                                                                    currentItem.group_name),
                                                                                _selectedHangoutType!.wingName
                                                                                    .toString(),
                                                                                Utils()
                                                                                    .nullSafeString(currentItem.grade),
                                                                                Utils().nullSafeString(
                                                                                    _dynamicQuestionsItems![0]!
                                                                                        .fields![0]!
                                                                                        .value),
                                                                                _selectedHangoutType!.id.toString(),
                                                                              );

                                                                              _showLoadingIndicator();
                                                                              BlocProvider.of<
                                                                                          CampusHangOutDataUpdateBloc>(
                                                                                      context)
                                                                                  .add(CampusHangOutDataUpdateEvent
                                                                                      .takeCampusHangoutAttendance(
                                                                                context,
                                                                                params,
                                                                              ));
                                                                            }
                                                                          });
                                                                        },
                                                                      ),
                                                                    )
                                                                  ],
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
                                                ],
                                              );
                                            }),
                                          )
                                        : Container(),
                                    ((_attendanceItems == null || _attendanceItems!.length <= 0) && isForFilter() == 2)
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 18, top: 18),
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
                                                        "No Attendance found.",
                                                        style: TextStyle(color: Color(0xFF828282), fontSize: 12.6),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(7.2),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                    7.2,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Showing no results based on filters. ",
                                                        style: TextStyle(
                                                          fontSize: 12.6,
                                                          color: Color(0xFF4F4F4F),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        behavior: HitTestBehavior.opaque,
                                                        onTap: () async {
                                                          _strFSchoolYear = "";
                                                          _strFFirstName = "";
                                                          _strFMiddleName = "";
                                                          _strFLastName = "";
                                                          _strFUserId = "";

                                                          //FOR ADD SELECTED FILTERS
                                                          BlocProvider.of<ParamsBloc>(context)
                                                              .add(CampusHangoutAttendanceFiltersEvent(
                                                            _strFSchoolYear,
                                                            _strFFirstName,
                                                            _strFMiddleName,
                                                            _strFLastName,
                                                            _strFUserId,
                                                          ));

                                                          final _pref = await Preferences.getInstance();
                                                          LoginModel? loginModel = await _pref.getToken();

                                                          //FOR GET CAMPUS HANGOUT ATTENDANCE
                                                          var params = SubmitCampusHangoutAttendanceRequestModel(
                                                            Utils()
                                                                .nullSafeString(loginModel!.login_user_type.toString()),
                                                            Utils().nullSafeString(loginModel.login_parent_type),
                                                            Utils().nullSafeString(loginModel.role),
                                                            Utils().nullSafeInt(loginModel.bkms_id).toString(),
                                                            Utils().nullSafeString(
                                                                _dynamicQuestionsItems![0]!.fields![0]!.value),
                                                            _selectedHangoutType!.id.toString(),
                                                            _selectedCampus!.id.toString(),
                                                            _selectedRegion!.id.toString(),
                                                            "2",
                                                            _strFSchoolYear,
                                                            _strFFirstName,
                                                            _strFMiddleName,
                                                            _strFLastName,
                                                            _strFUserId,
                                                          );

                                                          _attendanceItems = [];
                                                          _showLoadingIndicator();
                                                          BlocProvider.of<CampusHangOutDataUpdateBloc>(context).add(
                                                              CampusHangOutDataUpdateEvent
                                                                  .submitCampusHangoutAttendance(context, params));
                                                        },
                                                        child: Text(
                                                          "Clear filters",
                                                          style: TextStyle(fontSize: 12.6, color: Colors.blue),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    (_dynamicQuestionsItems != null && _dynamicQuestionsItems!.length > 0)
                                        ? SizedBox(
                                            height: 87.84,
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ),
                            (_attendanceItems != null && _attendanceItems!.length > 0)
                                ? Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
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
                                          padding: EdgeInsets.only(top: 18, left: 21.6, right: 21.6, bottom: 18),
                                          // width: double.infinity,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateColor.resolveWith((states) => Color(0xff2F80ED)),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(9),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  /*if(_strCampusHangoutId.isNotEmpty){*/
                                                  final _pref = await Preferences.getInstance();
                                                  LoginModel? loginModel = await _pref.getToken();

                                                  _submitCampusHangoutReportRequestModel = [];
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel(
                                                          "login_user_type",
                                                          Utils()
                                                              .nullSafeString(loginModel!.login_user_type.toString()),
                                                          null,
                                                          null));
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel(
                                                          "login_parent_type",
                                                          Utils().nullSafeString(loginModel.login_parent_type),
                                                          null,
                                                          null));
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel(
                                                          "bkms_id",
                                                          Utils().nullSafeInt(loginModel.bkms_id).toString(),
                                                          null,
                                                          null));
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel(
                                                          "region",
                                                          Utils().nullSafeInt(_selectedRegion!.id).toString(),
                                                          null,
                                                          null));
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel("campus",
                                                          Utils().nullSafeString(_selectedCampus!.id), null, null));
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel(
                                                          "hangout_type",
                                                          Utils().nullSafeString(_selectedHangoutType!.id.toString()),
                                                          null,
                                                          null));
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel("campus_hangout_date",
                                                          _dynamicQuestionsItems![0]!.fields![0]!.value, null, null));
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel(
                                                          "sabha_id", _strSabhaId, null, null));
                                                  _submitCampusHangoutReportRequestModel.add(
                                                      SubmitCampusHangoutReportRequestModel(
                                                          "campus_hangout_id", _strCampusHangoutId, null, null));

                                                  if (validateInteractionsInformation()) {
                                                    setState(() {
                                                      _showLoadingIndicator();
                                                      BlocProvider.of<CampusHangoutBloc>(context).add(
                                                          CampusHangoutEvent.submitCampusHangoutReport(
                                                              context, _submitCampusHangoutReportRequestModel));
                                                    });
                                                  }
                                                  /*}else{
                                        Utils().showToast("Attendance Status is missing in one or more individuals. Please provide attendance status!");
                                      }*/
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.8),
                                                  child: Text(
                                                    "Submit",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(color: Colors.white, fontSize: 14.4),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container()
                          ]),
                        ),
                      ],
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

  //region FOR VALIDATE INTERACTIONS INFORMATION
  bool validateInteractionsInformation() {
    bool isForError = false;
    if (_dynamicQuestionsItems != null) {
      String strValidationMessage = '';
      for (int parentIndex = 0; parentIndex < _dynamicQuestionsItems!.length; parentIndex++) {
        var currentItem = _dynamicQuestionsItems![parentIndex]!;
        for (int fieldIndex = 0; fieldIndex < currentItem.fields!.length; fieldIndex++) {
          var field = currentItem.fields![fieldIndex]!;

          if (field.type == Constant.brftSELECT) {
            if (field.selected != null && field.selected!.length > 0) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.selected), null, null));
            }

            if (field.is_required!) {
              if (field.selected == null || field.selected!.length <= 0) {
                isForError = true;
                strValidationMessage = /*"Please select " + */ Utils()
                    .nullSafeString(field.validation_message) /* + "."*/;
                break;
              }
            }
          }

          if (field.type == Constant.brftRADIO) {
            if (field.selected != null && field.selected!.length > 0) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.selected), null, null));
            }

            if (field.is_required!) {
              if (field.selected == null || field.selected!.length <= 0) {
                isForError = true;
                strValidationMessage = /*"Please select " + */ Utils()
                    .nullSafeString(field.validation_message) /* + "."*/;
                break;
              }
            }
          }

          if (field.type == Constant.brftDROPDOWN) {
            if (field.selected != null && field.selected!.length > 0) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.selected), null, null));
            }

            if (field.is_required!) {
              if (field.selected == null || field.selected!.length <= 0) {
                isForError = true;
                strValidationMessage = /*"Please select " + */ Utils()
                    .nullSafeString(field.validation_message) /* + "."*/;
                break;
              }
            }
          }

          if (field.type == Constant.brftTEXTBOX) {
            if (field.value != null) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required!) {
              if (Utils().nullSafeString(field.value).isEmpty) {
                isForError = true;
                strValidationMessage = /*"Please enter " +*/ Utils()
                    .nullSafeString(field.validation_message) /* + "."*/;
                break;
              }
            }
          }

          if (field.type == Constant.brftNUMERIC_TEXTBOX) {
            if (field.value != null) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required!) {
              if (Utils().nullSafeString(field.value).isEmpty) {
                isForError = true;
                strValidationMessage = /*"Please enter " +*/ Utils()
                    .nullSafeString(field.validation_message) /* + "."*/;
                break;
              }
            }
          }

          if (field.type == Constant.brftTEXTAREA) {
            if (field.value != null) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required!) {
              if (Utils().nullSafeString(field.value).isEmpty) {
                isForError = true;
                strValidationMessage = /*"Please enter " +*/ Utils()
                    .nullSafeString(field.validation_message) /* + "."*/;
                break;
              }
            }
          }

          if (field.type == Constant.brftEMAIL) {
            if (field.value != null) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required!) {
              if (Utils().nullSafeString(field.value).isEmpty) {
                isForError = true;
                strValidationMessage = "Please enter your Email Address.";
                break;
              } else {
                if (!Utils().validateEmail(Utils().nullSafeString(field.value))) {
                  isForError = true;
                  strValidationMessage = "Please enter valid Email Address.";
                  break;
                }
              }
            }
          }

          if (field.type == Constant.brftTELEPHONE) {
            if (field.value != null) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required!) {
              if (Utils().nullSafeString(field.value).isEmpty) {
                isForError = true;
                strValidationMessage = "Please enter your Telephone Number.";
                break;
              } else {
                if (Utils().nullSafeString(field.value).length < 10 ||
                    Utils().nullSafeString(field.value).length > 15) {
                  isForError = true;
                  strValidationMessage = "Please enter valid Telephone Number.";
                  break;
                }
              }
            }
          }

          if (field.type == Constant.brftDATE) {
            //ADD WHETHER NULL-AS PER OUR LOGIC.
            if (field.value == null || field.value!.isEmpty) {
              _dynamicQuestionsItems![parentIndex]!.fields![fieldIndex]!.value =
                  Utils().changeDateFormat(DateTime.now(), Constant.defaultDateFormatWeb);
            }

            if (_dynamicQuestionsItems![parentIndex]!.fields![fieldIndex]!.value != null) {
              _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required!) {
              if (Utils().nullSafeString(_dynamicQuestionsItems![parentIndex]!.fields![fieldIndex]!.value).isEmpty) {
                isForError = true;
                strValidationMessage = "Please choose your " + Utils().nullSafeString(field.validation_message) + ".";
                break;
              }
            }
          }

          if (field.type == Constant.brftFILE) {
            if (field.value != null) {
              if (Utils().validateWebURL(Utils().nullSafeString(field.value))) {
                _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                    Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
              } else {
                _submitCampusHangoutReportRequestModel.add(SubmitCampusHangoutReportRequestModel(
                    Utils().nullSafeString(field.name), null, null, File(Utils().nullSafeString(field.value))));
              }
            }

            if (field.is_required!) {
              if (Utils().nullSafeString(field.value).isEmpty) {
                isForError = true;
                strValidationMessage = "Please select " + Utils().nullSafeString(field.validation_message) + ".";
                break;
              }
            }
          }
        }

        if (isForError) {
          break;
        }
      }

      if (isForError) {
        Utils().showToast(strValidationMessage);
      }
    } else {
      isForError = true;
    }

    return !isForError;
  }
//endregion

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

  //region SHOW DATE PICKER FOR PICK THE DATE
  Future<void> _selectDate(BuildContext context, DateTime dateTime, int parentIndex, int fieldIndex) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: dateTime, firstDate: DateTime(1900, 1), lastDate: DateTime.now());
    if (picked != null && picked != dateTime)
      setState(() async {
        _dynamicQuestionsItems![parentIndex]!.fields![fieldIndex]!.value =
            Utils().changeDateFormat(picked, Constant.defaultDateFormatWeb);

        if (parentIndex == 0 && fieldIndex == 0) {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          //FOR GET CAMPUS HANGOUT ATTENDANCE
          var params = SubmitCampusHangoutAttendanceRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            Utils().nullSafeString(_dynamicQuestionsItems![parentIndex]!.fields![fieldIndex]!.value),
            _selectedHangoutType!.id.toString(),
            _selectedCampus!.id.toString(),
            _selectedRegion!.id.toString(),
            "2",
            _strFSchoolYear,
            _strFFirstName,
            _strFMiddleName,
            _strFLastName,
            _strFUserId,
          );

          _attendanceItems = [];
          _showLoadingIndicator();
          BlocProvider.of<CampusHangOutDataUpdateBloc>(context)
              .add(CampusHangOutDataUpdateEvent.submitCampusHangoutAttendance(context, params));
        }
      });
  }
  //endregion

  //region SHOW CONFIRMATION DIALOG FOR ATTACHMENT PICKER
  Future<void> _showAttachmentPickerDialog(int parentIndex, int fieldIndex) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Where from you want to select the Attachment?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Camera'),
              onPressed: () async {
                Navigator.of(context).pop();

                final cameras = await availableCameras();
                final firstCamera = cameras.first;

                String strImagePath = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakePictureScreen(
                      camera: firstCamera,
                    ),
                  ),
                );

                if (Utils().nullSafeString(strImagePath).isNotEmpty) {
                  setState(() {
                    _dynamicQuestionsItems![parentIndex]!.fields![fieldIndex]!.value = strImagePath;
                  });
                }
              },
            ),
            TextButton(
              child: Text('File manager'),
              onPressed: () async {
                Navigator.of(context).pop();

                FilePickerResult? result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    _dynamicQuestionsItems![parentIndex]!.fields![fieldIndex]!.value =
                        Utils().nullSafeString(result.files.single.path);
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }
//endregion

  //region FOR CHECK WHETHER IS FILTERS PARAMS FILLED OR NOT
  int isForFilter() {
    if (_strFSchoolYear.isNotEmpty) {
      return 2;
    }

    if (_strFFirstName.isNotEmpty) {
      return 2;
    }

    if (_strFMiddleName.isNotEmpty) {
      return 2;
    }

    if (_strFLastName.isNotEmpty) {
      return 2;
    }

    if (_strFUserId.isNotEmpty) {
      return 2;
    }
    return 1;
  }
  //endregion

  //region FOR CLEAR ALL
  void clearAll() {
    _strFSchoolYear = "";
    _strFFirstName = "";
    _strFMiddleName = "";
    _strFLastName = "";
    _strFUserId = "";

    //FOR ADD SELECTED FILTERS
    BlocProvider.of<ParamsBloc>(context).add(CampusHangoutAttendanceFiltersEvent(
      _strFSchoolYear,
      _strFFirstName,
      _strFMiddleName,
      _strFLastName,
      _strFUserId,
    ));

    _selectedRegion = null;

    _campusItems = [];
    _selectedCampus = null;

    _hangoutTypesItems = [];
    _selectedHangoutType = null;

    _dynamicQuestionsItems = [];

    _attendanceItems = [];
    _currentAttendanceIndex = 0;
    _strPreviousAttendanceStatus = "";
    _strSabhaId = "";
    _strCampusHangoutId = "";
  }
//endregion
}
