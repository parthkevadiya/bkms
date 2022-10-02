import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/networking_interaction_details_model.dart';
import 'package:flutter_app/models/networking_interaction_log_model.dart';
import 'package:flutter_app/models/view_network_report_list_model.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Bloc/networking_data_update_bloc.dart';
import '../../../../loader.dart';
import '../../networking_report_model.dart';
import 'networking_report_interaction_log.dart';

class NetworkingReportInteractionDetails extends StatefulWidget {
  static String id = "networkingReportInteractionDetails";
  static String path = "${NetworkingReportInteractionLog.path}/$id";

  @override
  _NetworkingReportInteractionDetailsState createState() => _NetworkingReportInteractionDetailsState();
}

class _NetworkingReportInteractionDetailsState extends State<NetworkingReportInteractionDetails>
    with TickerProviderStateMixin {
  List<InteractionsFormAFieldsModel?>? _interactionLogDataItems = [];

  NetworkReportListDataModel? _networkReportListDataModel;
  NetworkingListDataModel? _networkingListDataModel;
  InteractionLogDataModel? _interactionLogDataModel;

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
    if (paramsBloc is NetworkingReportDetailsState) {
      _networkReportListDataModel = paramsBloc.networkReportListDataModel;
      _networkingListDataModel = paramsBloc.networkingListDataModel;
      _interactionLogDataModel = paramsBloc.interactionLogDataModel;
    }

    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context).add(
        NetworkingReportDetailsEvent(_networkReportListDataModel!, _networkingListDataModel, _interactionLogDataModel));

    //FOR GET INTERACTION DETAILS
    _showLoadingIndicator();
    BlocProvider.of<NetWorkingDataUpdateBloc>(context).add(NetWorkingDataUpdateEvent.networkingInteractionDetails(
      context,
      Utils().nullSafeString(_networkReportListDataModel!.id),
      Utils().nullSafeString(_networkingListDataModel!.user_id),
      Utils().nullSafeString(_interactionLogDataModel!.id),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NetWorkingDataUpdateBloc, NetWorkingDataUpdateState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                networkingInteractionDetails: (networkingInteractionDetailsModel) {
                  if (networkingInteractionDetailsModel != null) {
                    if (networkingInteractionDetailsModel.network_question != null) {
                      if (networkingInteractionDetailsModel.network_question!.form_fields != null) {
                        _interactionLogDataItems = networkingInteractionDetailsModel.network_question!.form_fields;
                      }
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
                                      "Networking Report",
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
                                if (field.type == Constant.brftSELECT) {
                                  var selectedDropdownItem;
                                  var options = field.options;

                                  if (Utils().nullSafeString(field.selected).isNotEmpty && options != null) {
                                    final stateIndex = options.indexWhere(
                                        (element) => element!.id.toString() == Utils().nullSafeString(field.selected));
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                                            var selectedDropdownItem = newValue as InteractionsOptions;
                                                            _interactionLogDataItems![parentIndex]!
                                                                .fields![fieldIndex]!
                                                                .selected = selectedDropdownItem.id;
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
                                    ],
                                  );
                                }

                                if (field.type == Constant.brftRADIO) {
                                  var selectedDropdownItem;
                                  var options = field.options;

                                  if (Utils().nullSafeString(field.selected).isNotEmpty && options != null) {
                                    final stateIndex =
                                        options.indexWhere((element) => element!.id.toString() == field.selected);
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
                                                      color: currentItem.fields![fieldIndex]!.is_readonly!
                                                          ? Colors.grey[600]
                                                          : Colors.black)),
                                              // new TextSpan(text: currentItem.fields![fieldIndex]!.is_required ? "*": "", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14.4, color: Colors.red)),
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
                                                            var selectedDropdownItem = newValue as InteractionsOptions;
                                                            _interactionLogDataItems![parentIndex]!
                                                                .fields![fieldIndex]!
                                                                .selected = selectedDropdownItem.id;
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
                                    ],
                                  );
                                }

                                (parentIndex == (_interactionLogDataItems!.length - 1))
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
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
