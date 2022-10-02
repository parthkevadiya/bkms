import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/sabha_report_questions_model.dart';
import 'package:flutter_app/models/submit_sabha_report_request_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Bloc/sabha_report_question_bloc.dart';
import '../../../../loader.dart';
import '../../../../preferences.dart';

class SabhaQuectionReport extends StatefulWidget {
  static String updateTime = "";
  const SabhaQuectionReport(
      this.strSabhaReportId, this.strSabhaDate, this.strWingId, this.strCenterId, this.strRegionId, this.strSabhaLabel,
      {Key? key})
      : super(key: key);

  final String strSabhaReportId;
  final String strSabhaDate;
  final String strWingId;
  final String strCenterId;
  final String strRegionId;
  final String strSabhaLabel;

  @override
  _SabhaQuectionReportState createState() => _SabhaQuectionReportState();
}

class _SabhaQuectionReportState extends State<SabhaQuectionReport> {
  List<SabhaQuestionsModel?>? _sabhaQuestionsItems = [];
  List<SubmitSabhaReportQuestionsRequestModel> _submitSabhaReportRequestItems = [];

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

    //FOR GET SABHA REPORTS QUESTIONS
    _showLoadingIndicator();
    BlocProvider.of<SabhaReportQuestionAttendanceBloc>(context)
        .add(SabhaReportQuestionAttendanceEvent.sabhaReportQuestions(context, widget.strSabhaReportId));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SabhaReportQuestionAttendanceBloc, SabhaReportQuestionAttendanceState>(
          listener: (context, state) {
            state.maybeWhen(
                sabhaReportQuestions: (sabhaReportQuestionsModel, l) {
                  if (l == LoadingStatus.Done) {
                    if (sabhaReportQuestionsModel != null) {
                      if (sabhaReportQuestionsModel.sabha_questions != null) {
                        _hideLoadingIndicator();
                        this._sabhaQuestionsItems = sabhaReportQuestionsModel.sabha_questions;
                        SabhaQuectionReport.updateTime = sabhaReportQuestionsModel.sabha_update_time!;
                        calculateProgress(context);
                      }
                    }
                  } else {
                    if (l == LoadingStatus.Error) {
                      setState(() {
                        _hideLoadingIndicator();
                        _sabhaQuestionsItems!.clear();
                      });
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<SabhaReportQuestionAttendanceBloc, SabhaReportQuestionAttendanceState>(
          listener: (context, state) {
            state.maybeWhen(
              submitSabhaReportQuestions: (SabhaReportQuestions, l) {
                if (l == LoadingStatus.Done) {
                  _hideLoadingIndicator();
                } else {
                  if (l == LoadingStatus.Error) {
                    _hideLoadingIndicator();
                  }
                }
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              FocusScope.of(context).requestFocus(new FocusNode());
            });
          },
          child: Padding(
            padding: EdgeInsets.only(left: 14.4, right: 14.4, bottom: 72),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(_sabhaQuestionsItems!.length, (parentIndex) {
                      var currentItem = _sabhaQuestionsItems![parentIndex]!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(currentItem.fields!.length, (fieldIndex) {
                          var field = currentItem.fields![fieldIndex];
                          if (field != null) {
                            if (Utils().nullSafeString(field.type) == Constant.brftRADIO) {
                              var options = field.options;
                              return (isForDisplay(parentIndex))
                                  ? Container(
                                      margin: EdgeInsets.only(top: 14.64),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          parentIndex != 0
                                              ? SizedBox(
                                                  height: 14.64,
                                                )
                                              : Container(),
                                          (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                              ? Container(
                                                  margin: EdgeInsets.only(
                                                      left: getFirstStageMargin(
                                                          Utils().nullSafeString(currentItem.label)),
                                                      bottom: 14.64),
                                                  child: Text(
                                                    Utils().nullSafeString(currentItem.label),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16.2,
                                                        color: Colors.grey[700]),
                                                  ))
                                              : Container(),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
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
                                                      text: Utils().nullSafeString(field.label),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16.2,
                                                          color: Colors.grey[700])),
                                                  new TextSpan(
                                                      text: currentItem.fields![fieldIndex]!.is_required! ? "*" : "",
                                                      style: new TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16.2,
                                                          color: Colors.red)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 7.32,
                                                left: getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                            child: Divider(
                                              thickness: 0.5,
                                            ),
                                          ),
                                          options != null
                                              ? Container(
                                                  margin: EdgeInsets.only(
                                                      left: getSecondStageMargin(
                                                          Utils().nullSafeString(currentItem.label))),
                                                  child: ListView.separated(
                                                    physics: NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    padding: EdgeInsets.only(
                                                      top: 7.32,
                                                      bottom: 14.64,
                                                    ),
                                                    itemCount: options.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            FocusScope.of(context).requestFocus(FocusNode());
                                                            _sabhaQuestionsItems![parentIndex]!
                                                                .fields![fieldIndex]!
                                                                .selected = options[index]!.id;
                                                            calculateProgress(context);
                                                          });
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
                                                                            color: (field.selected != null &&
                                                                                    field.selected ==
                                                                                        options[index]!.id)
                                                                                ? Colors.blue
                                                                                : Colors.grey,
                                                                            width: 1.44),
                                                                      ),
                                                                      child: Icon(
                                                                        Icons.done,
                                                                        color: (field.selected != null &&
                                                                                field.selected == options[index]!.id)
                                                                            ? Colors.blue
                                                                            : Colors.grey,
                                                                        size: 10.8,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      Utils().nullSafeString(options[index]!.value),
                                                                      style: TextStyle(
                                                                          fontSize: 14.4,
                                                                          color: (field.selected != null &&
                                                                                  field.selected == options[index]!.id)
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
                                                    separatorBuilder: (BuildContext context, int index) =>
                                                        const Divider(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }

                            if (Utils().nullSafeString(field.type) == Constant.brftTEXTBOX) {
                              final TextEditingController _controller = new TextEditingController();
                              _controller.text = Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
                              _controller.selection =
                                  TextSelection.fromPosition(TextPosition(offset: _controller.text.length));

                              return (isForDisplay(parentIndex))
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        parentIndex != 0
                                            ? SizedBox(
                                                height: 21.96,
                                              )
                                            : Container(),
                                        (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                            ? Container(
                                                margin: EdgeInsets.only(bottom: 14.64),
                                                child: Text(
                                                  Utils().nullSafeString(currentItem.label),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.black),
                                                ))
                                            : Container(),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: getFirstStageMargin(Utils().nullSafeString(currentItem.label))),
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
                                                        color: Colors.black)),
                                                new TextSpan(
                                                    text: currentItem.fields![fieldIndex]!.is_required! ? "*" : "",
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
                                              left: getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                          child: Column(
                                            children: [
                                              TextField(
                                                enabled: (true),
                                                onChanged: (value) {
                                                  setState(() {
                                                    currentItem.fields![fieldIndex]!.value = value;
                                                    calculateProgress(context);
                                                  });
                                                },
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.text,
                                                controller: _controller,
                                                decoration: InputDecoration(
                                                  hintText: Utils().nullSafeString(
                                                      currentItem.fields![fieldIndex]!.validation_message),
                                                  suffixIcon: (currentItem.fields![fieldIndex]!.is_required! &&
                                                          Utils()
                                                              .nullSafeString(currentItem.fields![fieldIndex]!.value)
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
                                                // focusNode: FocusNode(),
                                              ),
                                              (currentItem.fields![fieldIndex]!.is_required! &&
                                                      Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value)
                                                          .isEmpty)
                                                  ? Padding(
                                                      padding: EdgeInsets.only(bottom: 7.2),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: Color(0x1FEB5757),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(
                                                                  /*"Please enter " + */
                                                                  Utils().nullSafeString(currentItem
                                                                      .fields![fieldIndex]!
                                                                      .validation_message) /* + "."*/,
                                                                  style: TextStyle(
                                                                      color: Color(0xffEB5757), fontSize: 10.8),
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
                                          height: 0.732,
                                        ),
                                      ],
                                    )
                                  : Container();
                            }

                            (parentIndex == (_sabhaQuestionsItems!.length - 1))
                                ? Container(
                                    height: 14.64,
                                  )
                                : Container();
                          }
                          return Container();
                        }),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
        Align(
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
                padding: EdgeInsets.only(top: 18, left: 21.6, right: 21.6, bottom: 21.6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final _pref = await Preferences.getInstance();
                        LoginModel? loginModel = await _pref.getToken();

                        _submitSabhaReportRequestItems = [];
                        _submitSabhaReportRequestItems.add(SubmitSabhaReportQuestionsRequestModel(
                            "login_user_type", Utils().nullSafeString(loginModel!.login_user_type.toString()), -1));
                        _submitSabhaReportRequestItems.add(SubmitSabhaReportQuestionsRequestModel(
                            "login_parent_type", Utils().nullSafeString(loginModel.login_parent_type), -1));
                        _submitSabhaReportRequestItems.add(SubmitSabhaReportQuestionsRequestModel(
                            "user_role_type", Utils().nullSafeString(loginModel.role), -1));
                        _submitSabhaReportRequestItems.add(SubmitSabhaReportQuestionsRequestModel(
                            "bkms_id", "", Utils().nullSafeInt(loginModel.bkms_id)));
                        _submitSabhaReportRequestItems.add(SubmitSabhaReportQuestionsRequestModel(
                            "sabha_id", Utils().nullSafeString(widget.strSabhaReportId).toString(), -1));
                        _submitSabhaReportRequestItems.add(SubmitSabhaReportQuestionsRequestModel(
                            "sabha_date",
                            Utils().changeDateFormatString(
                                widget.strSabhaDate, Constant.defaultDateFormat, Constant.defaultDateFormatWeb),
                            -1));

                        if (validateSubmitReportData()) {
                          setState(() {
                            _showLoadingIndicator();
                            BlocProvider.of<SabhaReportQuestionAttendanceBloc>(context).add(
                                SabhaReportQuestionAttendanceEvent.submitSabhaReportQuestions(
                                    context, _submitSabhaReportRequestItems));
                          });
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.8),
                        child: Text(
                          "Submit Report",
                          style: TextStyle(color: Colors.white, fontSize: 14.4),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
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

  //region LOGIC FOR DISPLAY PARTICULAR QUESTION OR NOT
  bool isForDisplay(int parentIndex) {
    bool isForDisplay = true;
    if (_sabhaQuestionsItems != null) {
      var currentItem = _sabhaQuestionsItems![parentIndex]!;

      if (_sabhaQuestionsItems != null && _sabhaQuestionsItems!.length > 1) {
        //FOR 2ND POSITION CLICK - IF SECOND POSITION STATUS WILL BE NO THEN BELOW ALL THE HIDDEN(NEED TO BE) FIELDS WILL BE HIDDEN.
        try {
          if (Utils().nullSafeString(_sabhaQuestionsItems![1]!.fields![0]!.selected) !=
              Utils().nullSafeString(_sabhaQuestionsItems![1]!.fields![0]!.options![0]!.id)) {
            if (Utils().nullSafeInt(currentItem.is_hidden) == 1) {
              isForDisplay = ((parentIndex == 0) || (parentIndex == 1));
            }
          }
        } catch (e) {
          print(e);
        }
      }

      //FOR 1ST POSITION CLICK - IF FIRST POSITION STATUS WILL BE NO THEN BELOW ALL THE FIELDS WILL BE HIDDEN
      try {
        if (_sabhaQuestionsItems != null && _sabhaQuestionsItems!.length > 0) {
          if (Utils().nullSafeString(_sabhaQuestionsItems![0]!.fields![0]!.selected) !=
              Utils().nullSafeString(_sabhaQuestionsItems![0]!.fields![0]!.options![0]!.id)) {
            isForDisplay = (parentIndex == 0);
          }
        }
      } catch (e) {
        print(e);
      }
    }
    return isForDisplay;
  }
//endregion

  //region FOR VALIDATE SUBMIT REPORT DATA
  bool validateSubmitReportData() {
    bool isForError = false;
    String strValidationMessage = '';

    if (_sabhaQuestionsItems != null) {
      for (int parentIndex = 0; parentIndex < _sabhaQuestionsItems!.length; parentIndex++) {
        var currentItem = _sabhaQuestionsItems![parentIndex]!;

        if (isForDisplay(parentIndex)) {
          for (int fieldIndex = 0; fieldIndex < currentItem.fields!.length; fieldIndex++) {
            var field = currentItem.fields![fieldIndex];

            if (field!.type == Constant.brftRADIO) {
              if (field.selected != null) {
                _submitSabhaReportRequestItems.add(SubmitSabhaReportQuestionsRequestModel(
                    Utils().nullSafeString(field.name), Utils().nullSafeString(field.selected), -1));
              }

              if (field.is_required!) {
                if (Utils().nullSafeString(field.selected).isEmpty) {
                  isForError = true;
                  strValidationMessage = Utils().nullSafeString(field.validation_message);
                  break;
                }
              }
            }

            if (field.type == Constant.brftTEXTBOX) {
              if (field.value != null) {
                _submitSabhaReportRequestItems.add(SubmitSabhaReportQuestionsRequestModel(
                    Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), -1));
              }

              if (field.is_required!) {
                if (Utils().nullSafeString(field.value).isEmpty) {
                  isForError = true;
                  strValidationMessage = Utils().nullSafeString(field.validation_message);
                  break;
                }
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

//region FOR CALCULATE PROGRESS
  void calculateProgress(BuildContext context) {
    int filledQuestions = 0;
    int totalQuestions = 0;

    if (_sabhaQuestionsItems != null) {
      for (int parentIndex = 0; parentIndex < _sabhaQuestionsItems!.length; parentIndex++) {
        var currentItem = _sabhaQuestionsItems![parentIndex]!;

        if (isForDisplay(parentIndex)) {
          for (int fieldIndex = 0; fieldIndex < currentItem.fields!.length; fieldIndex++) {
            var field = currentItem.fields![fieldIndex];

            if (field!.type == Constant.brftRADIO) {
              if (field.selected != null && Utils().nullSafeString(field.selected).isNotEmpty) {
                filledQuestions++;
              }

              totalQuestions++;
            }

            if (field.type == Constant.brftTEXTBOX) {
              if (field.value != null && Utils().nullSafeString(field.value).isNotEmpty) {
                filledQuestions++;
              }

              totalQuestions++;
            }
          }
        }
      }
    }

    var progress = 0.0;
    progress = (100 * filledQuestions) / totalQuestions;

    BlocProvider.of<ParamsBloc>(context).add(SabhaQuestionsProgressEvent((progress / 100)));
  }
//endregion
}
