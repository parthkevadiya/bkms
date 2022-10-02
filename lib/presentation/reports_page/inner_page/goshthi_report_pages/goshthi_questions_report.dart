import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/goshthi_report_attendance_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/sabha_report_questions_model.dart';
import 'package:flutter_app/models/submit_sabha_report_request_model.dart';
import 'package:flutter_app/models/update_goshthi_held_status_request_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bloc/report_bloc.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/goshthi_data_update_bloc.dart';
import '../../../../loader.dart';
import '../../../../preferences.dart';

class GoshthiQuectionReport extends StatefulWidget {
  const GoshthiQuectionReport(this.karyakar_goshti_sabha_id, this.strSabhaDate, this.strWing, this.strCenter,
      this.strRegion, this.strSabhaLabel, this.strGender, this.strGoshthiHeld,
      {Key? key})
      : super(key: key);

  final String karyakar_goshti_sabha_id;
  final String strSabhaDate;
  final String strWing;
  final String strCenter;
  final String strRegion;
  final String strSabhaLabel;
  final String strGender;
  final String strGoshthiHeld;

  @override
  _GoshthiQuectionReportState createState() => _GoshthiQuectionReportState();
}

class _GoshthiQuectionReportState extends State<GoshthiQuectionReport> {
  String _strGoshthiHeld = "";
  bool _isLoading = false;

  List<GoshthiAttendanceDataModel?>? _goshthiAttendanceItems = [];
  int _totalRecords = 0;

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
    _strGoshthiHeld = widget.strGoshthiHeld;
    super.initState();

    calculateProgress(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GoshthiDataUpdateBloc, GoshthiDataUpdateState>(
          listener: (context, state) {
            state.maybeWhen(
                updateGoshthiHeldStatus: (updateGoshthiHeldStatusModel) {
                  if (updateGoshthiHeldStatusModel != null) {
                    _hideLoadingIndicator();
                    if (updateGoshthiHeldStatusModel.has_error!) {
                      _strGoshthiHeld = _strGoshthiHeld == "1" ? "0" : "1";
                    }
                  } else {
                    _strGoshthiHeld = _strGoshthiHeld == "1" ? "0" : "1";
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is UpdateGoshthiAttendanceState) {
              setState(() {
                _hideLoadingIndicator();
                _totalRecords = state.totalRecords;
                _goshthiAttendanceItems = state.goshthiAttendanceItems;
              });
            }
          },
        ),
      ],
      child: Stack(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 14.4, right: 14.4, bottom: 72),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 14.64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: getSecondStageMargin(Utils().nullSafeString(""))),
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
                      margin: EdgeInsets.only(top: 7.32, left: getSecondStageMargin(Utils().nullSafeString(""))),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getSecondStageMargin(Utils().nullSafeString(""))),
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

                                if (_goshthiAttendanceItems == null || _goshthiAttendanceItems!.length <= 0) {
                                  final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
                                  if (paramsBloc is UpdateGoshthiAttendanceState) {
                                    _goshthiAttendanceItems = [];
                                    _totalRecords = 0;
                                    _totalRecords = paramsBloc.totalRecords;
                                    _goshthiAttendanceItems = paramsBloc.goshthiAttendanceItems;
                                  }
                                }

                                List<StatusArrayModel> statusArrayModel = [];
                                if (_goshthiAttendanceItems != null) {
                                  for (int v = 0; v < _goshthiAttendanceItems!.length; v++) {
                                    if (_goshthiAttendanceItems![v] != null) {
                                      var item = _goshthiAttendanceItems![v];
                                      if (item!.status != null) {
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
                                  widget.karyakar_goshti_sabha_id,
                                  widget.strCenter,
                                  widget.strRegion,
                                  _strGoshthiHeld,
                                  widget.strSabhaDate,
                                  widget.strSabhaLabel,
                                  widget.strWing,
                                  "$_totalRecords",
                                  statusArrayModel,
                                );

                                setState(() {
                                  calculateProgress(context);

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
                                            color: (_strGoshthiHeld == (index == 0 ? "1" : "0"))
                                                ? Colors.blue
                                                : Colors.grey,
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
                                  )
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
              ),
              Container(
                height: 14.64,
              )
            ],
          ),
        ),
        Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
      ]),
    );
  }

  //region FOR GET FIRST STAGE MARGIN
  double getFirstStageMargin(String value) {
    double margin = 0.0;
    if (value.isNotEmpty) {
      margin = 10.98;
    }
    return margin;
  }

  //endregion

  //region FOR GET SECOND STAGE MARGIN
  double getSecondStageMargin(String value) {
    double margin = 10.98;
    if (value.isNotEmpty) {
      margin = 25.62;
    }
    return margin;
  }
//endregion

  //region FOR GET THIRD STAGE MARGIN
  double getThirdStageMargin(String value) {
    double margin = 25.62;
    if (value.isNotEmpty) {
      margin = 40.26;
    }
    return margin;
  }
  //endregion

  //region FOR CALCULATE PROGRESS
  void calculateProgress(BuildContext context) {
    BlocProvider.of<ParamsBloc>(context).add(SabhaQuestionsProgressEvent(_strGoshthiHeld.isNotEmpty ? 1.0 : 0.0));
  }
//endregion
}
