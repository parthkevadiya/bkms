import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/basic_registration_form_model.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/submit_basic_registration_details_request_model.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_app/presentation/homepage/innerpage/take_picture_screen.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../loader.dart';
import '../../../preferences.dart';
import 'eventpage.dart';

class BasicRegistrationForm extends StatefulWidget {
  static String id = "basicRegistrationForm";
  static String path = "${EventPage.path}/$id";

  @override
  _BasicRegistrationFormState createState() => _BasicRegistrationFormState();
}

class _BasicRegistrationFormState extends State<BasicRegistrationForm> with TickerProviderStateMixin {
  UserProfileModel? userProfileModel;
  late MyEvent _myEventItem;
  bool _isViewMode = false;

  List<SubmitBasicRegistrationDetailsRequestModel> _submitBasicRegistrationDetailsRequestModelItems = [];

  bool registrationInformation = true;

  List<FormFields?>? _formFieldsItems = [];
  String? _strFormType;

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

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is EventState) {
      _myEventItem = paramsBloc.myEvent;
      _isViewMode = (Utils().nullSafeString(_myEventItem.basic_registration_status) == Constant.eCompleted);
    }

    _showLoadingIndicator();
    BlocProvider.of<HomeBloc>(context).add(
        HomeEvent.basicRegistrationsDetails(context, Utils().nullSafeString(_myEventItem.id.toString()), _isViewMode));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            state.maybeWhen(
                basicRegistrationsDetails: (basicRegistrationsFormModel, l) {
                  if (l == LoadingStatus.Done) {
                    _hideLoadingIndicator();
                    if (basicRegistrationsFormModel != null) {
                      _strFormType = basicRegistrationsFormModel.form_type;
                      if (basicRegistrationsFormModel.event_form.form_fields != null) {
                        this._formFieldsItems = basicRegistrationsFormModel.event_form.form_fields;
                      }
                    }
                  } else {
                    if (l == LoadingStatus.Error) {
                      _hideLoadingIndicator();
                    }
                  }
                },
                submitBasicRegistrationsDetails: (submitBasicRegistrationsModel, l) {
                  if (l == LoadingStatus.Done) {
                    _hideLoadingIndicator();
                    if (submitBasicRegistrationsModel != null) {
                      if (!submitBasicRegistrationsModel.has_error) {
                        //FOR RETURN AFTER SUCCESSFULLY SUBMITTED BASIC REGISTRATION DATA
                        BlocProvider.of<ParamsBloc>(context)
                            .add(UpdateRegistrationStatusEvent(Constant.ertBasicRegistration));
                        Navigator.pop(context);
                      }
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
      ],
      child: KeyboardVisibilityBuilder(
        builder: (p0, isKeyboardVisible) {
          return Stack(children: [
            Container(
                child: Column(
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
                                        "Basic Registration Details",
                                        style: TextStyle(fontSize: 30.6, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              ExpansionTile(
                                trailing: (registrationInformation)
                                    ? Icon(Icons.keyboard_arrow_down)
                                    : Icon(Icons.keyboard_arrow_up),
                                collapsedIconColor: Colors.black,
                                iconColor: Colors.black,
                                initiallyExpanded: true,
                                onExpansionChanged: (val) {
                                  setState(
                                    () {
                                      registrationInformation = val;
                                    },
                                  );
                                },
                                title: Text(
                                  "Registration Information",
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  Divider(
                                    color: Colors.black38,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(14.4),
                                    margin: EdgeInsets.all(14.4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(7.2),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: List.generate(_formFieldsItems!.length, (parentIndex) {
                                        var currentItem = _formFieldsItems![parentIndex]!;
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: List.generate(currentItem.fields!.length, (fieldIndex) {
                                            var field = currentItem.fields![fieldIndex];

                                            if (field!.type == Constant.brftMULTI_SELECT) {
                                              var options = field.options;
                                              var selectedItem = field.selected;
                                              if (selectedItem is List<Options?>?) {
                                                for (int vaa = 0; vaa < options!.length; vaa++) {
                                                  var isForSelection = false;
                                                  for (int v = 0; v < selectedItem!.length; v++) {
                                                    if (options[vaa]!.id == selectedItem[v]!.id) {
                                                      isForSelection = true;
                                                    }
                                                  }

                                                  _formFieldsItems![parentIndex]!
                                                      .fields![fieldIndex]!
                                                      .options![vaa]!
                                                      .isSelected = isForSelection;
                                                }
                                              } else {
                                                List<Options?>? blankOptions = [];
                                                _formFieldsItems![parentIndex]!.fields![fieldIndex]!.selected =
                                                    blankOptions;
                                              }

                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  parentIndex != 0
                                                      ? SizedBox(
                                                          height: 14.64,
                                                        )
                                                      : Container(),
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                            Utils().nullSafeString(currentItem.label)),
                                                        bottom: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                            ? 14.64
                                                            : 0),
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                                  Utils().nullSafeString(currentItem.label))),
                                                          child: Text(
                                                            Utils().nullSafeString(field.placeholder),
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 12.6,
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ))
                                                      : Container(),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                            ? getThirdStageMargin(
                                                                Utils().nullSafeString(currentItem.label))
                                                            : getSecondStageMargin(
                                                                Utils().nullSafeString(currentItem.label))),
                                                    child: ListView.separated(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      padding: EdgeInsets.only(
                                                        top: 14.64,
                                                        bottom: 14.64,
                                                      ),
                                                      itemCount: options!.length,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            if (!currentItem.fields![fieldIndex]!.is_readonly &&
                                                                !_isViewMode) {
                                                              setState(() {
                                                                var isForAdd = true;
                                                                List<Options?>? previousSelectedItems = [];
                                                                if (currentItem.fields![fieldIndex]!.selected!
                                                                    is List<Options?>?) {
                                                                  previousSelectedItems =
                                                                      currentItem.fields![fieldIndex]!.selected!;

                                                                  isForAdd = !currentItem.fields![fieldIndex]!
                                                                      .options![index]!.isSelected!;
                                                                }

                                                                if (isForAdd) {
                                                                  previousSelectedItems.add(currentItem
                                                                      .fields![fieldIndex]!.options![index]!);
                                                                } else {
                                                                  var intId = 0;
                                                                  for (int v = 0;
                                                                      v < previousSelectedItems.length;
                                                                      v++) {
                                                                    if (currentItem
                                                                            .fields![fieldIndex]!.options![index]!.id ==
                                                                        previousSelectedItems[v]!.id) {
                                                                      intId = v;
                                                                      break;
                                                                    }
                                                                  }

                                                                  previousSelectedItems
                                                                      .remove(previousSelectedItems[intId]);
                                                                }
                                                                _formFieldsItems![parentIndex]!
                                                                    .fields![fieldIndex]!
                                                                    .selected = previousSelectedItems;
                                                              });
                                                            }
                                                          },
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                (((index == 0 ||
                                                                            (index - 1) >= 0 &&
                                                                                (Utils().nullSafeString(
                                                                                        options[index]!.header)) !=
                                                                                    (Utils().nullSafeString(
                                                                                        options[index - 1]!
                                                                                            .header)))) &&
                                                                        (Utils().nullSafeString(options[index]!.header))
                                                                            .isNotEmpty)
                                                                    ? Text(
                                                                        Utils().nullSafeString(options[index]!.header),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight.bold,
                                                                            color: currentItem
                                                                                    .fields![fieldIndex]!.is_readonly
                                                                                ? Colors.grey[600]
                                                                                : Colors.black,
                                                                            fontSize: 12.6),
                                                                      )
                                                                    : Container(),
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: getFirstStageMargin(Utils()
                                                                            .nullSafeString(options[index]!.header))),
                                                                    child: Text(
                                                                      Utils().nullSafeString(options[index]!.value),
                                                                      style: TextStyle(
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly
                                                                              ? Colors.grey[600]
                                                                              : Colors.black,
                                                                          backgroundColor:
                                                                              (options[index]!.isSelected != null &&
                                                                                      options[index]!.isSelected!)
                                                                                  ? Colors.lightBlueAccent
                                                                                  : Colors.grey[200],
                                                                          fontSize: 12.6),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      separatorBuilder: (BuildContext context, int index) =>
                                                          const Divider(),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }

                                            if (field.type == Constant.brftCHECKBOX) {
                                              var options = field.options;
                                              var selectedItem = field.selected;
                                              if (selectedItem is List<Options?>?) {
                                                for (int vaa = 0; vaa < options!.length; vaa++) {
                                                  var isForSelection = false;
                                                  for (int v = 0; v < selectedItem!.length; v++) {
                                                    if (options[vaa]!.id == selectedItem[v]!.id) {
                                                      isForSelection = true;
                                                    }
                                                  }

                                                  _formFieldsItems![parentIndex]!
                                                      .fields![fieldIndex]!
                                                      .options![vaa]!
                                                      .isSelected = isForSelection;
                                                }
                                              } else {
                                                List<Options?>? blankOptions = [];
                                                _formFieldsItems![parentIndex]!.fields![fieldIndex]!.selected =
                                                    blankOptions;
                                              }

                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  parentIndex != 0
                                                      ? SizedBox(
                                                          height: 14.64,
                                                        )
                                                      : Container(),
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                            Utils().nullSafeString(currentItem.label)),
                                                        bottom: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                            ? 14.64
                                                            : 0),
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                                  Utils().nullSafeString(currentItem.label))),
                                                          child: Text(
                                                            Utils().nullSafeString(field.placeholder),
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 12.6,
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ))
                                                      : Container(),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                            ? getThirdStageMargin(
                                                                Utils().nullSafeString(currentItem.label))
                                                            : getSecondStageMargin(
                                                                Utils().nullSafeString(currentItem.label))),
                                                    child: ListView.separated(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      padding: EdgeInsets.only(
                                                        top: 14.64,
                                                        bottom: 14.64,
                                                      ),
                                                      itemCount: options!.length,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            if (!currentItem.fields![fieldIndex]!.is_readonly &&
                                                                !_isViewMode) {
                                                              setState(() {
                                                                var isForAdd = true;
                                                                List<Options?>? previousSelectedItems = [];
                                                                if (currentItem.fields![fieldIndex]!.selected!
                                                                    is List<Options?>?) {
                                                                  previousSelectedItems =
                                                                      currentItem.fields![fieldIndex]!.selected!;

                                                                  isForAdd = !currentItem.fields![fieldIndex]!
                                                                      .options![index]!.isSelected!;
                                                                }

                                                                if (isForAdd) {
                                                                  previousSelectedItems.add(currentItem
                                                                      .fields![fieldIndex]!.options![index]!);
                                                                } else {
                                                                  var intId = 0;
                                                                  for (int v = 0;
                                                                      v < previousSelectedItems.length;
                                                                      v++) {
                                                                    if (currentItem
                                                                            .fields![fieldIndex]!.options![index]!.id ==
                                                                        previousSelectedItems[v]!.id) {
                                                                      intId = v;
                                                                      break;
                                                                    }
                                                                  }

                                                                  previousSelectedItems
                                                                      .remove(previousSelectedItems[intId]);
                                                                }
                                                                _formFieldsItems![parentIndex]!
                                                                    .fields![fieldIndex]!
                                                                    .selected = previousSelectedItems;
                                                              });
                                                            }
                                                          },
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                (((index == 0 ||
                                                                            (index - 1) >= 0 &&
                                                                                (Utils().nullSafeString(
                                                                                        options[index]!.header)) !=
                                                                                    (Utils().nullSafeString(
                                                                                        options[index - 1]!
                                                                                            .header)))) &&
                                                                        (Utils().nullSafeString(options[index]!.header))
                                                                            .isNotEmpty)
                                                                    ? Text(
                                                                        Utils().nullSafeString(options[index]!.header),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight.bold,
                                                                            color: currentItem
                                                                                    .fields![fieldIndex]!.is_readonly
                                                                                ? Colors.grey[600]
                                                                                : Colors.black,
                                                                            fontSize: 12.6),
                                                                      )
                                                                    : Container(),
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: getFirstStageMargin(Utils()
                                                                            .nullSafeString(options[index]!.header))),
                                                                    child: Text(
                                                                      Utils().nullSafeString(options[index]!.value),
                                                                      style: TextStyle(
                                                                          color: currentItem
                                                                                  .fields![fieldIndex]!.is_readonly
                                                                              ? Colors.grey[600]
                                                                              : Colors.black,
                                                                          backgroundColor:
                                                                              (options[index]!.isSelected != null &&
                                                                                      options[index]!.isSelected!)
                                                                                  ? Colors.lightBlueAccent
                                                                                  : Colors.grey[200],
                                                                          fontSize: 12.6),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      separatorBuilder: (BuildContext context, int index) =>
                                                          const Divider(),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }

                                            if (field.type == Constant.brftSELECT) {
                                              var selectedDropdownItem;
                                              var options = field.options;
                                              var selectedItem = field.selected;

                                              if (selectedItem is List<Options?>?) {
                                                if (selectedItem!.length > 0) {
                                                  final stateIndex = options!
                                                      .indexWhere((element) => element!.id == selectedItem[0]!.id);
                                                  if (stateIndex >= 0) {
                                                    selectedDropdownItem = options[stateIndex];
                                                  }
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ))
                                                      : Container(),
                                                  options != null
                                                      ? Container(
                                                          margin: EdgeInsets.only(
                                                              top: 7.32,
                                                              left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                                  ? getThirdStageMargin(
                                                                      Utils().nullSafeString(currentItem.label))
                                                                  : getSecondStageMargin(
                                                                      Utils().nullSafeString(currentItem.label))),
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
                                                            onChanged: (currentItem.fields![fieldIndex]!.is_readonly ||
                                                                    _isViewMode)
                                                                ? null
                                                                : (newValue) {
                                                                    if (!currentItem.fields![fieldIndex]!.is_readonly &&
                                                                        !_isViewMode) {
                                                                      setState(() {
                                                                        var selectedDropdownItem = newValue as Options;
                                                                        List<Options?>? selectedDropdownItems = [];
                                                                        selectedDropdownItems.add(selectedDropdownItem);
                                                                        _formFieldsItems![parentIndex]!
                                                                            .fields![fieldIndex]!
                                                                            .selected = selectedDropdownItems;
                                                                      });
                                                                    }
                                                                  },
                                                            items: options.map((item) {
                                                              return DropdownMenuItem(
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                  children: [
                                                                    (/*(selectedDropdownItem != null && (item!.id != (selectedDropdownItem as Options).id)) &&*/ ((options
                                                                                        .indexOf(item) ==
                                                                                    0 ||
                                                                                (options.indexOf(item) - 1) >= 0 &&
                                                                                    (Utils().nullSafeString(
                                                                                            item!.header)) !=
                                                                                        (Utils().nullSafeString(options[
                                                                                                options.indexOf(item) -
                                                                                                    1]!
                                                                                            .header)))) &&
                                                                            (Utils().nullSafeString(item!.header))
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
                                                                            left: getFirstStageMargin(
                                                                                Utils().nullSafeString(item!.header))),
                                                                        child: Text(
                                                                            Utils().nullSafeString(item.value).trim(),
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
                                              var selectedItem = field.selected;

                                              if (selectedItem is List<Options?>?) {
                                                if (selectedItem!.length > 0) {
                                                  final stateIndex = options!
                                                      .indexWhere((element) => element!.id == selectedItem[0]!.id);
                                                  if (stateIndex >= 0) {
                                                    selectedDropdownItem = options[stateIndex];
                                                  }
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ))
                                                      : Container(),
                                                  options != null
                                                      ? Container(
                                                          margin: EdgeInsets.only(
                                                              top: 7.32,
                                                              left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                                  ? getThirdStageMargin(
                                                                      Utils().nullSafeString(currentItem.label))
                                                                  : getSecondStageMargin(
                                                                      Utils().nullSafeString(currentItem.label))),
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
                                                            onChanged: (currentItem.fields![fieldIndex]!.is_readonly ||
                                                                    _isViewMode)
                                                                ? null
                                                                : (newValue) {
                                                                    if (!currentItem.fields![fieldIndex]!.is_readonly &&
                                                                        !_isViewMode) {
                                                                      setState(() {
                                                                        var selectedDropdownItem = newValue as Options;
                                                                        List<Options?>? selectedDropdownItems = [];
                                                                        selectedDropdownItems.add(selectedDropdownItem);
                                                                        _formFieldsItems![parentIndex]!
                                                                            .fields![fieldIndex]!
                                                                            .selected = selectedDropdownItems;
                                                                      });
                                                                    }
                                                                  },
                                                            items: options.map((item) {
                                                              return DropdownMenuItem(
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                  children: [
                                                                    (/*(selectedDropdownItem != null && (item!.id != (selectedDropdownItem as Options).id)) &&*/ ((options
                                                                                        .indexOf(item) ==
                                                                                    0 ||
                                                                                (options.indexOf(item) - 1) >= 0 &&
                                                                                    (Utils().nullSafeString(
                                                                                            item!.header)) !=
                                                                                        (Utils().nullSafeString(options[
                                                                                                options.indexOf(item) -
                                                                                                    1]!
                                                                                            .header)))) &&
                                                                            (Utils().nullSafeString(item!.header))
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
                                                                            left: getFirstStageMargin(
                                                                                Utils().nullSafeString(item!.header))),
                                                                        child: Text(
                                                                            Utils().nullSafeString(item.value).trim(),
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
                                              final TextEditingController _controller = new TextEditingController();
                                              _controller.text =
                                                  Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                          enabled: (!currentItem.fields![fieldIndex]!.is_readonly &&
                                                              !_isViewMode),
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
                                                            suffixIcon: (currentItem.fields![fieldIndex]!.is_required &&
                                                                    Utils()
                                                                        .nullSafeString(
                                                                            currentItem.fields![fieldIndex]!.value)
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
                                                        ),
                                                        (currentItem.fields![fieldIndex]!.is_required &&
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
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            /*"Please enter " + */ Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!
                                                                                    .validation_message) /* + "."*/,
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
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              );
                                            }

                                            if (field.type == Constant.brftNUMERIC_TEXTBOX) {
                                              final TextEditingController _controller = new TextEditingController();
                                              _controller.text =
                                                  Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                          enabled: !currentItem.fields![fieldIndex]!.is_readonly &&
                                                              !_isViewMode,
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
                                                            suffixIcon: (currentItem.fields![fieldIndex]!.is_required &&
                                                                    Utils()
                                                                        .nullSafeString(
                                                                            currentItem.fields![fieldIndex]!.value)
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
                                                        ),
                                                        (currentItem.fields![fieldIndex]!.is_required &&
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
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            /*"Please enter " + */ Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!
                                                                                    .validation_message) /* + "."*/,
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
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              );
                                            }

                                            if (field.type == Constant.brftTEXTAREA) {
                                              final TextEditingController _controller = new TextEditingController();
                                              _controller.text =
                                                  Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                          enabled: !currentItem.fields![fieldIndex]!.is_readonly &&
                                                              !_isViewMode,
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
                                                            suffixIcon: (currentItem.fields![fieldIndex]!.is_required &&
                                                                    Utils()
                                                                        .nullSafeString(
                                                                            currentItem.fields![fieldIndex]!.value)
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
                                                        ),
                                                        (currentItem.fields![fieldIndex]!.is_required &&
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
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            /*"Please enter " + */ Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!
                                                                                    .validation_message) /* + "."*/,
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
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              );
                                            }

                                            if (field.type == Constant.brftEMAIL) {
                                              final TextEditingController _controller = new TextEditingController();
                                              _controller.text =
                                                  Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                          enabled: !currentItem.fields![fieldIndex]!.is_readonly &&
                                                              !_isViewMode,
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
                                                            suffixIcon: (currentItem.fields![fieldIndex]!.is_required &&
                                                                    (Utils()
                                                                            .nullSafeString(
                                                                                currentItem.fields![fieldIndex]!.value)
                                                                            .isEmpty ||
                                                                        !Utils().validateEmail(Utils().nullSafeString(
                                                                            currentItem.fields![fieldIndex]!.value))))
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
                                                        ),
                                                        (currentItem.fields![fieldIndex]!.is_required &&
                                                                (Utils()
                                                                        .nullSafeString(
                                                                            currentItem.fields![fieldIndex]!.value)
                                                                        .isEmpty ||
                                                                    !Utils().validateEmail(Utils().nullSafeString(
                                                                        currentItem.fields![fieldIndex]!.value))))
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
                                                                            (Utils()
                                                                                        .nullSafeString(currentItem
                                                                                            .fields![fieldIndex]!.value)
                                                                                        .isNotEmpty &&
                                                                                    !Utils().validateEmail(Utils()
                                                                                        .nullSafeString(currentItem
                                                                                            .fields![fieldIndex]!
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
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              );
                                            }

                                            if (field.type == Constant.brftTELEPHONE) {
                                              final TextEditingController _controller = new TextEditingController();
                                              _controller.text =
                                                  Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                          enabled: !currentItem.fields![fieldIndex]!.is_readonly &&
                                                              !_isViewMode,
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
                                                            suffixIcon: (currentItem.fields![fieldIndex]!.is_required &&
                                                                    (Utils()
                                                                            .nullSafeString(
                                                                                currentItem.fields![fieldIndex]!.value)
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
                                                                    padding: EdgeInsets.only(left: 28.8),
                                                                    child: Icon(
                                                                      Icons.warning_amber_outlined,
                                                                      color: Colors.red,
                                                                      size: 18,
                                                                    ),
                                                                  )
                                                                : SizedBox(),
                                                          ),
                                                        ),
                                                        (currentItem.fields![fieldIndex]!.is_required &&
                                                                (Utils()
                                                                        .nullSafeString(
                                                                            currentItem.fields![fieldIndex]!.value)
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
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            (Utils()
                                                                                        .nullSafeString(currentItem
                                                                                            .fields![fieldIndex]!.value)
                                                                                        .isNotEmpty &&
                                                                                    (Utils()
                                                                                            .nullSafeString(currentItem
                                                                                                .fields![fieldIndex]!
                                                                                                .value)
                                                                                            .isEmpty ||
                                                                                        (Utils()
                                                                                                    .nullSafeString(
                                                                                                        currentItem
                                                                                                            .fields![
                                                                                                                fieldIndex]!
                                                                                                            .value)
                                                                                                    .length <
                                                                                                10 ||
                                                                                            Utils()
                                                                                                    .nullSafeString(
                                                                                                        currentItem
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
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                                  fontSize: 10.8,
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                        )
                                                      : Container(),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                            ? getThirdStageMargin(
                                                                Utils().nullSafeString(currentItem.label))
                                                            : getSecondStageMargin(
                                                                Utils().nullSafeString(currentItem.label))),
                                                    child: Column(
                                                      children: [
                                                        RaisedButton(
                                                          onPressed: () =>
                                                              (currentItem.fields![fieldIndex]!.is_readonly ||
                                                                      _isViewMode)
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
                                                                      Utils().nullSafeString(field.value),
                                                                      Constant.defaultDateFormatWeb),
                                                                  "dd MMMM yyyy"),
                                                              style: TextStyle(
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
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
                                                              left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                                  ? getThirdStageMargin(
                                                                      Utils().nullSafeString(currentItem.label))
                                                                  : getSecondStageMargin(
                                                                      Utils().nullSafeString(currentItem.label))),
                                                          child: Text(
                                                            Utils().nullSafeString(field.help_text),
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 10.8,
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
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
                                                  (fieldIndex == 0 && currentItem.label.isNotEmpty)
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
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                          new TextSpan(
                                                              text: currentItem.fields![fieldIndex]!.is_required
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
                                                                  fontSize: 10.8,
                                                                  color: currentItem.fields![fieldIndex]!.is_readonly
                                                                      ? Colors.grey[600]
                                                                      : Colors.black)),
                                                        )
                                                      : Container(),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: Utils().nullSafeString(field.placeholder).isNotEmpty
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
                                                            if (!currentItem.fields![fieldIndex]!.is_readonly &&
                                                                !_isViewMode) {
                                                              if (await Permission.storage.request().isGranted) {
                                                                if (Platform.isAndroid || Platform.isIOS) {
                                                                  _showAttachmentPickerDialog(parentIndex, fieldIndex);
                                                                } else {
                                                                  FilePickerResult? result =
                                                                      await FilePicker.platform.pickFiles();
                                                                  if (result != null) {
                                                                    setState(() {
                                                                      _formFieldsItems![parentIndex]!
                                                                              .fields![fieldIndex]!
                                                                              .value =
                                                                          Utils()
                                                                              .nullSafeString(result.files.single.path);
                                                                    });
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          },
                                                          child: (Utils()
                                                                      .nullSafeString(
                                                                          currentItem.fields![fieldIndex]!.value)
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
                                                                      File(Utils().nullSafeString(
                                                                          currentItem.fields![fieldIndex]!.value)),
                                                                      height: 72,
                                                                      width: 72,
                                                                      fit: BoxFit.fitHeight,
                                                                    )
                                                                  : Text(
                                                                      File(Utils().nullSafeString(
                                                                              currentItem.fields![fieldIndex]!.value))
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
                                                              left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                                  ? getThirdStageMargin(
                                                                      Utils().nullSafeString(currentItem.label))
                                                                  : getSecondStageMargin(
                                                                      Utils().nullSafeString(currentItem.label))),
                                                          child: Text(
                                                            Utils().nullSafeString(field.help_text),
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 10.8,
                                                                color: currentItem.fields![fieldIndex]!.is_readonly
                                                                    ? Colors.grey[600]
                                                                    : Colors.black),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              );
                                            }
                                            return Container();
                                          }),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              !_isViewMode
                                  ? SizedBox(
                                      height: 146.4,
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    !_isViewMode
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
                                  padding: EdgeInsets.only(
                                      top: 18, left: 21.6, right: 21.6, bottom: isKeyboardVisible ? 18 : 72),
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
                                          final _pref = await Preferences.getInstance();
                                          LoginModel? loginModel = await _pref.getToken();

                                          _submitBasicRegistrationDetailsRequestModelItems = [];
                                          _submitBasicRegistrationDetailsRequestModelItems.add(
                                              SubmitBasicRegistrationDetailsRequestModel(
                                                  "login_user_type",
                                                  Utils().nullSafeString(loginModel!.login_user_type.toString()),
                                                  null,
                                                  null));
                                          _submitBasicRegistrationDetailsRequestModelItems.add(
                                              SubmitBasicRegistrationDetailsRequestModel("login_parent_type",
                                                  Utils().nullSafeString(loginModel.login_parent_type), null, null));
                                          _submitBasicRegistrationDetailsRequestModelItems.add(
                                              SubmitBasicRegistrationDetailsRequestModel("bkms_id",
                                                  Utils().nullSafeInt(loginModel.bkms_id).toString(), null, null));
                                          _submitBasicRegistrationDetailsRequestModelItems.add(
                                              SubmitBasicRegistrationDetailsRequestModel("event_id",
                                                  Utils().nullSafeString(_myEventItem.id).toString(), null, null));
                                          _submitBasicRegistrationDetailsRequestModelItems.add(
                                              SubmitBasicRegistrationDetailsRequestModel(
                                                  "userevent_id",
                                                  Utils().nullSafeString(_myEventItem.userevent_id).toString(),
                                                  null,
                                                  null));
                                          _submitBasicRegistrationDetailsRequestModelItems.add(
                                              SubmitBasicRegistrationDetailsRequestModel("record_id",
                                                  Utils().nullSafeInt(loginModel.bkms_id).toString(), null, null));
                                          _submitBasicRegistrationDetailsRequestModelItems.add(
                                              SubmitBasicRegistrationDetailsRequestModel("login_user_email",
                                                  Utils().nullSafeString(loginModel.email), null, null));
                                          _submitBasicRegistrationDetailsRequestModelItems.add(
                                              SubmitBasicRegistrationDetailsRequestModel(
                                                  "form_type", _strFormType, null, null));

                                          if (validateRegistrationInformation()) {
                                            setState(() {
                                              _showLoadingIndicator();
                                              BlocProvider.of<HomeBloc>(context).add(
                                                  HomeEvent.submitBasicRegistrationsDetails(
                                                      context, _submitBasicRegistrationDetailsRequestModelItems));
                                            });
                                          }
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
            )),
            Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
          ]);
        },
      ),
    );
  }

  //region FOR VALIDATE REGISTRATION INFORMATION
  bool validateRegistrationInformation() {
    bool isForError = false;
    if (_formFieldsItems != null) {
      String strValidationMessage = '';
      for (int parentIndex = 0; parentIndex < _formFieldsItems!.length; parentIndex++) {
        var currentItem = _formFieldsItems![parentIndex]!;
        for (int fieldIndex = 0; fieldIndex < currentItem.fields!.length; fieldIndex++) {
          var field = currentItem.fields![fieldIndex];

          if (field!.type == Constant.brftMULTI_SELECT) {
            if (field.selected != null) {
              List<String> multipleValues = [];
              for (int v = 0; v < field.selected!.length; v++) {
                multipleValues.add(Utils().nullSafeString(field.selected![v]!.id));
              }
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), null, multipleValues, null));
            }

            if (field.is_required) {
              if (field.selected == null || field.selected!.length <= 0) {
                isForError = true;
                strValidationMessage = /*"Please select at-least one " +*/ Utils()
                    .nullSafeString(field.validation_message) /* + "."*/;
                break;
              }
            }
          }

          if (field.type == Constant.brftCHECKBOX) {
            if (field.selected != null) {
              List<String> multipleValues = [];
              for (int v = 0; v < field.selected!.length; v++) {
                multipleValues.add(Utils().nullSafeString(field.selected![v]!.id));
              }
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), null, multipleValues, null));
            }

            if (field.is_required) {
              if (field.selected == null || field.selected!.length <= 0) {
                isForError = true;
                strValidationMessage = /*"Please select at-least one " + */ Utils()
                    .nullSafeString(field.validation_message) /* + "."*/;
                break;
              }
            }
          }

          if (field.type == Constant.brftSELECT) {
            if (field.selected != null && field.selected!.length > 0) {
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.selected![0]!.id), null, null));
            }

            if (field.is_required) {
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
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.selected![0]!.id), null, null));
            }

            if (field.is_required) {
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
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required) {
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
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required) {
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
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required) {
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
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required) {
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
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required) {
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
              _formFieldsItems![parentIndex]!.fields![fieldIndex]!.value =
                  Utils().changeDateFormat(DateTime.now(), Constant.defaultDateFormat);
            }

            if (_formFieldsItems![parentIndex]!.fields![fieldIndex]!.value != null) {
              _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required) {
              if (Utils().nullSafeString(_formFieldsItems![parentIndex]!.fields![fieldIndex]!.value).isEmpty) {
                isForError = true;
                strValidationMessage = "Please choose your " + Utils().nullSafeString(field.validation_message) + ".";
                break;
              }
            }
          }

          if (field.type == Constant.brftFILE) {
            if (field.value != null) {
              if (Utils().validateWebURL(Utils().nullSafeString(field.value))) {
                _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                    Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
              } else {
                _submitBasicRegistrationDetailsRequestModelItems.add(SubmitBasicRegistrationDetailsRequestModel(
                    Utils().nullSafeString(field.name), null, null, File(Utils().nullSafeString(field.value))));
              }
            }

            if (field.is_required) {
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
      margin = 14.64;
    }
    return margin;
  }
  //endregion

  //region FOR GET SECOND STAGE MARGIN
  double getSecondStageMargin(String value) {
    double margin = 14.64;
    if (value.isNotEmpty) {
      margin = 29.28;
    }
    return margin;
  }
//endregion

  //region FOR GET THIRD STAGE MARGIN
  double getThirdStageMargin(String value) {
    double margin = 29.28;
    if (value.isNotEmpty) {
      margin = 43.92;
    }
    return margin;
  }
//endregion

  //region SHOW DATE PICKER FOR PICK THE DATE
  Future<void> _selectDate(BuildContext context, DateTime dateTime, int parentIndex, int fieldIndex) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: dateTime, firstDate: DateTime(1900, 1), lastDate: DateTime.now());
    if (picked != null && picked != dateTime)
      setState(() {
        _formFieldsItems![parentIndex]!.fields![fieldIndex]!.value =
            Utils().changeDateFormat(picked, Constant.defaultDateFormatWeb);
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
                    _formFieldsItems![parentIndex]!.fields![fieldIndex]!.value = strImagePath;
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
                    _formFieldsItems![parentIndex]!.fields![fieldIndex]!.value =
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
}
