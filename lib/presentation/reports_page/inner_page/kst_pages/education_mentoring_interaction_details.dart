import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/education_mentoring_interaction_details_model.dart';
import 'package:flutter_app/models/kst_education_mentoring_list_model.dart';
import 'package:flutter_app/models/manage_kst_report_model.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/kst_data_update_bloc.dart';
import '../../../../loader.dart';
import '../../kst_report_model.dart';
import 'manage_education_mentoring.dart';

class EducationMentoringInteractionDetails extends StatefulWidget {
  static String id = "educationMentoringInteractionDetails";
  static String path = "${ManageEducationMentoring.path}/$id";

  @override
  _EducationMentoringInteractionDetailsState createState() => _EducationMentoringInteractionDetailsState();
}

class _EducationMentoringInteractionDetailsState extends State<EducationMentoringInteractionDetails>
    with TickerProviderStateMixin {
  List<EMIDFormAFieldsModel?>? _interactionLogDataItems = [];

  KSTReportListDataModel? _kstReportItem;
  ManageKSTReportListDataModel? _manageKSTReportListDataModel;
  KEMDataModel? _kstEducationMentoringDataModel;

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
    if (paramsBloc is KSTReportDetailsState) {
      _kstReportItem = paramsBloc.kstReportListDataModel;
      _manageKSTReportListDataModel = paramsBloc.manageKSTReportListDataModel;
      _kstEducationMentoringDataModel = paramsBloc.kstEducationMentoringDataModel;
    }

    //FOR ADD SELECTED ITEMS
    BlocProvider.of<ParamsBloc>(context).add(
        KSTReportDetailsEvent(_kstReportItem!, _manageKSTReportListDataModel, _kstEducationMentoringDataModel, null));

    //FOR GET INTERACTION DETAILS
    _showLoadingIndicator();
    BlocProvider.of<KSTDataUpdateBloc>(context).add(KSTDataUpdateEvent.educationMentoringInteractionDetails(
      context,
      Utils().nullSafeString(_manageKSTReportListDataModel!.id),
      Utils().nullSafeString("1"),
      Utils().nullSafeString(_kstEducationMentoringDataModel!.id),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<KSTDataUpdateBloc, KSTDataUpdateState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                educationMentoringInteractionDetails: (educationMentoringInteractionDetailsModel) {
                  if (educationMentoringInteractionDetailsModel != null) {
                    if (educationMentoringInteractionDetailsModel.form_fields != null) {
                      _interactionLogDataItems = educationMentoringInteractionDetailsModel.form_fields;
                    }
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: Stack(children: <Widget>[
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
                      top: 14.4,
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
                                      "Education Mentoring",
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
                                "Interaction Details",
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 0, left: 14.4, right: 14.4, bottom: 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(_interactionLogDataItems!.length, (parentIndex) {
                          var currentItem = _interactionLogDataItems![parentIndex]!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(currentItem.fields!.length, (fieldIndex) {
                              var field = currentItem.fields![fieldIndex];
                              if (field != null) {
                                if (field.type == Constant.brftMULTI_SELECT) {
                                  var options = field.options;
                                  var selectedItem = field.selected;
                                  if (selectedItem is List<EMIDOptions?>?) {
                                    for (int vaa = 0; vaa < options!.length; vaa++) {
                                      var isForSelection = false;
                                      for (int v = 0; v < selectedItem!.length; v++) {
                                        if (options[vaa]!.id == selectedItem[v]!.id) {
                                          isForSelection = true;
                                        }
                                      }

                                      _interactionLogDataItems![parentIndex]!
                                          .fields![fieldIndex]!
                                          .options![vaa]!
                                          .isSelected = isForSelection;
                                    }
                                  } else {
                                    List<EMIDOptions?>? blankOptions = [];
                                    _interactionLogDataItems![parentIndex]!.fields![fieldIndex]!.selected =
                                        blankOptions;
                                  }

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 14.64,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: getFirstStageMargin(Utils().nullSafeString(currentItem.label)),
                                            bottom: Utils().nullSafeString(field.placeholder).isNotEmpty ? 14.64 : 0),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              //new TextSpan(text: currentItem.fields![fieldIndex]!.is_required! ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Utils().nullSafeString(field.placeholder).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.placeholder),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.6,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                ? getThirdStageMargin(Utils().nullSafeString(currentItem.label))
                                                : getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
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
                                                if (!currentItem.fields![fieldIndex]!.is_readonly!) {
                                                  setState(() {
                                                    var isForAdd = true;
                                                    List<EMIDOptions?>? previousSelectedItems = [];
                                                    if (currentItem.fields![fieldIndex]!.selected!
                                                        is List<EMIDOptions?>?) {
                                                      previousSelectedItems =
                                                          currentItem.fields![fieldIndex]!.selected!;

                                                      isForAdd = !currentItem
                                                          .fields![fieldIndex]!.options![index]!.isSelected!;
                                                    }

                                                    if (isForAdd) {
                                                      previousSelectedItems
                                                          .add(currentItem.fields![fieldIndex]!.options![index]!);
                                                    } else {
                                                      var intId = 0;
                                                      for (int v = 0; v < previousSelectedItems.length; v++) {
                                                        if (currentItem.fields![fieldIndex]!.options![index]!.id ==
                                                            previousSelectedItems[v]!.id) {
                                                          intId = v;
                                                          break;
                                                        }
                                                      }

                                                      previousSelectedItems.remove(previousSelectedItems[intId]);
                                                    }
                                                    _interactionLogDataItems![parentIndex]!
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
                                                                    (Utils().nullSafeString(options[index]!.header)) !=
                                                                        (Utils().nullSafeString(
                                                                            options[index - 1]!.header)))) &&
                                                            (Utils().nullSafeString(options[index]!.header)).isNotEmpty)
                                                        ? Text(
                                                            Utils().nullSafeString(options[index]!.header),
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: currentItem.fields![fieldIndex]!.is_readonly!
                                                                    ? Colors.grey[600]
                                                                    : Colors.black,
                                                                fontSize: 12.6),
                                                          )
                                                        : Container(),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: getFirstStageMargin(
                                                                Utils().nullSafeString(options[index]!.header))),
                                                        child: Text(
                                                          Utils().nullSafeString(options[index]!.value),
                                                          style: TextStyle(
                                                              color: currentItem.fields![fieldIndex]!.is_readonly!
                                                                  ? Colors.grey[600]
                                                                  : Colors.black,
                                                              backgroundColor: (options[index]!.isSelected != null &&
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
                                          separatorBuilder: (BuildContext context, int index) => const Divider(),
                                        ),
                                      ),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftCHECKBOX) {
                                  var options = field.options;
                                  var selectedItem = field.selected;
                                  if (selectedItem is List<EMIDOptions?>?) {
                                    for (int vaa = 0; vaa < options!.length; vaa++) {
                                      var isForSelection = false;
                                      for (int v = 0; v < selectedItem!.length; v++) {
                                        if (options[vaa]!.id == selectedItem[v]!.id) {
                                          isForSelection = true;
                                        }
                                      }

                                      _interactionLogDataItems![parentIndex]!
                                          .fields![fieldIndex]!
                                          .options![vaa]!
                                          .isSelected = isForSelection;
                                    }
                                  } else {
                                    List<EMIDOptions?>? blankOptions = [];
                                    _interactionLogDataItems![parentIndex]!.fields![fieldIndex]!.selected =
                                        blankOptions;
                                  }

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 14.64,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: getFirstStageMargin(Utils().nullSafeString(currentItem.label)),
                                            bottom: Utils().nullSafeString(field.placeholder).isNotEmpty ? 14.64 : 0),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              //new TextSpan(text: currentItem.fields![fieldIndex]!.is_required! ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Utils().nullSafeString(field.placeholder).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.placeholder),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.6,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                ? getThirdStageMargin(Utils().nullSafeString(currentItem.label))
                                                : getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
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
                                                if (!currentItem.fields![fieldIndex]!.is_readonly!) {
                                                  setState(() {
                                                    var isForAdd = true;
                                                    List<EMIDOptions?>? previousSelectedItems = [];
                                                    if (currentItem.fields![fieldIndex]!.selected!
                                                        is List<EMIDOptions?>?) {
                                                      previousSelectedItems =
                                                          currentItem.fields![fieldIndex]!.selected!;

                                                      isForAdd = !currentItem
                                                          .fields![fieldIndex]!.options![index]!.isSelected!;
                                                    }

                                                    if (isForAdd) {
                                                      previousSelectedItems
                                                          .add(currentItem.fields![fieldIndex]!.options![index]!);
                                                    } else {
                                                      var intId = 0;
                                                      for (int v = 0; v < previousSelectedItems.length; v++) {
                                                        if (currentItem.fields![fieldIndex]!.options![index]!.id ==
                                                            previousSelectedItems[v]!.id) {
                                                          intId = v;
                                                          break;
                                                        }
                                                      }

                                                      previousSelectedItems.remove(previousSelectedItems[intId]);
                                                    }
                                                    _interactionLogDataItems![parentIndex]!
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
                                                                    (Utils().nullSafeString(options[index]!.header)) !=
                                                                        (Utils().nullSafeString(
                                                                            options[index - 1]!.header)))) &&
                                                            (Utils().nullSafeString(options[index]!.header)).isNotEmpty)
                                                        ? Text(
                                                            Utils().nullSafeString(options[index]!.header),
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: currentItem.fields![fieldIndex]!.is_readonly!
                                                                    ? Colors.grey[600]
                                                                    : Colors.black,
                                                                fontSize: 12.6),
                                                          )
                                                        : Container(),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: getFirstStageMargin(
                                                                Utils().nullSafeString(options[index]!.header))),
                                                        child: Text(
                                                          Utils().nullSafeString(options[index]!.value),
                                                          style: TextStyle(
                                                              color: currentItem.fields![fieldIndex]!.is_readonly!
                                                                  ? Colors.grey[600]
                                                                  : Colors.black,
                                                              backgroundColor: (options[index]!.isSelected != null &&
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
                                          separatorBuilder: (BuildContext context, int index) => const Divider(),
                                        ),
                                      ),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftSELECT) {
                                  var selectedDropdownItem;
                                  var options = field.options;
                                  var selectedItem = field.selected;

                                  if (selectedItem is List<EMIDOptions?>?) {
                                    if (selectedItem!.length > 0) {
                                      final stateIndex =
                                          options!.indexWhere((element) => element!.id == selectedItem[0]!.id);
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
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 14.64,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              //new TextSpan(text: currentItem.fields![fieldIndex]!.is_required! ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.placeholder),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.6,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      options != null
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  top: 7.32,
                                                  left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                      ? getThirdStageMargin(Utils().nullSafeString(currentItem.label))
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
                                                onChanged: (currentItem.fields![fieldIndex]!.is_readonly!)
                                                    ? null
                                                    : (newValue) {
                                                        if (!currentItem.fields![fieldIndex]!.is_readonly!) {
                                                          setState(() {
                                                            var selectedDropdownItem = newValue as EMIDOptions;
                                                            List<EMIDOptions?>? selectedDropdownItems = [];
                                                            selectedDropdownItems.add(selectedDropdownItem);
                                                            _interactionLogDataItems![parentIndex]!
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
                                                                        (Utils().nullSafeString(item!.header)) !=
                                                                            (Utils().nullSafeString(
                                                                                options[options.indexOf(item) - 1]!
                                                                                    .header)))) &&
                                                                (Utils().nullSafeString(item!.header)).isNotEmpty)
                                                            ? Text(
                                                                Utils().nullSafeString(item.header),
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold, fontSize: 12.6),
                                                              )
                                                            : Container(),
                                                        Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(item!.header))),
                                                            child: Text(Utils().nullSafeString(item.value).trim(),
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
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftDROPDOWN) {
                                  var selectedDropdownItem;
                                  var options = field.options;
                                  var selectedItem = field.selected;

                                  if (selectedItem is List<EMIDOptions?>?) {
                                    if (selectedItem!.length > 0) {
                                      final stateIndex =
                                          options!.indexWhere((element) => element!.id == selectedItem[0]!.id);
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
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 14.64,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              //new TextSpan(text: currentItem.fields![fieldIndex]!.is_required! ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.placeholder),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.6,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      options != null
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  top: 7.32,
                                                  left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                      ? getThirdStageMargin(Utils().nullSafeString(currentItem.label))
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
                                                onChanged: (currentItem.fields![fieldIndex]!.is_readonly!)
                                                    ? null
                                                    : (newValue) {
                                                        if (!currentItem.fields![fieldIndex]!.is_readonly!) {
                                                          setState(() {
                                                            var selectedDropdownItem = newValue as EMIDOptions;
                                                            List<EMIDOptions?>? selectedDropdownItems = [];
                                                            selectedDropdownItems.add(selectedDropdownItem);
                                                            _interactionLogDataItems![parentIndex]!
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
                                                                        (Utils().nullSafeString(item!.header)) !=
                                                                            (Utils().nullSafeString(
                                                                                options[options.indexOf(item) - 1]!
                                                                                    .header)))) &&
                                                                (Utils().nullSafeString(item!.header)).isNotEmpty)
                                                            ? Text(
                                                                Utils().nullSafeString(item.header),
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold, fontSize: 12.6),
                                                              )
                                                            : Container(),
                                                        Container(
                                                            margin: EdgeInsets.only(
                                                                left: getFirstStageMargin(
                                                                    Utils().nullSafeString(item!.header))),
                                                            child: Text(Utils().nullSafeString(item.value).trim(),
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
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftRADIO) {
                                  var options = field.options;
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 14.64,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              //new TextSpan(text: currentItem.fields![fieldIndex]!.is_required! ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      //Utils().nullSafeString(field.placeholder).isNotEmpty? SizedBox(7.32,): Container(),
                                      //Utils().nullSafeString(field.placeholder).isNotEmpty? Container(margin: EdgeInsets.only(left: getSecondStageMargin(Utils().nullSafeString(currentItem.label))),child: Text(Utils().nullSafeString(field.placeholder), overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.6, color: currentItem.fields![fieldIndex]!.is_readonly!? Colors.grey[600]:Colors.black),)): Container(),
                                      options != null
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  top: 10.98,
                                                  left: /*Utils().nullSafeString(field.placeholder).isNotEmpty? getThirdStageMargin(Utils().nullSafeString(currentItem.label)):*/ getSecondStageMargin(
                                                      Utils().nullSafeString(currentItem.label))),
                                              child: ListView.separated(
                                                physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: options.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (!currentItem.fields![fieldIndex]!.is_readonly!) {
                                                          var selectedDropdownItem = options[index] as EMIDOptions;
                                                          List<EMIDOptions?>? selectedDropdownItems = [];
                                                          selectedDropdownItems.add(selectedDropdownItem);
                                                          _interactionLogDataItems![parentIndex]!
                                                              .fields![fieldIndex]!
                                                              .selected = selectedDropdownItems;
                                                        }
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
                                                                  margin: EdgeInsets.only(right: 5.4),
                                                                  padding: EdgeInsets.all(0.0035),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(18),
                                                                    border: Border.all(
                                                                        color: ((field.selected != null &&
                                                                                    field.selected!.length > 0) &&
                                                                                field.selected![0]!.id ==
                                                                                    options[index]!.id)
                                                                            ? Colors.blue
                                                                            : Colors.grey,
                                                                        width: 0.0035),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.done,
                                                                    color: ((field.selected != null &&
                                                                                field.selected!.length > 0) &&
                                                                            field.selected![0]!.id ==
                                                                                options[index]!.id)
                                                                        ? Colors.blue
                                                                        : Colors.grey,
                                                                    size: 9,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  Utils().nullSafeString(options[index]!.value),
                                                                  style: TextStyle(
                                                                      fontSize: 12.6,
                                                                      color: ((field.selected != null &&
                                                                                  field.selected!.length > 0) &&
                                                                              field.selected![0]!.id ==
                                                                                  options[index]!.id)
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
                                            )
                                          : Container(height: 60),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftTEXTBOX) {
                                  final TextEditingController _controller = new TextEditingController();
                                  _controller.text = Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
                                  _controller.selection =
                                      TextSelection.fromPosition(TextPosition(offset: _controller.text.length));

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 21.96,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                              enabled: (!currentItem.fields![fieldIndex]!.is_readonly!),
                                              onChanged: (value) {
                                                setState(() {
                                                  currentItem.fields![fieldIndex]!.value = value;
                                                });
                                              },
                                              style: TextStyle(
                                                  color: currentItem.fields![fieldIndex]!.is_readonly!
                                                      ? Colors.grey[500]
                                                      : Colors.black),
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.text,
                                              controller: _controller,
                                              decoration: InputDecoration(
                                                hintText: Utils()
                                                    .nullSafeString(currentItem.fields![fieldIndex]!.placeholder),
                                                suffixIcon: /*(currentItem.fields![fieldIndex]!.is_required &&
                                                  Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty) ? Padding(
                                                padding: EdgeInsets.only(left: 28.8),
                                                child: Icon(
                                                  Icons.warning_amber_outlined,
                                                  color: Colors.red,
                                                  size: 18,
                                                ),
                                              ) :*/
                                                    SizedBox(),
                                              ),
                                              focusNode: FocusNode(),
                                            ),
                                            /*(currentItem.fields![fieldIndex]!.is_required &&
                                              Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty) ? Padding(
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
                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.all(3.6),
                                                      child:
                                                      Text(*/ /*"Please enter " + */ /*Utils().nullSafeString(currentItem.fields![fieldIndex]!.validation_message)*/ /* + "."*/ /*,
                                                        style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              :*/
                                            SizedBox(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.32,
                                      ),
                                      Utils().nullSafeString(field.help_text).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.help_text),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.8,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ),
                                            )
                                          : Container(),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftNUMERIC_TEXTBOX) {
                                  final TextEditingController _controller = new TextEditingController();
                                  _controller.text = Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
                                  _controller.selection =
                                      TextSelection.fromPosition(TextPosition(offset: _controller.text.length));

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 21.96,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                              enabled: !currentItem.fields![fieldIndex]!.is_readonly!,
                                              onChanged: (value) {
                                                setState(() {
                                                  currentItem.fields![fieldIndex]!.value = value;
                                                });
                                              },
                                              style: TextStyle(
                                                  color: currentItem.fields![fieldIndex]!.is_readonly!
                                                      ? Colors.grey[500]
                                                      : Colors.black),
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.number,
                                              controller: _controller,
                                              decoration: InputDecoration(
                                                hintText: Utils()
                                                    .nullSafeString(currentItem.fields![fieldIndex]!.placeholder),
                                                suffixIcon: /*(currentItem.fields![fieldIndex]!.is_required && Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty) ? Padding(
                                                padding: EdgeInsets.only(left: 28.8),
                                                child: Icon(
                                                  Icons.warning_amber_outlined,
                                                  color: Colors.red,
                                                  size: 18,
                                                ),
                                              ) :*/
                                                    SizedBox(),
                                              ),
                                              focusNode: FocusNode(),
                                            ),
                                            /*(currentItem.fields![fieldIndex]!.is_required && Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty) ? Padding(
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
                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.all(3.6),
                                                      child:
                                                      Text(*/ /*"Please enter " + */ /*Utils().nullSafeString(currentItem.fields![fieldIndex]!.validation_message)*/ /* + "."*/ /*,
                                                        style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              :*/
                                            SizedBox(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.32,
                                      ),
                                      Utils().nullSafeString(field.help_text).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.help_text),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.8,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ),
                                            )
                                          : Container(),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftTEXTAREA) {
                                  final TextEditingController _controller = new TextEditingController();
                                  _controller.text = Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
                                  _controller.selection =
                                      TextSelection.fromPosition(TextPosition(offset: _controller.text.length));

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 21.96,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                              enabled: !currentItem.fields![fieldIndex]!.is_readonly!,
                                              onChanged: (value) {
                                                setState(() {
                                                  currentItem.fields![fieldIndex]!.value = value;
                                                });
                                              },
                                              style: TextStyle(
                                                  color: currentItem.fields![fieldIndex]!.is_readonly!
                                                      ? Colors.grey[500]
                                                      : Colors.black),
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.streetAddress,
                                              minLines: 2,
                                              maxLines: 4,
                                              controller: _controller,
                                              decoration: InputDecoration(
                                                hintText: Utils()
                                                    .nullSafeString(currentItem.fields![fieldIndex]!.placeholder),
                                                suffixIcon: /*(currentItem.fields![fieldIndex]!.is_required && Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty) ? Padding(
                                                padding: EdgeInsets.only(left: 28.8),
                                                child: Icon(
                                                  Icons.warning_amber_outlined,
                                                  color: Colors.red,
                                                  size: 18,
                                                ),
                                              ) :*/
                                                    SizedBox(),
                                              ),
                                              focusNode: FocusNode(),
                                            ),
                                            /*(currentItem.fields![fieldIndex]!.is_required && Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty) ? Padding(
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
                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.all(3.6),
                                                      child:
                                                      Text(*/ /*"Please enter " + */ /*Utils().nullSafeString(currentItem.fields![fieldIndex]!.validation_message)*/ /* + "."*/ /*,
                                                        style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              :*/
                                            SizedBox(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.32,
                                      ),
                                      Utils().nullSafeString(field.help_text).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.help_text),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.8,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ),
                                            )
                                          : Container(),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftEMAIL) {
                                  final TextEditingController _controller = new TextEditingController();
                                  _controller.text = Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
                                  _controller.selection =
                                      TextSelection.fromPosition(TextPosition(offset: _controller.text.length));

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 21.96,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                              enabled: !currentItem.fields![fieldIndex]!.is_readonly!,
                                              onChanged: (value) {
                                                setState(() {
                                                  currentItem.fields![fieldIndex]!.value = value;
                                                });
                                              },
                                              style: TextStyle(
                                                  color: currentItem.fields![fieldIndex]!.is_readonly!
                                                      ? Colors.grey[500]
                                                      : Colors.black),
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.emailAddress,
                                              controller: _controller,
                                              decoration: InputDecoration(
                                                hintText: Utils()
                                                    .nullSafeString(currentItem.fields![fieldIndex]!.placeholder),
                                                suffixIcon: /*(currentItem.fields![fieldIndex]!.is_required && (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || !Utils().validateEmail(Utils().nullSafeString(currentItem.fields![fieldIndex]!.value)))) ? Padding(
                                                padding: EdgeInsets.only(left: 28.8),
                                                child: Icon(
                                                  Icons.warning_amber_outlined,
                                                  color: Colors.red,
                                                  size: 18,
                                                ),
                                              ) :*/
                                                    SizedBox(),
                                              ),
                                              focusNode: FocusNode(),
                                            ),
                                            /*(currentItem.fields![fieldIndex]!.is_required && (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || !Utils().validateEmail(Utils().nullSafeString(currentItem.fields![fieldIndex]!.value)))) ? Padding(
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
                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.all(3.6),
                                                      child:
                                                      Text(
                                                        (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isNotEmpty && !Utils().validateEmail(Utils().nullSafeString(currentItem.fields![fieldIndex]!.value)))
                                                            ? "Please enter valid Email Address."
                                                            : "Please enter your Email Address.",
                                                        style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              :*/
                                            SizedBox(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.32,
                                      ),
                                      Utils().nullSafeString(field.help_text).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.help_text),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.8,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ),
                                            )
                                          : Container(),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftTELEPHONE) {
                                  final TextEditingController _controller = new TextEditingController();
                                  _controller.text = Utils().nullSafeString(currentItem.fields![fieldIndex]!.value);
                                  _controller.selection =
                                      TextSelection.fromPosition(TextPosition(offset: _controller.text.length));

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 21.96,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                              enabled: !currentItem.fields![fieldIndex]!.is_readonly!,
                                              onChanged: (value) {
                                                setState(() {
                                                  currentItem.fields![fieldIndex]!.value = value;
                                                });
                                              },
                                              style: TextStyle(
                                                  color: currentItem.fields![fieldIndex]!.is_readonly!
                                                      ? Colors.grey[500]
                                                      : Colors.black),
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.phone,
                                              maxLength: 15,
                                              controller: _controller,
                                              decoration: InputDecoration(
                                                counterText: '',
                                                hintText: Utils()
                                                    .nullSafeString(currentItem.fields![fieldIndex]!.placeholder),
                                                suffixIcon: /*(currentItem.fields![fieldIndex]!.is_required && (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length < 10 || Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length > 15))) ? Padding(
                                                padding: EdgeInsets.only(left: 28.8),
                                                child: Icon(
                                                  Icons.warning_amber_outlined,
                                                  color: Colors.red,
                                                  size: 18,
                                                ),
                                              ) :*/
                                                    SizedBox(),
                                              ),
                                              focusNode: FocusNode(),
                                            ),
                                            /*(currentItem.fields![fieldIndex]!.is_required && (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length < 10 || Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length > 15))) ?
                                          Padding(
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
                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.all(3.6),
                                                      child:
                                                      Text(
                                                        (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isNotEmpty && (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length < 10 || Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length > 15)))
                                                            ? "Please enter valid Telephone Number."
                                                            : "Please enter your Telephone Number.",
                                                        style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              : */
                                            SizedBox(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.32,
                                      ),
                                      Utils().nullSafeString(field.help_text).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.help_text),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.8,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ),
                                            )
                                          : Container(),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
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
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 21.96,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Utils().nullSafeString(field.placeholder).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left: getSecondStageMargin(Utils().nullSafeString(currentItem.label)),
                                                  top: 7.32,
                                                  bottom: 3.66),
                                              child: Text(Utils().nullSafeString(field.placeholder),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10.8,
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                            )
                                          : Container(),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                ? getThirdStageMargin(Utils().nullSafeString(currentItem.label))
                                                : getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                        child: Column(
                                          children: [
                                            RaisedButton(
                                              onPressed: () => null,
                                              child: Text(
                                                  Utils().changeDateFormat(
                                                      Utils().stringToDateTime(Utils().nullSafeString(field.value),
                                                          Constant.defaultDateFormatWeb),
                                                      "dd MMMM yyyy"),
                                                  style: TextStyle(
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[500]
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
                                                      ? getThirdStageMargin(Utils().nullSafeString(currentItem.label))
                                                      : getSecondStageMargin(
                                                          Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.help_text),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.8,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ),
                                            )
                                          : Container(),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
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
                                      /*parentIndex != 0 ?*/ SizedBox(
                                        height: 21.96,
                                      ) /*: Container()*/,
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ))
                                          : Container(),
                                      (fieldIndex == 0 && Utils().nullSafeString(currentItem.sub_label).isNotEmpty)
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: 14.64),
                                              child: Text(
                                                Utils().nullSafeString(currentItem.sub_label),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.4,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Utils().nullSafeString(field.placeholder).isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left: getSecondStageMargin(Utils().nullSafeString(currentItem.label)),
                                                  top: 7.32,
                                                  bottom: 3.66),
                                              child: Text(Utils().nullSafeString(field.placeholder),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10.8,
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                            )
                                          : Container(),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: Utils().nullSafeString(field.placeholder).isNotEmpty
                                                ? getThirdStageMargin(Utils().nullSafeString(currentItem.label))
                                                : getSecondStageMargin(Utils().nullSafeString(currentItem.label))),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 7.32,
                                            ),
                                            GestureDetector(
                                              onTap: () async {},
                                              child: (Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value)
                                                          .isEmpty ||
                                                      Utils().validateWebURL(Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value)))
                                                  ? FadeInImage.assetNetwork(
                                                      fit: BoxFit.fitHeight,
                                                      height: 72,
                                                      width: 72,
                                                      placeholder: "assets/spinner.gif",
                                                      image: Utils().nullSafeWithDefaultString(
                                                          currentItem.fields![fieldIndex]!.value,
                                                          Constant.defaultAttachmentImage),
                                                    )
                                                  : Utils().hasImageExtensions(Utils()
                                                          .nullSafeString(currentItem.fields![fieldIndex]!.value))
                                                      ? Image.file(
                                                          File(Utils()
                                                              .nullSafeString(currentItem.fields![fieldIndex]!.value)),
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
                                                      ? getThirdStageMargin(Utils().nullSafeString(currentItem.label))
                                                      : getSecondStageMargin(
                                                          Utils().nullSafeString(currentItem.label))),
                                              child: Text(
                                                Utils().nullSafeString(field.help_text),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.8,
                                                    color: currentItem.fields![fieldIndex]!.is_readonly!
                                                        ? Colors.grey[600]
                                                        : Colors.black),
                                              ),
                                            )
                                          : Container(),
                                      ((parentIndex == (_interactionLogDataItems!.length - 1)) &&
                                              fieldIndex == (currentItem.fields!.length - 1))
                                          ? Container(
                                              height: 14.64,
                                            )
                                          : Container(),
                                    ],
                                  );
                                }
                              }
                              return Container();
                            }),
                          );
                        }),
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
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
}
