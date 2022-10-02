import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/liability_form_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/submit_liability_form_request_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../loader.dart';
import '../../../preferences.dart';
import 'eventpage.dart';

class LiabilityForm extends StatefulWidget {
  static String id = "liabilityForm";
  static String path = "${EventPage.path}/$id";

  @override
  _LiabilityFormState createState() => _LiabilityFormState();
}

class _LiabilityFormState extends State<LiabilityForm> with TickerProviderStateMixin {
  LiabilityFormModel? _liabilityFormModel;
  List<InitialTextboxModel?>? _initialBoxesItems;
  late MyEvent _myEventItem;
  bool _isViewMode = false;

  bool _eventInformation = true;
  bool _outingInformation = true;

  List<EventLevelModel?>? _eventLevelItems;
  EventLevelModel? _selectedEventLevel;

  TextEditingController _signature = TextEditingController();
  late FocusNode _focusNodeSignature;
  bool? _signatureError;

  TextEditingController _wingName = TextEditingController();
  late FocusNode _focusNodeWingName;
  bool? _wingError;

  TextEditingController _eventName = TextEditingController();
  late FocusNode _focusNodeEventName;
  bool? _eventNameError;

  TextEditingController _eventStartDate = TextEditingController();
  late FocusNode _focusNodeEventStartDate;
  bool? _eventStartDateError;

  TextEditingController _eventEndDate = TextEditingController();
  late FocusNode _focusNodeEventEndDate;
  bool? _eventEndDateError;

  TextEditingController _earlyRegistrationStartDate = TextEditingController();
  late FocusNode _focusNodeEarlyRegistrationStartDate;
  bool? _earlyRegistrationStartDateError;

  TextEditingController _registrationStartDate = TextEditingController();
  late FocusNode _focusNodeRegistrationStartDate;
  bool? _registrationStartDateError;

  TextEditingController _registrationEndDate = TextEditingController();
  late FocusNode _focusNodeRegistrationEndDate;
  bool? _registrationEndDateError;

  TextEditingController _transportationInfoDeadline = TextEditingController();
  late FocusNode _focusNodeTransportationInfoDeadline;
  bool? _transportationInfoDeadlineError;

  TextEditingController _eventDescription = TextEditingController();
  late FocusNode _focusNodeEventDescription;
  bool? _eventDescriptionError;
  FocusNode _focusNodeGenerate = FocusNode();

  bool isLiabilityAccepted = false;
  final _formKey = GlobalKey<FormBuilderState>();

  Color getColor(Set<MaterialState> states) {
    return Colors.blue;
  }

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

    _focusNodeSignature = FocusNode();
    _focusNodeWingName = FocusNode();
    _focusNodeEventName = FocusNode();
    _focusNodeEventStartDate = FocusNode();
    _focusNodeEventEndDate = FocusNode();
    _focusNodeEarlyRegistrationStartDate = FocusNode();
    _focusNodeRegistrationStartDate = FocusNode();
    _focusNodeRegistrationEndDate = FocusNode();
    _focusNodeTransportationInfoDeadline = FocusNode();
    _focusNodeEventDescription = FocusNode();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is EventState) {
      _myEventItem = paramsBloc.myEvent;
      _isViewMode = (Utils().nullSafeString(_myEventItem.liability_form_status) == Constant.eCompleted);
    }

    _showLoadingIndicator();
    BlocProvider.of<HomeBloc>(context).add(HomeEvent.getLiabilityForm(
        context,
        Utils().nullSafeString(_myEventItem.id.toString()),
        Utils().nullSafeString(_myEventItem.userevent_id),
        Utils().nullSafeString(_myEventItem.user_type)));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            state.maybeWhen(
                getLiabilityForm: (liabilityFormModel, l) {
                  if (l == LoadingStatus.Done) {
                    _hideLoadingIndicator();

                    if (liabilityFormModel != null) {
                      this._liabilityFormModel = liabilityFormModel;

                      if (_liabilityFormModel!.is_intialbox /* && !_isViewMode*/) {
                        this._initialBoxesItems = _liabilityFormModel!.initial_textbox;
                      }

                      if (_liabilityFormModel!.myevent_data != null) {
                        _signature.text = Utils().nullSafeString(_liabilityFormModel!.myevent_data!.liability_sign);
                        isLiabilityAccepted =
                            Utils().nullSafeString(_liabilityFormModel!.myevent_data!.liability_sign).isNotEmpty;

                        if (_initialBoxesItems != null && _initialBoxesItems!.length > 0) {
                          _initialBoxesItems![0]!.value =
                              Utils().nullSafeString(_liabilityFormModel!.myevent_data!.initial_box1);
                        }
                        if (_initialBoxesItems != null && _initialBoxesItems!.length > 1) {
                          _initialBoxesItems![1]!.value =
                              Utils().nullSafeString(_liabilityFormModel!.myevent_data!.initial_box2);
                        }
                        if (_initialBoxesItems != null && _initialBoxesItems!.length > 2) {
                          _initialBoxesItems![2]!.value =
                              Utils().nullSafeString(_liabilityFormModel!.myevent_data!.initial_box3);
                        }
                        if (_initialBoxesItems != null && _initialBoxesItems!.length > 3) {
                          _initialBoxesItems![3]!.value =
                              Utils().nullSafeString(_liabilityFormModel!.myevent_data!.initial_box4);
                        }
                        if (_initialBoxesItems != null && _initialBoxesItems!.length > 4) {
                          _initialBoxesItems![4]!.value =
                              Utils().nullSafeString(_liabilityFormModel!.myevent_data!.initial_box5);
                        }
                        if (_initialBoxesItems != null && _initialBoxesItems!.length > 5) {
                          _initialBoxesItems![5]!.value =
                              Utils().nullSafeString(_liabilityFormModel!.myevent_data!.initial_box6);
                        }
                        if (_initialBoxesItems != null && _initialBoxesItems!.length > 6) {
                          _initialBoxesItems![6]!.value =
                              Utils().nullSafeString(_liabilityFormModel!.myevent_data!.initial_box7);
                        }
                        if (_initialBoxesItems != null && _initialBoxesItems!.length > 7) {
                          _initialBoxesItems![7]!.value =
                              Utils().nullSafeString(_liabilityFormModel!.myevent_data!.signed_user_name);
                        }
                      }

                      _wingName.text = Utils().nullSafeString(_liabilityFormModel!.wingname);
                      _eventName.text = Utils().nullSafeString(_liabilityFormModel!.event_details!.event_title);
                      _eventStartDate.text = Utils().changeDateFormatString(
                          Utils().nullSafeString(_liabilityFormModel!.event_details!.event_start_date),
                          Constant.defaultDateFormat,
                          Constant.defaultDateFormatWeb);
                      _eventEndDate.text = Utils().changeDateFormatString(
                          Utils().nullSafeString(_liabilityFormModel!.event_details!.event_end_date),
                          Constant.defaultDateFormat,
                          Constant.defaultDateFormatWeb);
                      _earlyRegistrationStartDate.text = Utils().changeDateFormatString(
                          Utils().nullSafeString(_liabilityFormModel!.event_details!.early_reg_start_date),
                          Constant.defaultDateFormat,
                          Constant.defaultDateFormatWeb);
                      _registrationStartDate.text = Utils().changeDateFormatString(
                          Utils().nullSafeString(_liabilityFormModel!.event_details!.reg_start_date),
                          Constant.defaultDateFormat,
                          Constant.defaultDateFormatWeb);
                      _registrationEndDate.text = Utils().changeDateFormatString(
                          Utils().nullSafeString(_liabilityFormModel!.event_details!.reg_end_date),
                          Constant.defaultDateFormat,
                          Constant.defaultDateFormatWeb);
                      _transportationInfoDeadline.text = Utils().changeDateFormatString(
                          Utils().nullSafeString(_liabilityFormModel!.event_details!.transportation_deadline),
                          Constant.defaultDateFormat,
                          Constant.defaultDateFormatWeb);
                      _eventDescription.text =
                          Utils().nullSafeString(_liabilityFormModel!.event_details!.event_description);

                      if (_liabilityFormModel!.event_level != null) {
                        _eventLevelItems = _liabilityFormModel!.event_level!;
                        final eventLevelIndex = _eventLevelItems!.indexWhere((element) =>
                            element!.id.toString() ==
                            Utils().nullSafeString(_liabilityFormModel!.event_details!.event_level));
                        if (eventLevelIndex >= 0) {
                          _selectedEventLevel = _eventLevelItems![eventLevelIndex]!;
                        }
                      }
                    }
                  } else {
                    if (l == LoadingStatus.Error) {
                      _hideLoadingIndicator();
                    }
                  }
                },
                submitLiabilityForm: (submitLiabilityFormModel) {
                  if (!submitLiabilityFormModel.has_error!) {
                    //FOR RETURN AFTER SUCCESSFULLY SUBMITTED LIABILITY FORM DATA
                    BlocProvider.of<ParamsBloc>(context).add(UpdateRegistrationStatusEvent(Constant.ertLiabilityForm));
                    Navigator.pop(context);
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: KeyboardVisibilityBuilder(
        builder: (BuildContext, bool isKeyboardVisible) {
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
                                        "Liability Form",
                                        style: TextStyle(fontSize: 30.6, fontWeight: FontWeight.bold),
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
                                  _liabilityFormModel != null
                                      ? Utils().nullSafeString(_liabilityFormModel!.user_data!.user_name_event)
                                      : "Event name",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14.4,
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
                  child: Stack(children: [
                    SingleChildScrollView(
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          //  padding: EdgeInsets.zero,
                          children: [
                            (_liabilityFormModel != null && _liabilityFormModel!.event_details != null)
                                ? ExpansionTile(
                                    trailing: (_eventInformation)
                                        ? Icon(Icons.keyboard_arrow_down)
                                        : Icon(Icons.keyboard_arrow_up),
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    onExpansionChanged: (val) {
                                      setState(
                                        () {
                                          _eventInformation = val;
                                        },
                                      );
                                    },
                                    title: Text(
                                      "Event Information",
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
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                            Utils().nullSafeString(_liabilityFormModel!.wingname).isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Wing Name",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          FormBuilderTextField(
                                                            enabled: false,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _wingError = value!.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeWingName,
                                                            controller: _wingName,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_wingError == true)
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
                                                            name: 'wingName',
                                                          ),
                                                          (_wingError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please enter Wing Name!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(_liabilityFormModel!.event_details!.event_level)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Event Level",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      DropdownButton(
                                                        itemHeight: null,
                                                        isExpanded: true,
                                                        hint: Text('Choose Event Level'),
                                                        value: _selectedEventLevel == null ? null : _selectedEventLevel,
                                                        onChanged:
                                                            null /*(newValue) {
                                                  setState(() {
                                                    _selectedEventLevel = newValue as EventLevelModel;
                                                  });
                                                }*/
                                                        ,
                                                        items: _eventLevelItems!.map((item) {
                                                          return DropdownMenuItem(
                                                            child: new Text(
                                                                Utils().nullSafeString(item!.event_level_name).trim(),
                                                                overflow: TextOverflow.ellipsis,
                                                                style: TextStyle(
                                                                  fontSize: 10.8,
                                                                )),
                                                            value: item,
                                                          );
                                                        }).toList(),
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(_liabilityFormModel!.event_details!.event_title)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Event Name",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          FormBuilderTextField(
                                                            enabled: false,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _eventNameError = value!.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeEventName,
                                                            controller: _eventName,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_eventNameError == true)
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
                                                            name: 'eventName',
                                                          ),
                                                          (_eventNameError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please enter Event Name!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(
                                                        _liabilityFormModel!.event_details!.event_start_date)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Event Start Date",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          FormBuilderTextField(
                                                            name: 'eventStartDate',
                                                            enabled: false,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _eventStartDateError = value!.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeEventStartDate,
                                                            controller: _eventStartDate,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_eventStartDateError == true)
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
                                                          (_eventStartDateError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please choose Event Start Date!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(_liabilityFormModel!.event_details!.event_end_date)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Event End Date",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          FormBuilderTextField(
                                                            name: 'eventEndDate',
                                                            enabled: false,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _eventEndDateError = value!.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeEventEndDate,
                                                            controller: _eventEndDate,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_eventEndDateError == true)
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
                                                          (_eventEndDateError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please choose Event End Date!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(
                                                        _liabilityFormModel!.event_details!.early_reg_start_date)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Early Registration Start Date",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          FormBuilderTextField(
                                                            name: 'eventEarlyStartDate',

                                                            enabled: false,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _earlyRegistrationStartDateError = value!.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeEarlyRegistrationStartDate,
                                                            controller: _earlyRegistrationStartDate,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_earlyRegistrationStartDateError == true)
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
                                                          (_earlyRegistrationStartDateError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please choose Early Registration Start Date!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(_liabilityFormModel!.event_details!.reg_start_date)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Registration Start Date",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          FormBuilderTextField(
                                                            name: 'registrationStartDate',

                                                            enabled: false,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _registrationStartDateError = value!.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeRegistrationStartDate,
                                                            controller: _registrationStartDate,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_registrationStartDateError == true)
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
                                                          (_registrationStartDateError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please choose Registration Start Date!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(_liabilityFormModel!.event_details!.reg_end_date)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Registration End Date",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          TextField(
                                                            enabled: false,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _registrationEndDateError = value.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeRegistrationEndDate,
                                                            controller: _registrationEndDate,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_registrationEndDateError == true)
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
                                                          (_registrationEndDateError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please choose Registration End Date!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(
                                                        _liabilityFormModel!.event_details!.transportation_deadline)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Transportation Info Deadline",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          FormBuilderTextField(
                                                            name: 'transportationDeadline',

                                                            enabled: false,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _transportationInfoDeadlineError = value!.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeTransportationInfoDeadline,
                                                            controller: _transportationInfoDeadline,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_transportationInfoDeadlineError == true)
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
                                                          (_transportationInfoDeadlineError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please choose Transportation Info Deadline!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Utils()
                                                    .nullSafeString(
                                                        _liabilityFormModel!.event_details!.event_description)
                                                    .isNotEmpty
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Event Description",
                                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          FormBuilderTextField(
                                                            name: 'eventDescription',
                                                            enabled: false,
                                                            minLines: 3,
                                                            maxLines: 4,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _eventDescriptionError = value!.isEmpty;
                                                              });
                                                            },
                                                            textInputAction: TextInputAction.next,
                                                            keyboardType: TextInputType.name,
                                                            // focusNode: _focusNodeEventDescription,
                                                            controller: _eventDescription,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (_eventDescriptionError == true)
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
                                                          (_eventDescriptionError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(7.2),
                                                                          color: Color(0x1FEB5757),
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(3.6),
                                                                          child: Text(
                                                                            "Please enter Event Description!",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 13.68),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                          ])),
                                    ],
                                  )
                                : Container(),
                            (_liabilityFormModel != null &&
                                    _liabilityFormModel!.stayover_data != null &&
                                    _liabilityFormModel!.stayover_data!.length > 0 &&
                                    (Utils().nullSafeString(_liabilityFormModel!.event_details!.show_stayinfo) == "1"))
                                ? ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    title: Text(
                                      "StayOver Information",
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
                                            children:
                                                List.generate(_liabilityFormModel!.stayover_data!.length, (index) {
                                              var currentItem = _liabilityFormModel!.stayover_data![index]!;

                                              final TextEditingController _controllerStayOverName =
                                                  new TextEditingController();
                                              _controllerStayOverName.text =
                                                  Utils().nullSafeString(currentItem.stayover_name);
                                              _controllerStayOverName.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerStayOverName.text.length));

                                              final TextEditingController _controllerAddress =
                                                  new TextEditingController();
                                              _controllerAddress.text = Utils().nullSafeString(currentItem.address);
                                              _controllerAddress.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerAddress.text.length));

                                              final TextEditingController _controllerCity = new TextEditingController();
                                              _controllerCity.text = Utils().nullSafeString(currentItem.city);
                                              _controllerCity.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerCity.text.length));

                                              final TextEditingController _controllerZipCode =
                                                  new TextEditingController();
                                              _controllerZipCode.text = Utils().nullSafeString(currentItem.pincode);
                                              _controllerZipCode.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerZipCode.text.length));

                                              final TextEditingController _controllerRoom = new TextEditingController();
                                              _controllerRoom.text = Utils().nullSafeString(currentItem.rooms);
                                              _controllerRoom.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerRoom.text.length));

                                              final TextEditingController _controllerStayOverLocationType =
                                                  new TextEditingController();
                                              _controllerStayOverLocationType.text = _getStayOverLocationType(
                                                  Utils().nullSafeString(currentItem.stayover_location_type));
                                              _controllerStayOverLocationType.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerStayOverLocationType.text.length));

                                              var selectedStateItem;
                                              if (_liabilityFormModel!.states != null) {
                                                if (_liabilityFormModel!.states!.length > 0) {
                                                  final stateIndex = _liabilityFormModel!.states!
                                                      .indexWhere((element) => element!.id == currentItem.state);
                                                  if (stateIndex >= 0) {
                                                    selectedStateItem = _liabilityFormModel!.states![stateIndex];
                                                  }
                                                }
                                              } else {
                                                selectedStateItem = null;
                                              }

                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  Text(
                                                    "StayOver ${(index + 1)}",
                                                    style: TextStyle(
                                                        fontSize: 14.4,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 14.64,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 9),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        Text(
                                                          "StayOver Name",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'stayOverName',
                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerStayOverName,
                                                          decoration: InputDecoration(
                                                            suffixIcon: (Utils()
                                                                    .nullSafeString(currentItem.stayover_name)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "Address",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'address2',

                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerAddress,
                                                          decoration: InputDecoration(
                                                            suffixIcon:
                                                                (Utils().nullSafeString(currentItem.address).isEmpty)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "City",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'city',

                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerCity,
                                                          decoration: InputDecoration(
                                                            suffixIcon:
                                                                (Utils().nullSafeString(currentItem.city).isEmpty)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "State",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        DropdownButton(
                                                          itemHeight: null,
                                                          isExpanded: true,
                                                          hint: Text(
                                                            "State",
                                                            style: TextStyle(
                                                              fontSize: 12.6,
                                                            ),
                                                          ),
                                                          value: selectedStateItem,
                                                          onChanged: null,
                                                          items: _liabilityFormModel!.states!.map((item) {
                                                            return DropdownMenuItem(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                children: [
                                                                  Text(Utils().nullSafeString(item!.name).trim(),
                                                                      style: TextStyle(
                                                                        fontSize: 12.6,
                                                                      )),
                                                                ],
                                                              ),
                                                              value: item,
                                                            );
                                                          }).toList(),
                                                        ),
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "Zip/Postal Code",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'zipCode',

                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerZipCode,
                                                          decoration: InputDecoration(
                                                            suffixIcon:
                                                                (Utils().nullSafeString(currentItem.pincode).isEmpty)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "Room",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'room',
                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerRoom,
                                                          decoration: InputDecoration(
                                                            suffixIcon:
                                                                (Utils().nullSafeString(currentItem.rooms).isEmpty)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "Stay Over Location Type",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'stayOverLocationType',
                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerStayOverLocationType,
                                                          decoration: InputDecoration(
                                                            suffixIcon: (Utils()
                                                                    .nullSafeString(currentItem.stayover_location_type)
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
                                                      ],
                                                    ),
                                                  ),
                                                  (index != (_liabilityFormModel!.stayover_data!.length - 1))
                                                      ? SizedBox(
                                                          height: 29.28,
                                                        )
                                                      : Container(),
                                                ],
                                              );
                                            }),
                                          )),
                                    ],
                                  )
                                : Container(),
                            (_liabilityFormModel != null &&
                                    _liabilityFormModel!.outing_data != null &&
                                    _liabilityFormModel!.outing_data!.length > 0 &&
                                    (Utils().nullSafeString(_liabilityFormModel!.event_details!.show_outing) == "1"))
                                ? ExpansionTile(
                                    trailing: (_outingInformation)
                                        ? Icon(Icons.keyboard_arrow_down)
                                        : Icon(Icons.keyboard_arrow_up),
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    onExpansionChanged: (val) {
                                      setState(
                                        () {
                                          _outingInformation = val;
                                        },
                                      );
                                    },
                                    title: Text(
                                      "Outing Information",
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
                                            children: List.generate(_liabilityFormModel!.outing_data!.length, (index) {
                                              var currentItem = _liabilityFormModel!.outing_data![index]!;

                                              final TextEditingController _controllerOutingName =
                                                  new TextEditingController();
                                              _controllerOutingName.text =
                                                  Utils().nullSafeString(currentItem.outing_name);
                                              _controllerOutingName.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerOutingName.text.length));

                                              final TextEditingController _controllerAddress =
                                                  new TextEditingController();
                                              _controllerAddress.text = Utils().nullSafeString(currentItem.address);
                                              _controllerAddress.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerAddress.text.length));

                                              final TextEditingController _controllerCity = new TextEditingController();
                                              _controllerCity.text = Utils().nullSafeString(currentItem.city);
                                              _controllerCity.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerCity.text.length));

                                              final TextEditingController _controllerStartDate =
                                                  new TextEditingController();
                                              _controllerStartDate.text = Utils().changeDateFormatString(
                                                  Utils().nullSafeString(currentItem.outing_start_date),
                                                  Constant.defaultDateFormat,
                                                  Constant.defaultDateFormatWeb);
                                              _controllerStartDate.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerStartDate.text.length));

                                              final TextEditingController _controllerEndDate =
                                                  new TextEditingController();
                                              _controllerEndDate.text = Utils().changeDateFormatString(
                                                  Utils().nullSafeString(currentItem.outing_end_date),
                                                  Constant.defaultDateFormat,
                                                  Constant.defaultDateFormatWeb);
                                              _controllerEndDate.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerEndDate.text.length));

                                              final TextEditingController _controllerOutingDescription =
                                                  new TextEditingController();
                                              _controllerOutingDescription.text =
                                                  Utils().nullSafeString(currentItem.outing_description);
                                              _controllerOutingDescription.selection = TextSelection.fromPosition(
                                                  TextPosition(offset: _controllerOutingDescription.text.length));

                                              var selectedStateItem;
                                              if (_liabilityFormModel!.states != null) {
                                                if (_liabilityFormModel!.states!.length > 0) {
                                                  final stateIndex = _liabilityFormModel!.states!
                                                      .indexWhere((element) => element!.id == currentItem.state);
                                                  if (stateIndex >= 0) {
                                                    selectedStateItem = _liabilityFormModel!.states![stateIndex];
                                                  }
                                                }
                                              } else {
                                                selectedStateItem = null;
                                              }

                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  Text(
                                                    "Outing ${(index + 1)}",
                                                    style: TextStyle(
                                                        fontSize: 14.4,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 14.64,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 9),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        Text(
                                                          "Outing Name",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'outingName',

                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerOutingName,
                                                          decoration: InputDecoration(
                                                            suffixIcon: (Utils()
                                                                    .nullSafeString(currentItem.outing_name)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "Address",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'outingName',

                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerAddress,
                                                          decoration: InputDecoration(
                                                            suffixIcon:
                                                                (Utils().nullSafeString(currentItem.address).isEmpty)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "City",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'city2',
                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerCity,
                                                          decoration: InputDecoration(
                                                            suffixIcon:
                                                                (Utils().nullSafeString(currentItem.city).isEmpty)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "State",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        DropdownButton(
                                                          itemHeight: null,
                                                          isExpanded: true,
                                                          hint: Text(
                                                            "State",
                                                            style: TextStyle(
                                                              fontSize: 12.6,
                                                            ),
                                                          ),
                                                          value: selectedStateItem,
                                                          onChanged: null,
                                                          items: _liabilityFormModel!.states!.map((item) {
                                                            return DropdownMenuItem(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                children: [
                                                                  Text(Utils().nullSafeString(item!.name).trim(),
                                                                      style: TextStyle(
                                                                        fontSize: 12.6,
                                                                      )),
                                                                ],
                                                              ),
                                                              value: item,
                                                            );
                                                          }).toList(),
                                                        ),
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "Start Date",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'startDate2',
                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerStartDate,
                                                          decoration: InputDecoration(
                                                            suffixIcon: (Utils()
                                                                    .nullSafeString(currentItem.outing_start_date)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "End Date",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'endDate2',
                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerEndDate,
                                                          decoration: InputDecoration(
                                                            suffixIcon: (Utils()
                                                                    .nullSafeString(currentItem.outing_end_date)
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
                                                        SizedBox(
                                                          height: 14.64,
                                                        ),
                                                        Text(
                                                          "Outing Description",
                                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                        ),
                                                        FormBuilderTextField(
                                                          name: 'outingDescription',
                                                          enabled: (false),
                                                          onChanged: null,
                                                          textInputAction: TextInputAction.next,
                                                          keyboardType: TextInputType.text,
                                                          controller: _controllerOutingDescription,
                                                          decoration: InputDecoration(
                                                            suffixIcon: (Utils()
                                                                    .nullSafeString(currentItem.outing_description)
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
                                                      ],
                                                    ),
                                                  ),
                                                  (index != (_liabilityFormModel!.outing_data!.length - 1))
                                                      ? SizedBox(
                                                          height: 29.28,
                                                        )
                                                      : Container(),
                                                ],
                                              );
                                            }),
                                          )),
                                    ],
                                  )
                                : Container(),
                            SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.only(left: 14.4, right: 14.4, top: 14.4),
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                  },
                                  behavior: HitTestBehavior.deferToChild,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
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
                                                text: "Terms:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.black)),
                                            new TextSpan(
                                                text: "",
                                                style: new TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.66,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 14.4),
                                        child: Html(
                                          data: _liabilityFormModel != null
                                              ? Utils().nullSafeString(_liabilityFormModel!.event_description)
                                              : "",
                                          onLinkTap: (url, _, __, ___) {
                                            print("Opening $url...");

                                            launch(Utils().nullSafeString(url));
                                          },
                                          onImageTap: (src, _, __, ___) {
                                            print(src);
                                          },
                                          onImageError: (exception, stackTrace) {
                                            print(exception);
                                          },
                                          onCssParseError: (css, messages) {
                                            print("css that errored: $css");
                                            print("error messages:");
                                            messages.forEach((element) {
                                              print(element);
                                            });
                                          },
                                        ),
                                      ),
                                      (_initialBoxesItems != null)
                                          ? Container(
                                              margin: EdgeInsets.only(left: 10.8),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                                ..._initialBoxesItems!
                                                    .asMap()
                                                    .map((i, con) {
                                                      var currentItem = _initialBoxesItems![i];
                                                      // final TextEditingController _controller =
                                                      //     new TextEditingController();
                                                      // _controller.text = Utils().nullSafeString(currentItem!.value);
                                                      // _controller.selection = TextSelection.fromPosition(
                                                      //     TextPosition(offset: _controller.text.length));

                                                      return MapEntry(
                                                        i,
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            i != 0
                                                                ? SizedBox(
                                                                    height: 21.96,
                                                                  )
                                                                : Container(),
                                                            Container(
                                                              margin: EdgeInsets.only(left: getSecondStageMargin("")),
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
                                                                        text: Utils()
                                                                                .nullSafeString(currentItem!.content)
                                                                                .isEmpty
                                                                            ? Utils()
                                                                                .nullSafeString(currentItem.placeholder)
                                                                            : Utils()
                                                                                .nullSafeString(currentItem.content),
                                                                        style: Utils()
                                                                                .nullSafeString(currentItem.content)
                                                                                .isEmpty
                                                                            ? TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 14.4,
                                                                                color: _isViewMode
                                                                                    ? Colors.grey[600]
                                                                                    : Colors.black)
                                                                            : TextStyle(
                                                                                fontSize: 12.6, color: Colors.black)),
                                                                    new TextSpan(
                                                                        text: (!_isViewMode && currentItem.is_required!)
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
                                                              margin: EdgeInsets.only(left: getThirdStageMargin("")),
                                                              child: Column(
                                                                children: [
                                                                  FormBuilderTextField(
                                                                    name: getArrKey("htmlForm", i),
                                                                    validator:
                                                                        FormBuilderValidators.required(errorText: ""),
                                                                    textCapitalization: currentItem.is_caps!
                                                                        ? TextCapitalization.characters
                                                                        : TextCapitalization.none,
                                                                    enabled: (!_isViewMode),
                                                                    // onChanged: (value) {
                                                                    //   setState(() {
                                                                    //     _initialBoxesItems![index]!.value = value;
                                                                    //   });
                                                                    // },
                                                                    textInputAction: TextInputAction.next,
                                                                    keyboardType: TextInputType.text,
                                                                    maxLength: Utils().nullSafeWithDefaultInt(
                                                                        currentItem.max_length, 1000),
                                                                    //    controller: _controller,
                                                                    decoration: InputDecoration(
                                                                      hintText: Utils()
                                                                          .nullSafeString(currentItem.placeholder),
                                                                      suffixIcon: (!_isViewMode &&
                                                                              currentItem.is_required! &&
                                                                              Utils()
                                                                                  .nullSafeString(currentItem.value)
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
                                                                    // focusNode: _focusNodeGenerate,
                                                                  ),
                                                                  (!_isViewMode &&
                                                                          currentItem.is_required! &&
                                                                          Utils()
                                                                              .nullSafeString(currentItem.value)
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
                                                                                      "Please enter " +
                                                                                          Utils().nullSafeString(
                                                                                              currentItem.placeholder) +
                                                                                          ".",
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
                                                          ],
                                                        ),
                                                      );
                                                    })
                                                    .values
                                                    .toList(),
                                              ]
                                                  //  List.generate(_initialBoxesItems!.length, (index) {
                                                  //   // var currentItem = _initialBoxesItems![index];
                                                  //   // final TextEditingController _controller = new TextEditingController();
                                                  //   // _controller.text = Utils().nullSafeString(currentItem!.value);
                                                  //   // _controller.selection = TextSelection.fromPosition(
                                                  //   //     TextPosition(offset: _controller.text.length));
                                                  //
                                                  //   return Column(
                                                  //     mainAxisAlignment: MainAxisAlignment.start,
                                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                                  //     children: [
                                                  //       index != 0
                                                  //           ? SizedBox(
                                                  //               height: 21.96,
                                                  //             )
                                                  //           : Container(),
                                                  //       Container(
                                                  //         margin: EdgeInsets.only(left: getSecondStageMargin("")),
                                                  //         child: RichText(
                                                  //           text: new TextSpan(
                                                  //             // Note: Styles for TextSpans must be explicitly defined.
                                                  //             // Child text spans will inherit styles from parent
                                                  //             style: new TextStyle(
                                                  //               fontSize: 14.4,
                                                  //               color: Colors.black,
                                                  //             ),
                                                  //             children: <TextSpan>[
                                                  //               new TextSpan(
                                                  //                   text: Utils()
                                                  //                           .nullSafeString(currentItem.content)
                                                  //                           .isEmpty
                                                  //                       ? Utils().nullSafeString(currentItem.placeholder)
                                                  //                       : Utils().nullSafeString(currentItem.content),
                                                  //                   style: Utils()
                                                  //                           .nullSafeString(currentItem.content)
                                                  //                           .isEmpty
                                                  //                       ? TextStyle(
                                                  //                           fontWeight: FontWeight.bold,
                                                  //                           fontSize: 14.4,
                                                  //                           color: _isViewMode
                                                  //                               ? Colors.grey[600]
                                                  //                               : Colors.black)
                                                  //                       : TextStyle(
                                                  //                           fontSize: 12.6,
                                                  //                           color: Colors.black)),
                                                  //               new TextSpan(
                                                  //                   text: (!_isViewMode && currentItem.is_required!)
                                                  //                       ? "*"
                                                  //                       : "",
                                                  //                   style: new TextStyle(
                                                  //                       fontWeight: FontWeight.bold,
                                                  //                       fontSize: 14.4,
                                                  //                       color: Colors.red)),
                                                  //             ],
                                                  //           ),
                                                  //         ),
                                                  //       ),
                                                  //       Container(
                                                  //         margin: EdgeInsets.only(left: getThirdStageMargin("")),
                                                  //         child: Column(
                                                  //           children: [
                                                  //             FormBuilderTextField(
                                                  //               name: 'htmlForm${_initialBoxesItems!.length}',
                                                  //               textCapitalization: currentItem.is_caps!
                                                  //                   ? TextCapitalization.characters
                                                  //                   : TextCapitalization.none,
                                                  //               enabled: (!_isViewMode),
                                                  //               // onChanged: (value) {
                                                  //               //   setState(() {
                                                  //               //     _initialBoxesItems![index]!.value = value;
                                                  //               //   });
                                                  //               // },
                                                  //               textInputAction: TextInputAction.next,
                                                  //               keyboardType: TextInputType.text,
                                                  //               maxLength: Utils()
                                                  //                   .nullSafeWithDefaultInt(currentItem.max_length, 1000),
                                                  //               controller: _controller,
                                                  //               decoration: InputDecoration(
                                                  //                 hintText:
                                                  //                     Utils().nullSafeString(currentItem.placeholder),
                                                  //                 suffixIcon: (!_isViewMode &&
                                                  //                         currentItem.is_required! &&
                                                  //                         Utils()
                                                  //                             .nullSafeString(currentItem.value)
                                                  //                             .isEmpty)
                                                  //                     ? Padding(
                                                  //                         padding: EdgeInsets.only(
                                                  //                             left: 28.8),
                                                  //                         child: Icon(
                                                  //                           Icons.warning_amber_outlined,
                                                  //                           color: Colors.red,
                                                  //                           size: 18,
                                                  //                         ),
                                                  //                       )
                                                  //                     : SizedBox(),
                                                  //               ),
                                                  //               focusNode: _focusNodeGenerate,
                                                  //             ),
                                                  //             (!_isViewMode &&
                                                  //                     currentItem.is_required! &&
                                                  //                     Utils().nullSafeString(currentItem.value).isEmpty)
                                                  //                 ? Padding(
                                                  //                     padding: EdgeInsets.only(
                                                  //                         bottom: 7.2),
                                                  //                     child: Row(
                                                  //                       children: [
                                                  //                         Expanded(
                                                  //                           child: Container(
                                                  //                             decoration: BoxDecoration(
                                                  //                               borderRadius: BorderRadius.circular(
                                                  //                                   7.2),
                                                  //                               color: Color(0x1FEB5757),
                                                  //                             ),
                                                  //                             child: Padding(
                                                  //                               padding: EdgeInsets.all(
                                                  //                                   3.6),
                                                  //                               child: Text(
                                                  //                                 "Please enter " +
                                                  //                                     Utils().nullSafeString(
                                                  //                                         currentItem.placeholder) +
                                                  //                                     ".",
                                                  //                                 style: TextStyle(
                                                  //                                     color: Color(0xffEB5757),
                                                  //                                     fontSize: 10.8),
                                                  //                               ),
                                                  //                             ),
                                                  //                           ),
                                                  //                         ),
                                                  //                       ],
                                                  //                     ),
                                                  //                   )
                                                  //                 : SizedBox(),
                                                  //           ],
                                                  //         ),
                                                  //       ),
                                                  //       SizedBox(
                                                  //         7.32,
                                                  //       ),
                                                  //     ],
                                                  //   );
                                                  // }),
                                                  ),
                                            )
                                          : Container(),
                                      Container(
                                        margin: EdgeInsets.only(top: _isViewMode ? 0 : 14.4),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 3.6),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
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
                                                            text: "Signature",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14.4,
                                                                color: Colors.black)),
                                                        new TextSpan(
                                                            text: "*",
                                                            style: new TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14.4,
                                                                color: Colors.red)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.66,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor: Colors.white,
                                                        fillColor: MaterialStateProperty.resolveWith(getColor),
                                                        value: isLiabilityAccepted,
                                                        onChanged: _isViewMode
                                                            ? null
                                                            : (bool? value) {
                                                                setState(() {
                                                                  isLiabilityAccepted = value!;
                                                                });
                                                              },
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "I have read above waiver of claims and release of liability document.",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 10.8,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 14.4,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        FormBuilderTextField(
                                                          name: 'signature',
                                                          onChanged: (value) {
                                                            setState(() {
                                                              (value!.isEmpty)
                                                                  ? _signatureError = true
                                                                  : _signatureError = false;
                                                            });
                                                          },
                                                          textInputAction: TextInputAction.done,
                                                          keyboardType: TextInputType.name,
                                                          focusNode: _focusNodeSignature,
                                                          controller: _signature,
                                                          decoration: InputDecoration(
                                                            enabled: !_isViewMode,
                                                            hintText: "Electronic Signature",
                                                            border: OutlineInputBorder(),
                                                            suffixIcon: (_signatureError == true)
                                                                ? Padding(
                                                                    padding: EdgeInsets.only(left: 28.8, right: 7.2),
                                                                    child: Icon(
                                                                      Icons.warning_amber_outlined,
                                                                      color: Colors.red,
                                                                      size: 18,
                                                                    ),
                                                                  )
                                                                : SizedBox(),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        (_signatureError == true)
                                                            ? Padding(
                                                                padding: EdgeInsets.only(bottom: 7.2),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(7.2),
                                                                        color: Color(0x1FEB5757),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.all(3.6),
                                                                        child: Text(
                                                                          "Please add your Electronic Signature!",
                                                                          style: TextStyle(
                                                                              color: Color(0xffEB5757),
                                                                              fontSize: 13.68),
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
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: _isViewMode ? 36.6 : 146.4),
                                          ],
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
                                    top: 18,
                                    left: 21.6,
                                    right: 21.6,
                                    bottom: isKeyboardVisible ? 18 : 72,
                                  ),
                                  // width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateColor.resolveWith(
                                              (states) => /*_isUserSigned?*/ Color(0xff2F80ED) /*: Color(0xffBDBDBD)*/),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(9),
                                            ),
                                          ),
                                        ),
                                        onPressed: () async {
                                          bool visible = true;
                                          int? errorIndex;
                                          for (int i = 0; i <= _initialBoxesItems!.length; i++) {
                                            if (!(_formKey.currentState!.fields[getArrKey("htmlForm", i)]?.validate() ??
                                                true)) {
                                              visible = false;
                                              errorIndex = i;
                                              break;
                                            }
                                          }
                                          //      if (isInitialBoxesRequired()) {
                                          if (visible) {
                                            if (isLiabilityAccepted) {
                                              if (_signature.text.isNotEmpty) {
                                                _focusNodeSignature.unfocus();
                                                _signatureError = false;

                                                final _pref = await Preferences.getInstance();
                                                LoginModel? loginModel = await _pref.getToken();
                                                var submitLiabilityFormRequestModel = SubmitLiabilityFormRequestModel(
                                                  Utils().nullSafeString(loginModel!.login_user_type.toString()),
                                                  Utils().nullSafeString(loginModel.login_parent_type),
                                                  Utils().nullSafeInt(loginModel.bkms_id).toString(),
                                                  Utils().nullSafeString(_myEventItem.id.toString()),
                                                  Utils().nullSafeString(_myEventItem.user_type),
                                                  _signature.text.toString(),
                                                  isLiabilityAccepted ? "1" : "0",
                                                  (_initialBoxesItems != null && _initialBoxesItems!.length > 0)
                                                      ? Utils().nullSafeString(_formKey
                                                          .currentState?.fields[getArrKey("htmlForm", 0)]?.value)
                                                      : "",
                                                  (_initialBoxesItems != null && _initialBoxesItems!.length > 1)
                                                      ? Utils().nullSafeString(_formKey
                                                          .currentState?.fields[getArrKey("htmlForm", 1)]?.value)
                                                      : "",
                                                  (_initialBoxesItems != null && _initialBoxesItems!.length > 2)
                                                      ? Utils().nullSafeString(_formKey
                                                          .currentState?.fields[getArrKey("htmlForm", 2)]?.value)
                                                      : "",
                                                  (_initialBoxesItems != null && _initialBoxesItems!.length > 3)
                                                      ? Utils().nullSafeString(_formKey
                                                          .currentState?.fields[getArrKey("htmlForm", 3)]?.value)
                                                      : "",
                                                  (_initialBoxesItems != null && _initialBoxesItems!.length > 4)
                                                      ? Utils().nullSafeString(_formKey
                                                          .currentState?.fields[getArrKey("htmlForm", 4)]?.value)
                                                      : "",
                                                  (_initialBoxesItems != null && _initialBoxesItems!.length > 5)
                                                      ? Utils().nullSafeString(_formKey
                                                          .currentState?.fields[getArrKey("htmlForm", 5)]?.value)
                                                      : "",
                                                  (_initialBoxesItems != null && _initialBoxesItems!.length > 6)
                                                      ? Utils().nullSafeString(_formKey
                                                          .currentState?.fields[getArrKey("htmlForm", 6)]?.value)
                                                      : "",
                                                  (_initialBoxesItems != null && _initialBoxesItems!.length > 7)
                                                      ? Utils().nullSafeString(_formKey
                                                          .currentState?.fields[getArrKey("htmlForm", 7)]?.value)
                                                      : "",
                                                );

                                                setState(() {
                                                  _showLoadingIndicator();
                                                  BlocProvider.of<HomeBloc>(context).add(HomeEvent.submitLiabilityForm(
                                                    context,
                                                    submitLiabilityFormRequestModel,
                                                  ));
                                                });

                                                /*if (await Permission.storage.request().isGranted) {
    final data = await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ImageByteFormat.png);
    if (bytes != null) {
        var dir = await Utils().getPathToDownload();
        final file = await Utils().writeToFile(bytes, dir + "/sign_" + new DateTime.now().millisecondsSinceEpoch.toString() + "_" + _myEventItem.name.trim().replaceAll(" ", "_") + ".png");
        MultipartFile multiPartSignature =
        await MultipartFile.fromPath('signature', file.path);
        setState(() {
          _showLoadingIndicator();
          BlocProvider.of<HomeBloc>(context).
          add(HomeEvent.submitLiabilityForm(
              context,
              Utils().nullSafeString(_myEventItem.id.toString()),
              multiPartSignature));
        });
    }
  }*/
                                              } else {
                                                _signatureError = true;
                                                _focusNodeSignature.requestFocus();
                                              }
                                            } else {
                                              Utils().showToast(
                                                  "Please read and accept above waiver of claims and release of liability document.");
                                            }
                                          } else {
                                            if (errorIndex != null) {
                                              Scrollable.ensureVisible(
                                                _formKey
                                                    .currentState!.fields[getArrKey("htmlForm", errorIndex)]!.context,
                                                alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
                                              );
                                            }
                                          }
                                          //  }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10.8),
                                          child: Text(
                                            "Complete",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.white, fontSize: 14.4),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.32,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "Sign at bottom to complete form.",
                                              style: TextStyle(fontSize: 12.6),
                                            ),
                                          ),
                                        ],
                                      )
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

  //region FOR VALIDATE INITIAL BOX DATA IF REQUIRED
  // bool isInitialBoxesRequired() {
  //   bool isForError = false;
  //   String strValidationMessage = '';
  //   if (_liabilityFormModel != null && _liabilityFormModel!.is_intialbox) {
  //     for (int v = 0; v < _initialBoxesItems!.length; v++) {
  //       var item = _initialBoxesItems![v];
  //       if (item!.is_required! && Utils().nullSafeString(item.value).isEmpty) {
  //         isForError = true;
  //         strValidationMessage = "Please enter " + Utils().nullSafeString(item.placeholder) + ".";
  //       }
  //
  //       if (isForError) {
  //         break;
  //       }
  //     }
  //
  //     if (isForError) {
  //       Utils().showToast(strValidationMessage);
  //     }
  //   } else {
  //     isForError = false;
  //   }
  //   return !isForError;
  // }
//endregion
}

//region FOR GET STAY OVER LOCATION TYPE
String _getStayOverLocationType(String value) {
  String strStayOverLocationType = "Other";
  switch (value) {
    case "1":
      strStayOverLocationType = "Mandir Campus";
      break;
    case "2":
      strStayOverLocationType = "Personal Residence";
      break;
    case "3":
      strStayOverLocationType = "Hotel/Motel";
      break;
  }

  return strStayOverLocationType;
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
