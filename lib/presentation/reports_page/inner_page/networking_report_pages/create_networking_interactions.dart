import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/view_networking_report_list_bloc.dart';
import 'package:flutter_app/models/create_interaction_details_model.dart';
import 'package:flutter_app/models/interaction_wise_questions_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/submit_interaction_questions_request_model.dart';
import 'package:flutter_app/presentation/homepage/innerpage/take_picture_screen.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../loader.dart';
import '../../../../preferences.dart';
import '../networking_report.dart';

class CreateNetworkingInteractions extends StatefulWidget {
  static String id = "createNetworkingInteractions";
  static String path = "$NetworkReport.path/$id";

  @override
  _CreateNetworkingInteractionsState createState() => _CreateNetworkingInteractionsState();
}

class _CreateNetworkingInteractionsState extends State<CreateNetworkingInteractions> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  List<CNERegionItems?>? _regionItems = [];
  CNERegionItems? _selectedRegion;

  List<CNECentersItems?>? _centerItems = [];
  List<CNECentersItems?>? _regionWiseCenters = [];
  CNECentersItems? _selectedCenter;

  List<String?>? _interactionTypesItems = [];
  String? _selectedInteractionType;

  List<IWFormFieldsModel?>? _interactionQuestionsItems = [];
  List<SubmitInteractionsQuestionsRequestModel> _submitInteractionsQuestionsRequestModel = [];

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

    //FOR GET NETWORKING INTERACTIONS
    _showLoadingIndicator();
    BlocProvider.of<ViewNetworkingReportBloc>(context).add(ViewNetworkingReportEvent.createInteractionDetails(
      context,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ViewNetworkingReportBloc, ViewNetworkingReportState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                createInteractionDetails: (createInteractionDetailsModel) {
                  if (createInteractionDetailsModel != null) {
                    if (createInteractionDetailsModel.networking_data != null) {
                      _regionItems = createInteractionDetailsModel.networking_data!.regions;
                      if ((_regionItems != null && _regionItems!.length > 0)) {
                        final regionIndex = _regionItems!.indexWhere((element) =>
                            element!.id.toString() ==
                            Utils().nullSafeString(createInteractionDetailsModel.networking_data!.user_region_id));
                        if (regionIndex >= 0) {
                          _selectedRegion = _regionItems![regionIndex]!;
                        }
                      }

                      _centerItems = createInteractionDetailsModel.networking_data!.centers;
                      if (_selectedRegion != null) {
                        //FOR FILL REGION WISE CENTERS
                        _regionWiseCenters = [];
                        _selectedCenter = null;

                        if (_centerItems != null) {
                          for (int v = 0; v < _centerItems!.length; v++) {
                            if (_selectedRegion!.id.toString() == _centerItems![v]!.RegionId) {
                              _regionWiseCenters!.add(_centerItems![v]!);
                            }
                          }

                          if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0)) {
                            final centerIndex = _regionWiseCenters!.indexWhere((element) =>
                                element!.id.toString() ==
                                Utils().nullSafeString(createInteractionDetailsModel.networking_data!.user_center_id));
                            if (centerIndex >= 0) {
                              _selectedCenter = _regionWiseCenters![centerIndex]!;
                              BlocProvider.of<ViewNetworkingReportBloc>(context).add(
                                  ViewNetworkingReportEvent.centerWiseInteractionTypes(
                                      context, Utils().nullSafeInt(_selectedCenter!.id).toString()));
                            }
                          }
                        }
                      }
                    }
                  }
                },
                submitInteractionsQuestionsDetails: (submitInteractionsQuestionsDetailsModel) {
                  if (submitInteractionsQuestionsDetailsModel != null &&
                      !submitInteractionsQuestionsDetailsModel.has_error!) {
                    Navigator.pop(context);
                  }
                },
                centerWiseInteractionTypes: (centerWiseInteractionTypesModel) {
                  if (centerWiseInteractionTypesModel != null) {
                    if (centerWiseInteractionTypesModel.type != null) {
                      _interactionTypesItems = centerWiseInteractionTypesModel.type;
                    }
                  }
                },
                interactionWiseQuestions: (interactionWiseQuestionsModel) {
                  if (interactionWiseQuestionsModel != null) {
                    if (interactionWiseQuestionsModel.network_question != null) {
                      if (interactionWiseQuestionsModel.network_question!.form_fields != null) {
                        _interactionQuestionsItems = interactionWiseQuestionsModel.network_question!.form_fields;
                      }
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ViewNetworkingReportBloc, ViewNetworkingReportState>(
          listener: (context, state) {
            state.maybeWhen(orElse: () {});
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
                                    "Create Report",
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
                              "Networking Interaction Report",
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
                                      child: DropdownButton<CNERegionItems>(
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

                                            //FOR FILL REGION WISE CENTERS
                                            _regionWiseCenters = [];
                                            _selectedCenter = null;

                                            _interactionTypesItems = [];
                                            _selectedInteractionType = null;

                                            _interactionQuestionsItems = [];

                                            if (_centerItems != null) {
                                              for (int v = 0; v < _centerItems!.length; v++) {
                                                if (_selectedRegion!.id.toString() == _centerItems![v]!.RegionId) {
                                                  _regionWiseCenters!.add(_centerItems![v]!);
                                                }
                                              }
                                            }
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
                                              text: "2. Center",
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
                                      child: DropdownButton<CNECentersItems>(
                                        hint: Text('  Choose Center'),
                                        isExpanded: true,
                                        itemHeight: null,
                                        value: _selectedCenter == null ? null : _selectedCenter,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 21.6,
                                        ),
                                        style: TextStyle(fontSize: 12.6, color: Colors.black),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedCenter = value!;

                                            _interactionTypesItems = [];
                                            _selectedInteractionType = null;

                                            _interactionQuestionsItems = [];

                                            //FOR GET CENTER WISE INTERACTION TYPES
                                            _showLoadingIndicator();
                                            BlocProvider.of<ViewNetworkingReportBloc>(context).add(
                                                ViewNetworkingReportEvent.centerWiseInteractionTypes(
                                                    context, Utils().nullSafeInt(_selectedCenter!.id).toString()));
                                          });
                                        },
                                        items: _regionWiseCenters!.map(
                                          (value) {
                                            return DropdownMenuItem(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  7.2,
                                                ),
                                                child: Text(Utils().nullSafeString(value!.CenterName)),
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
                                              text: "3. Interaction Type",
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
                                      child: DropdownButton<String>(
                                        hint: Text('  Choose Interaction Type'),
                                        isExpanded: true,
                                        itemHeight: null,
                                        value: _selectedInteractionType == null ? null : _selectedInteractionType,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 21.6,
                                        ),
                                        style: TextStyle(fontSize: 12.6, color: Colors.black),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedInteractionType = value!;

                                            _interactionQuestionsItems = [];

                                            //FOR GET CENTER WISE INTERACTION TYPES
                                            _showLoadingIndicator();
                                            BlocProvider.of<ViewNetworkingReportBloc>(context).add(
                                                ViewNetworkingReportEvent.interactionWiseQuestions(
                                                    context,
                                                    Utils().nullSafeInt(_selectedCenter!.id).toString(),
                                                    Utils().nullSafeString(_selectedInteractionType)));
                                          });
                                        },
                                        items: _interactionTypesItems!.map(
                                          (value) {
                                            return DropdownMenuItem(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  7.2,
                                                ),
                                                child: Text(Utils().nullSafeString(value)),
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
                                    (_interactionQuestionsItems != null && _interactionQuestionsItems!.length > 0)
                                        ? Form(
                                            key: _formKey,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children:
                                                  List.generate(_interactionQuestionsItems!.length, (parentIndex) {
                                                var currentItem = _interactionQuestionsItems![parentIndex]!;
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
                                                                    Utils()
                                                                        .nullSafeString(currentItem.label)
                                                                        .isNotEmpty)
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
                                                                        text: currentItem
                                                                                .fields![fieldIndex]!.is_required!
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
                                                                            ? getThirdStageMargin(Utils()
                                                                                .nullSafeString(currentItem.label))
                                                                            : getSecondStageMargin(Utils()
                                                                                .nullSafeString(currentItem.label))),
                                                                    child: DropdownButton(
                                                                      itemHeight: null,
                                                                      isExpanded: true,
                                                                      hint: Text(
                                                                        Utils()
                                                                            .nullSafeString(field.placeholder)
                                                                            .trim(),
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
                                                                                      newValue as IWOptionsItems;
                                                                                  _interactionQuestionsItems![
                                                                                              parentIndex]!
                                                                                          .fields![fieldIndex]!
                                                                                          .selected =
                                                                                      selectedDropdownItem.id;
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
                                                                                      Utils()
                                                                                          .nullSafeString(item.header),
                                                                                      style: TextStyle(
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontSize: 12.6),
                                                                                    )
                                                                                  : Container(),
                                                                              Container(
                                                                                  margin: EdgeInsets.only(
                                                                                      left: getFirstStageMargin(Utils()
                                                                                          .nullSafeString(
                                                                                              item!.header))),
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
                                                                    Utils()
                                                                        .nullSafeString(currentItem.label)
                                                                        .isNotEmpty)
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
                                                                        text: currentItem
                                                                                .fields![fieldIndex]!.is_required!
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
                                                                            ? getThirdStageMargin(Utils()
                                                                                .nullSafeString(currentItem.label))
                                                                            : getSecondStageMargin(Utils()
                                                                                .nullSafeString(currentItem.label))),
                                                                    child: DropdownButton(
                                                                      itemHeight: null,
                                                                      isExpanded: true,
                                                                      hint: Text(
                                                                        Utils()
                                                                            .nullSafeString(field.placeholder)
                                                                            .trim(),
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
                                                                                      newValue as IWOptionsItems;
                                                                                  _interactionQuestionsItems![
                                                                                              parentIndex]!
                                                                                          .fields![fieldIndex]!
                                                                                          .selected =
                                                                                      selectedDropdownItem.id;
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
                                                                                      Utils()
                                                                                          .nullSafeString(item.header),
                                                                                      style: TextStyle(
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontSize: 12.6),
                                                                                    )
                                                                                  : Container(),
                                                                              Container(
                                                                                  margin: EdgeInsets.only(
                                                                                      left: getFirstStageMargin(Utils()
                                                                                          .nullSafeString(
                                                                                              item!.header))),
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
                                                        if (field.name != "other_event_name") {
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
                                                                      Utils()
                                                                          .nullSafeString(currentItem.label)
                                                                          .isNotEmpty)
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
                                                                          text: currentItem
                                                                                  .fields![fieldIndex]!.is_required!
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
                                                                    TextFormField(
                                                                      validator: (value) {
                                                                        if (value == null || value.isEmpty) {
                                                                          return 'Please enter some text';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      enabled: (!currentItem
                                                                          .fields![fieldIndex]!.is_readonly!),
                                                                      onChanged: (value) {
                                                                        setState(
                                                                          () {
                                                                            currentItem.fields![fieldIndex]!.value =
                                                                                value;
                                                                          },
                                                                        );
                                                                      },
                                                                      textInputAction: TextInputAction.next,
                                                                      keyboardType: TextInputType.text,
                                                                      controller: _controller,
                                                                      decoration: InputDecoration(
                                                                        hintText: Utils().nullSafeString(currentItem
                                                                            .fields![fieldIndex]!.placeholder),
                                                                        // suffixIcon: (currentItem.fields![fieldIndex]!.is_required! && Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty)
                                                                        //     ? Padding(
                                                                        //         padding: EdgeInsets.only(left: 28.8),
                                                                        //         child: Icon(
                                                                        //           Icons.warning_amber_outlined,
                                                                        //           color: Colors.red,
                                                                        //           size: 18,
                                                                        //         ),
                                                                        //       )
                                                                        //     : SizedBox(),
                                                                      ),
                                                                      focusNode: FocusNode(),
                                                                    ),
                                                                    // (currentItem.fields![fieldIndex]!.is_required! &&
                                                                    //         Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty)
                                                                    //     ? Padding(
                                                                    //         padding: EdgeInsets.only(bottom: 7.2),
                                                                    //         child: Row(
                                                                    //           children: [
                                                                    //             Expanded(
                                                                    //               child: Container(
                                                                    //                 decoration: BoxDecoration(
                                                                    //                   borderRadius: BorderRadius.circular(7.2),
                                                                    //                   color: Color(0x1FEB5757),
                                                                    //                 ),
                                                                    //                 child: Padding(
                                                                    //                   padding: EdgeInsets.all(3.6),
                                                                    //                   child: Text(
                                                                    //                     Utils().nullSafeString(currentItem.fields![fieldIndex]!.validation_message),
                                                                    //                     style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                                    //                   ),
                                                                    //                 ),
                                                                    //               ),
                                                                    //             ),
                                                                    //           ],
                                                                    //         ),
                                                                    //       )
                                                                    //     : SizedBox(),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 7.32,
                                                              ),
                                                              Utils().nullSafeString(field.help_text).isNotEmpty
                                                                  ? Container(
                                                                      margin: EdgeInsets.only(
                                                                          left: getSecondStageMargin(Utils()
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
                                                        } else if (field.name == "other_event_name" &&
                                                            Utils().nullSafeString(
                                                                    currentItem.fields![fieldIndex - 1]!.selected) ==
                                                                "Other") {
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
                                                                      Utils()
                                                                          .nullSafeString(currentItem.label)
                                                                          .isNotEmpty)
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
                                                                          text: currentItem
                                                                                  .fields![fieldIndex]!.is_required!
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
                                                                    TextFormField(
                                                                      validator: (value) {
                                                                        if (value == null || value.isEmpty) {
                                                                          return 'Please enter some text';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      enabled: (!currentItem
                                                                          .fields![fieldIndex]!.is_readonly!),
                                                                      onChanged: (value) {
                                                                        setState(() {
                                                                          currentItem.fields![fieldIndex]!.value =
                                                                              value;
                                                                        });
                                                                      },
                                                                      textInputAction: TextInputAction.next,
                                                                      keyboardType: TextInputType.text,
                                                                      controller: _controller,
                                                                      decoration: InputDecoration(
                                                                        hintText: Utils().nullSafeString(currentItem
                                                                            .fields![fieldIndex]!.placeholder),
                                                                        // suffixIcon: (currentItem.fields![fieldIndex]!.is_required! && Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty)
                                                                        //     ? Padding(
                                                                        //         padding: EdgeInsets.only(left: 28.8),
                                                                        //         child: Icon(
                                                                        //           Icons.warning_amber_outlined,
                                                                        //           color: Colors.red,
                                                                        //           size: 18,
                                                                        //         ),
                                                                        //       )
                                                                        //     : SizedBox(),
                                                                      ),
                                                                      focusNode: FocusNode(),
                                                                    ),
                                                                    // (currentItem.fields![fieldIndex]!.is_required! &&
                                                                    //         Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty)
                                                                    //     ? Padding(
                                                                    //         padding: EdgeInsets.only(bottom: 7.2),
                                                                    //         child: Row(
                                                                    //           children: [
                                                                    //             Expanded(
                                                                    //               child: Container(
                                                                    //                 decoration: BoxDecoration(
                                                                    //                   borderRadius: BorderRadius.circular(7.2),
                                                                    //                   color: Color(0x1FEB5757),
                                                                    //                 ),
                                                                    //                 child: Padding(
                                                                    //                   padding: EdgeInsets.all(3.6),
                                                                    //                   child: Text(
                                                                    //                     Utils().nullSafeString(currentItem.fields![fieldIndex]!.validation_message),
                                                                    //                     style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                                    //                   ),
                                                                    //                 ),
                                                                    //               ),
                                                                    //             ),
                                                                    //           ],
                                                                    //         ),
                                                                    //       )
                                                                    //     : SizedBox(),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 7.32,
                                                              ),
                                                              Utils().nullSafeString(field.help_text).isNotEmpty
                                                                  ? Container(
                                                                      margin: EdgeInsets.only(
                                                                          left: getSecondStageMargin(Utils()
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
                                                                    Utils()
                                                                        .nullSafeString(currentItem.label)
                                                                        .isNotEmpty)
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
                                                                        text: currentItem
                                                                                .fields![fieldIndex]!.is_required!
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
                                                                  TextFormField(
                                                                    validator: (value) {
                                                                      if (value == null || value.isEmpty) {
                                                                        return 'Please enter some text';
                                                                      }
                                                                      return null;
                                                                    },
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
                                                                      // suffixIcon: (currentItem.fields![fieldIndex]!.is_required! && Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty)
                                                                      //     ? Padding(
                                                                      //         padding: EdgeInsets.only(left: 28.8),
                                                                      //         child: Icon(
                                                                      //           Icons.warning_amber_outlined,
                                                                      //           color: Colors.red,
                                                                      //           size: 18,
                                                                      //         ),
                                                                      //       )
                                                                      //     : SizedBox(),
                                                                    ),
                                                                    focusNode: FocusNode(),
                                                                  ),
                                                                  // (currentItem.fields![fieldIndex]!.is_required! &&
                                                                  //         Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty)
                                                                  //     ? Padding(
                                                                  //         padding: EdgeInsets.only(bottom: 7.2),
                                                                  //         child: Row(
                                                                  //           children: [
                                                                  //             Expanded(
                                                                  //               child: Container(
                                                                  //                 decoration: BoxDecoration(
                                                                  //                   borderRadius: BorderRadius.circular(7.2),
                                                                  //                   color: Color(0x1FEB5757),
                                                                  //                 ),
                                                                  //                 child: Padding(
                                                                  //                   padding: EdgeInsets.all(3.6),
                                                                  //                   child: Text(
                                                                  //                     Utils().nullSafeString(currentItem.fields![fieldIndex]!.validation_message),
                                                                  //                     style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                                  //                   ),
                                                                  //                 ),
                                                                  //               ),
                                                                  //             ),
                                                                  //           ],
                                                                  //         ),
                                                                  //       )
                                                                  //     : SizedBox(),
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
                                                                    Utils()
                                                                        .nullSafeString(currentItem.label)
                                                                        .isNotEmpty)
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
                                                                        text: currentItem
                                                                                .fields![fieldIndex]!.is_required!
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
                                                                  TextFormField(
                                                                    validator: (value) {
                                                                      if (value == null || value.isEmpty) {
                                                                        return 'Please enter some text';
                                                                      }
                                                                      return null;
                                                                    },
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
                                                                      // suffixIcon: (currentItem.fields![fieldIndex]!.is_required! && Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty)
                                                                      //     ? Padding(
                                                                      //         padding: EdgeInsets.only(left: 28.8),
                                                                      //         child: Icon(
                                                                      //           Icons.warning_amber_outlined,
                                                                      //           color: Colors.red,
                                                                      //           size: 18,
                                                                      //         ),
                                                                      //       )
                                                                      //     : SizedBox(),
                                                                    ),
                                                                    focusNode: FocusNode(),
                                                                  ),
                                                                  // (currentItem.fields![fieldIndex]!.is_required! &&
                                                                  //         Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty)
                                                                  //     ? Padding(
                                                                  //         padding: EdgeInsets.only(bottom: 7.2),
                                                                  //         child: Row(
                                                                  //           children: [
                                                                  //             Expanded(
                                                                  //               child: Container(
                                                                  //                 decoration: BoxDecoration(
                                                                  //                   borderRadius: BorderRadius.circular(7.2),
                                                                  //                   color: Color(0x1FEB5757),
                                                                  //                 ),
                                                                  //                 child: Padding(
                                                                  //                   padding: EdgeInsets.all(3.6),
                                                                  //                   child: Text(
                                                                  //                     Utils().nullSafeString(currentItem.fields![fieldIndex]!.validation_message),
                                                                  //                     style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                                  //                   ),
                                                                  //                 ),
                                                                  //               ),
                                                                  //             ),
                                                                  //           ],
                                                                  //         ),
                                                                  //       )
                                                                  //     : SizedBox(),
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
                                                                    Utils()
                                                                        .nullSafeString(currentItem.label)
                                                                        .isNotEmpty)
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
                                                                        text: currentItem
                                                                                .fields![fieldIndex]!.is_required!
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
                                                                  TextFormField(
                                                                    validator: (value) {
                                                                      if (value == null || value.isEmpty) {
                                                                        return 'Please enter some text';
                                                                      }
                                                                      return null;
                                                                    },
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
                                                                      // suffixIcon: (currentItem.fields![fieldIndex]!.is_required! && (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || !Utils().validateEmail(Utils().nullSafeString(currentItem.fields![fieldIndex]!.value))))
                                                                      //     ? Padding(
                                                                      //         padding: EdgeInsets.only(left: 28.8),
                                                                      //         child: Icon(
                                                                      //           Icons.warning_amber_outlined,
                                                                      //           color: Colors.red,
                                                                      //           size: 18,
                                                                      //         ),
                                                                      //       )
                                                                      //     : SizedBox(),
                                                                    ),
                                                                    focusNode: FocusNode(),
                                                                  ),
                                                                  // (currentItem.fields![fieldIndex]!.is_required! &&
                                                                  //         (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || !Utils().validateEmail(Utils().nullSafeString(currentItem.fields![fieldIndex]!.value))))
                                                                  //     ? Padding(
                                                                  //         padding: EdgeInsets.only(bottom: 7.2),
                                                                  //         child: Row(
                                                                  //           children: [
                                                                  //             Expanded(
                                                                  //               child: Container(
                                                                  //                 decoration: BoxDecoration(
                                                                  //                   borderRadius: BorderRadius.circular(7.2),
                                                                  //                   color: Color(0x1FEB5757),
                                                                  //                 ),
                                                                  //                 child: Padding(
                                                                  //                   padding: EdgeInsets.all(3.6),
                                                                  //                   child: Text(
                                                                  //                     (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isNotEmpty && !Utils().validateEmail(Utils().nullSafeString(currentItem.fields![fieldIndex]!.value))) ? "Please enter valid Email Address." : "Please enter your Email Address.",
                                                                  //                     style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                                  //                   ),
                                                                  //                 ),
                                                                  //               ),
                                                                  //             ),
                                                                  //           ],
                                                                  //         ),
                                                                  //       )
                                                                  //     : SizedBox(),
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
                                                                    Utils()
                                                                        .nullSafeString(currentItem.label)
                                                                        .isNotEmpty)
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
                                                                        text: currentItem
                                                                                .fields![fieldIndex]!.is_required!
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
                                                                  TextFormField(
                                                                    validator: (value) {
                                                                      if (value == null || value.isEmpty) {
                                                                        return 'Please enter some text';
                                                                      }
                                                                      return null;
                                                                    },
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
                                                                      // suffixIcon: (currentItem.fields![fieldIndex]!.is_required! && (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length < 10 || Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length > 15)))
                                                                      //     ? Padding(
                                                                      //         padding: EdgeInsets.only(left: 28.8),
                                                                      //         child: Icon(
                                                                      //           Icons.warning_amber_outlined,
                                                                      //           color: Colors.red,
                                                                      //           size: 18,
                                                                      //         ),
                                                                      //       )
                                                                      //     : SizedBox(),
                                                                    ),
                                                                    focusNode: FocusNode(),
                                                                  ),
                                                                  // (currentItem.fields![fieldIndex]!.is_required! &&
                                                                  //         (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length < 10 || Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length > 15)))
                                                                  //     ? Padding(
                                                                  //         padding: EdgeInsets.only(bottom: 7.2),
                                                                  //         child: Row(
                                                                  //           children: [
                                                                  //             Expanded(
                                                                  //               child: Container(
                                                                  //                 decoration: BoxDecoration(
                                                                  //                   borderRadius: BorderRadius.circular(7.2),
                                                                  //                   color: Color(0x1FEB5757),
                                                                  //                 ),
                                                                  //                 child: Padding(
                                                                  //                   padding: EdgeInsets.all(3.6),
                                                                  //                   child: Text(
                                                                  //                     (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isNotEmpty && (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).isEmpty || (Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length < 10 || Utils().nullSafeString(currentItem.fields![fieldIndex]!.value).length > 15))) ? "Please enter valid Telephone Number." : "Please enter your Telephone Number.",
                                                                  //                     style: TextStyle(color: Color(0xffEB5757), fontSize: 10.8),
                                                                  //                   ),
                                                                  //                 ),
                                                                  //               ),
                                                                  //             ),
                                                                  //           ],
                                                                  //         ),
                                                                  //       )
                                                                  //     : SizedBox(),
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
                                                                    Utils()
                                                                        .nullSafeString(currentItem.label)
                                                                        .isNotEmpty)
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
                                                                        text: currentItem
                                                                                .fields![fieldIndex]!.is_required!
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
                                                                    child: Text(
                                                                        Utils().nullSafeString(field.placeholder),
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
                                                                  left: Utils()
                                                                          .nullSafeString(field.placeholder)
                                                                          .isNotEmpty
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
                                                                            ? getThirdStageMargin(Utils()
                                                                                .nullSafeString(currentItem.label))
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
                                                                    Utils()
                                                                        .nullSafeString(currentItem.label)
                                                                        .isNotEmpty)
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
                                                                        text: currentItem
                                                                                .fields![fieldIndex]!.is_required!
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
                                                                    child: Text(
                                                                        Utils().nullSafeString(field.placeholder),
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
                                                                  left: Utils()
                                                                          .nullSafeString(field.placeholder)
                                                                          .isNotEmpty
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
                                                                                _interactionQuestionsItems![
                                                                                            parentIndex]!
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
                                                                            Utils().validateWebURL(Utils()
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value)))
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
                                                                                .nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value))
                                                                            ? Image.file(
                                                                                File(Utils().nullSafeString(currentItem
                                                                                    .fields![fieldIndex]!.value)),
                                                                                height: 72,
                                                                                width: 72,
                                                                                fit: BoxFit.fitHeight,
                                                                              )
                                                                            : Text(
                                                                                File(Utils().nullSafeString(currentItem.fields![fieldIndex]!.value))
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
                                                                            ? getThirdStageMargin(Utils()
                                                                                .nullSafeString(currentItem.label))
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

                                                      (parentIndex == (_interactionQuestionsItems!.length - 1))
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
                                          )
                                        : Container(),
                                    (_interactionQuestionsItems != null && _interactionQuestionsItems!.length > 0)
                                        ? SizedBox(
                                            height: 131.76,
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ),
                            (_interactionQuestionsItems != null && _interactionQuestionsItems!.length > 0)
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
                                          padding: EdgeInsets.only(top: 18, left: 21.6, right: 21.6, bottom: 72),
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

                                                  _submitInteractionsQuestionsRequestModel = [];
                                                  _submitInteractionsQuestionsRequestModel.add(
                                                      SubmitInteractionsQuestionsRequestModel(
                                                          "login_user_type",
                                                          Utils()
                                                              .nullSafeString(loginModel!.login_user_type.toString()),
                                                          null,
                                                          null));
                                                  _submitInteractionsQuestionsRequestModel.add(
                                                      SubmitInteractionsQuestionsRequestModel(
                                                          "login_parent_type",
                                                          Utils().nullSafeString(loginModel.login_parent_type),
                                                          null,
                                                          null));
                                                  _submitInteractionsQuestionsRequestModel.add(
                                                      SubmitInteractionsQuestionsRequestModel(
                                                          "bkms_id",
                                                          Utils().nullSafeInt(loginModel.bkms_id).toString(),
                                                          null,
                                                          null));
                                                  _submitInteractionsQuestionsRequestModel.add(
                                                      SubmitInteractionsQuestionsRequestModel(
                                                          "region_id",
                                                          Utils().nullSafeInt(_selectedRegion!.id).toString(),
                                                          null,
                                                          null));
                                                  _submitInteractionsQuestionsRequestModel.add(
                                                      SubmitInteractionsQuestionsRequestModel(
                                                          "center_id",
                                                          Utils().nullSafeInt(_selectedCenter!.id).toString(),
                                                          null,
                                                          null));
                                                  _submitInteractionsQuestionsRequestModel.add(
                                                      SubmitInteractionsQuestionsRequestModel(
                                                          "interaction_type",
                                                          Utils().nullSafeString(_selectedInteractionType),
                                                          null,
                                                          null));

                                                  if (_formKey.currentState!.validate() &&
                                                      validateInteractionsInformation()) {
                                                    setState(() {
                                                      _showLoadingIndicator();
                                                      BlocProvider.of<ViewNetworkingReportBloc>(context).add(
                                                          ViewNetworkingReportEvent.submitInteractionsQuestionsDetails(
                                                              context, _submitInteractionsQuestionsRequestModel));
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
                    ),
                  ),
                  (_regionItems!.length == 0)
                      ? Stack(
                          children: [
                            Container(),
                            Padding(
                              padding: EdgeInsets.only(left: 18, right: 18, top: 18),
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
                                      "No data found.",
                                      style: TextStyle(color: Color(0xFF828282), fontSize: 12.6),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
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
    if (_interactionQuestionsItems != null) {
      String strValidationMessage = '';
      for (int parentIndex = 0; parentIndex < _interactionQuestionsItems!.length; parentIndex++) {
        var currentItem = _interactionQuestionsItems![parentIndex]!;
        for (int fieldIndex = 0; fieldIndex < currentItem.fields!.length; fieldIndex++) {
          var field = currentItem.fields![fieldIndex]!;

          if (field.type == Constant.brftSELECT) {
            if (field.selected != null && field.selected!.length > 0) {
              _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
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
              _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
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
              _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required!) {
              if (Utils().nullSafeString(field.value).isEmpty) {
                if ((field.name == "other_event_name" &&
                    Utils().nullSafeString(currentItem.fields![fieldIndex - 1]!.selected) != "Other")) {
                } else {
                  isForError = true;
                  strValidationMessage = /*"Please enter " +*/ Utils()
                      .nullSafeString(field.validation_message) /* + "."*/;
                  break;
                }
              }
            }
          }

          if (field.type == Constant.brftNUMERIC_TEXTBOX) {
            if (field.value != null) {
              _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
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
              _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
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
              _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
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
              _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
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
              _interactionQuestionsItems![parentIndex]!.fields![fieldIndex]!.value =
                  Utils().changeDateFormat(DateTime.now(), Constant.defaultDateFormatWeb);
            }

            if (_interactionQuestionsItems![parentIndex]!.fields![fieldIndex]!.value != null) {
              _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
                  Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
            }

            if (field.is_required!) {
              if (Utils()
                  .nullSafeString(_interactionQuestionsItems![parentIndex]!.fields![fieldIndex]!.value)
                  .isEmpty) {
                isForError = true;
                strValidationMessage = "Please choose your " + Utils().nullSafeString(field.validation_message) + ".";
                break;
              }
            }
          }

          if (field.type == Constant.brftFILE) {
            if (field.value != null) {
              if (Utils().validateWebURL(Utils().nullSafeString(field.value))) {
                _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
                    Utils().nullSafeString(field.name), Utils().nullSafeString(field.value), null, null));
              } else {
                _submitInteractionsQuestionsRequestModel.add(SubmitInteractionsQuestionsRequestModel(
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
      setState(() {
        _interactionQuestionsItems![parentIndex]!.fields![fieldIndex]!.value =
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
                    _interactionQuestionsItems![parentIndex]!.fields![fieldIndex]!.value = strImagePath;
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
                    _interactionQuestionsItems![parentIndex]!.fields![fieldIndex]!.value =
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
