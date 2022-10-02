import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/submit_transportation_details_request_model.dart';
import 'package:flutter_app/models/transportation_details_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../../loader.dart';
import '../../../preferences.dart';
import 'eventpage.dart';

class TransportationsDetailsForm extends StatefulWidget {
  static String id = "transportationsDetailsForm";
  static String path = "${EventPage.path}/$id";

  @override
  _TransportationsDetailsFormState createState() => _TransportationsDetailsFormState();
}

class _TransportationsDetailsFormState extends State<TransportationsDetailsForm> with TickerProviderStateMixin {
  late MyEvent _myEventItem;
  int? _transportId;
  TransportSelectedModel? _transportSelectedModel;

  bool arrivalInformation = true;
  bool departureInformation = true;

  TextEditingController _airline = TextEditingController();
  late FocusNode _focusNodeAirline;
  bool? airlineError;

  TextEditingController _flightNo = TextEditingController();
  late FocusNode _focusNodeFlightNo;
  bool? flightNoError;

  TextEditingController _departureAirline = TextEditingController();
  late FocusNode _departureFocusNodeAirline;
  bool? departureAirlineError;

  TextEditingController _departureFlightNo = TextEditingController();
  late FocusNode _departureFocusNodeFlightNo;
  bool? departureFlightNoError;

  List<TransportTypeModel?>? _transportationTypesItems;
  TransportTypeModel? _selectedTransportationsTypesItem;
  int _selectedArrivalTransportationType = 0;

  List<NeedPickUpModel?>? _needPickupItems;
  NeedPickUpModel? _selectedNeedPickupItem;

  List<OriginAirportModel?>? _originAirportItems;
  OriginAirportModel? _selectedOriginAirportItem;

  List<DestinationAirportModel?>? _destinationAirportItems;
  DestinationAirportModel? _selectedDestinationAirportItem;

  List<TransportTypeModel?>? _departureTransportationTypesItems;
  TransportTypeModel? _departureSelectedTransportationsTypesItem;
  int _selectedDepartureTransportationType = 0;

  List<NeedDropOffModel?>? _departureNeedDropOffItems;
  NeedDropOffModel? _departureSelectedNeedDropOffItem;

  List<OriginAirportModel?>? _departureOriginAirportItems;
  OriginAirportModel? _departureSelectedOriginAirportItem;

  List<DestinationAirportModel?>? _departureDestinationAirportItems;
  DestinationAirportModel? _departureSelectedDestinationAirportItem;

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  TimeOfDay departureSelectedTime = TimeOfDay.now();
  DateTime departureSelectedDate = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: child!);
        });

    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime.now(), lastDate: DateTime(3000, 1));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _departureSelectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: departureSelectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: child!);
        });
    if (picked != null && picked != departureSelectedTime)
      setState(() {
        departureSelectedTime = picked;
      });
  }

  Future<void> _departureSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: departureSelectedDate, firstDate: DateTime.now(), lastDate: DateTime(3000, 1));
    if (picked != null && picked != departureSelectedDate)
      setState(() {
        departureSelectedDate = picked;
      });
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
    _focusNodeAirline = FocusNode();
    _focusNodeFlightNo = FocusNode();
    _departureFocusNodeAirline = FocusNode();
    _departureFocusNodeFlightNo = FocusNode();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is EventState) {
      _myEventItem = paramsBloc.myEvent;
    }

    _showLoadingIndicator();
    BlocProvider.of<HomeBloc>(context).add(HomeEvent.transportationDetails(context,
        Utils().nullSafeString(_myEventItem.id.toString()), Utils().nullSafeString(_myEventItem.userevent_id)));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                transportationDetails: (transportationsDetailsModel) {
                  if (transportationsDetailsModel != null) {
                    _transportationTypesItems = transportationsDetailsModel.arrival_information.transport_type;
                    _needPickupItems = transportationsDetailsModel.arrival_information.need_pick_up;
                    _originAirportItems = transportationsDetailsModel.arrival_information.origin_airport;
                    _destinationAirportItems = transportationsDetailsModel.arrival_information.destination_airport;

                    _departureTransportationTypesItems =
                        transportationsDetailsModel.departure_information.transport_type;
                    _departureNeedDropOffItems = transportationsDetailsModel.departure_information.need_drop_off;
                    _departureOriginAirportItems = transportationsDetailsModel.departure_information.origin_airport;
                    _departureDestinationAirportItems =
                        transportationsDetailsModel.departure_information.destination_airport;

                    _transportId = transportationsDetailsModel.transport_id;
                    _transportSelectedModel = transportationsDetailsModel.transport_selected;

                    //FOR FILL PRESELECTED DATA IF SUBMITTED BY USER
                    if (_transportSelectedModel != null) {
                      //ARRIVAL INFORMATION
                      final aTransportationTypeIndex = _transportationTypesItems!.indexWhere((element) =>
                          element!.id.toString() ==
                          Utils().nullSafeString(_transportSelectedModel!.arrival_information.arrival_trans_type));
                      if (aTransportationTypeIndex >= 0) {
                        _selectedTransportationsTypesItem = _transportationTypesItems![aTransportationTypeIndex]!;
                        _selectedArrivalTransportationType = Utils().nullSafeInt(_selectedTransportationsTypesItem!.id);
                      }

                      final aNeedPickUpIndex = _needPickupItems!.indexWhere((element) =>
                          element!.id.toString() ==
                          Utils().nullSafeString(_transportSelectedModel!.arrival_information.need_pickup));
                      if (aNeedPickUpIndex >= 0) {
                        _selectedNeedPickupItem = _needPickupItems![aNeedPickUpIndex]!;
                      }

                      final aOriginAirportIndex = _originAirportItems!.indexWhere((element) =>
                          element!.id.toString() ==
                          Utils().nullSafeString(_transportSelectedModel!.arrival_information.origin_airport_id));
                      if (aOriginAirportIndex >= 0) {
                        _selectedOriginAirportItem = _originAirportItems![aOriginAirportIndex]!;
                      }

                      final aDestinationAirportIndex = _destinationAirportItems!.indexWhere((element) =>
                          element!.id.toString() ==
                          Utils().nullSafeString(
                              _transportSelectedModel!.arrival_information.arrival_destination_airport_id));
                      if (aDestinationAirportIndex >= 0) {
                        _selectedDestinationAirportItem = _destinationAirportItems![aDestinationAirportIndex]!;
                      }

                      _airline.text =
                          Utils().nullSafeString(_transportSelectedModel!.arrival_information.arrival_airline);
                      _flightNo.text =
                          Utils().nullSafeString(_transportSelectedModel!.arrival_information.arrival_flight_no);
                      selectedTime = Utils().stringToTimeOfDay(
                          Utils().nullSafeString(_transportSelectedModel!.arrival_information.arrival_time));
                      selectedDate = Utils().stringToDateTime(
                          Utils().nullSafeString(_transportSelectedModel!.arrival_information.arrival_date),
                          Constant.defaultDateFormat);

                      //DEPARTURE INFORMATION
                      final dTransportationTypeIndex = _departureTransportationTypesItems!.indexWhere((element) =>
                          element!.id.toString() ==
                          Utils().nullSafeString(_transportSelectedModel!.departure_information.departure_trans_type));
                      if (dTransportationTypeIndex >= 0) {
                        _departureSelectedTransportationsTypesItem =
                            _departureTransportationTypesItems![dTransportationTypeIndex]!;
                        _selectedDepartureTransportationType =
                            Utils().nullSafeInt(_departureSelectedTransportationsTypesItem!.id);
                      }

                      final dNeedPickUpIndex = _departureNeedDropOffItems!.indexWhere((element) =>
                          element!.id.toString() ==
                          Utils().nullSafeString(_transportSelectedModel!.departure_information.need_dropoff));
                      if (dNeedPickUpIndex >= 0) {
                        _departureSelectedNeedDropOffItem = _departureNeedDropOffItems![dNeedPickUpIndex]!;
                      }

                      final dOriginAirportIndex = _departureOriginAirportItems!.indexWhere((element) =>
                          element!.id.toString() ==
                          Utils().nullSafeString(
                              _transportSelectedModel!.departure_information.departure_origin_airport_id));
                      if (dOriginAirportIndex >= 0) {
                        _departureSelectedOriginAirportItem = _departureOriginAirportItems![dOriginAirportIndex]!;
                      }

                      final dDestinationAirportIndex = _departureDestinationAirportItems!.indexWhere((element) =>
                          element!.id.toString() ==
                          Utils().nullSafeString(_transportSelectedModel!.departure_information.destination_airport));
                      if (dDestinationAirportIndex >= 0) {
                        _departureSelectedDestinationAirportItem =
                            _departureDestinationAirportItems![dDestinationAirportIndex]!;
                      }

                      _departureAirline.text =
                          Utils().nullSafeString(_transportSelectedModel!.departure_information.departure_airline);
                      _departureFlightNo.text =
                          Utils().nullSafeString(_transportSelectedModel!.departure_information.departure_flight_no);
                      departureSelectedTime = Utils().stringToTimeOfDay(
                          Utils().nullSafeString(_transportSelectedModel!.departure_information.departure_time));
                      departureSelectedDate = Utils().stringToDateTime(
                          Utils().nullSafeString(_transportSelectedModel!.departure_information.departure_date),
                          Constant.defaultDateFormat);
                    }
                  }
                },
                submitTransportationDetails: (submitTransportationsDetailsModel) {
                  if (submitTransportationsDetailsModel != null) {
                    //FOR RETURN AFTER SUCCESSFULLY SUBMITTED TRANSPORTATIONS DATA
                    BlocProvider.of<ParamsBloc>(context)
                        .add(UpdateRegistrationStatusEvent(Constant.ertTransportationDetails));
                    Navigator.pop(context);
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: KeyboardVisibilityBuilder(
        builder: (p0, isKeyboardVisible) {
          return Stack(children: <Widget>[
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
                                        "Transportations Details",
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
                                  Utils().nullSafeString(_myEventItem.name),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              ExpansionTile(
                                trailing: (arrivalInformation)
                                    ? Icon(Icons.keyboard_arrow_down)
                                    : Icon(Icons.keyboard_arrow_up),
                                collapsedIconColor: Colors.black,
                                iconColor: Colors.black,
                                initiallyExpanded: true,
                                onExpansionChanged: (val) {
                                  setState(
                                    () {
                                      arrivalInformation = val;
                                    },
                                  );
                                },
                                title: Text(
                                  "Arrival Information",
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
                                      children: [
                                        Text(
                                          "Transportation Type",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        SizedBox(
                                          height: 0.732,
                                        ),
                                        _transportationTypesItems != null
                                            ? DropdownButton(
                                                itemHeight: null,
                                                isExpanded: true,
                                                hint: Text('Choose Transportation Types'),
                                                value: _selectedTransportationsTypesItem == null
                                                    ? null
                                                    : _selectedTransportationsTypesItem,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedTransportationsTypesItem = newValue as TransportTypeModel;
                                                    _selectedArrivalTransportationType =
                                                        Utils().nullSafeInt(_selectedTransportationsTypesItem!.id);
                                                  });
                                                },
                                                items: _transportationTypesItems!.map((item) {
                                                  return DropdownMenuItem(
                                                    child: new Text(Utils().nullSafeString(item!.name).trim(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.4,
                                                        )),
                                                    value: item,
                                                  );
                                                }).toList(),
                                              )
                                            : Container(height: 60),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Need Pick-Up",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        SizedBox(
                                          height: 0.732,
                                        ),
                                        _needPickupItems != null
                                            ? DropdownButton(
                                                itemHeight: null,
                                                isExpanded: true,
                                                hint: Text('Choose Pick-Up option'),
                                                value: _selectedNeedPickupItem == null ? null : _selectedNeedPickupItem,
                                                onChanged: _selectedArrivalTransportationType != Constant.ttFLYING
                                                    ? null
                                                    : (newValue) {
                                                        setState(() {
                                                          _selectedNeedPickupItem = newValue as NeedPickUpModel;
                                                        });
                                                      },
                                                items: _needPickupItems!.map((item) {
                                                  return DropdownMenuItem(
                                                    child: new Text(Utils().nullSafeString(item!.name).trim(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.4,
                                                        )),
                                                    value: item,
                                                  );
                                                }).toList(),
                                              )
                                            : Container(height: 60),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Origin Airport",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        SizedBox(
                                          height: 0.732,
                                        ),
                                        _originAirportItems != null
                                            ? DropdownButton(
                                                itemHeight: null,
                                                isExpanded: true,
                                                hint: Text('Choose Origin Airport'),
                                                value: _selectedOriginAirportItem == null
                                                    ? null
                                                    : _selectedOriginAirportItem,
                                                onChanged: _selectedArrivalTransportationType != Constant.ttFLYING
                                                    ? null
                                                    : (newValue) {
                                                        setState(() {
                                                          _selectedOriginAirportItem = newValue as OriginAirportModel;
                                                        });
                                                      },
                                                items: _originAirportItems!.map((item) {
                                                  return DropdownMenuItem(
                                                    child: new Text(Utils().nullSafeString(item!.name).trim(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.4,
                                                        )),
                                                    value: item,
                                                  );
                                                }).toList(),
                                              )
                                            : Container(height: 60),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Destination Airport",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        SizedBox(
                                          height: 0.732,
                                        ),
                                        _destinationAirportItems != null
                                            ? DropdownButton(
                                                itemHeight: null,
                                                isExpanded: true,
                                                hint: Text('Choose Destination Airport'),
                                                value: _selectedDestinationAirportItem == null
                                                    ? null
                                                    : _selectedDestinationAirportItem,
                                                onChanged: _selectedArrivalTransportationType != Constant.ttFLYING
                                                    ? null
                                                    : (newValue) {
                                                        setState(() {
                                                          _selectedDestinationAirportItem =
                                                              newValue as DestinationAirportModel;
                                                        });
                                                      },
                                                items: _destinationAirportItems!.map((item) {
                                                  return DropdownMenuItem(
                                                    child: new Text(Utils().nullSafeString(item!.name).trim(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.4,
                                                        )),
                                                    value: item,
                                                  );
                                                }).toList(),
                                              )
                                            : Container(height: 60),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Date",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        RaisedButton(
                                          onPressed: () => _selectDate(context),
                                          child: Text(Utils().changeDateFormat(selectedDate, "dd MMMM yyyy")),
                                        ),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Arrival Time",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        RaisedButton(
                                          onPressed: () => _selectTime(context),
                                          child: Text(Utils().formatTimeOfDay(selectedTime)),
                                        ),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Airline",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        Column(
                                          children: [
                                            TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  (value.isEmpty) ? airlineError = true : airlineError = false;
                                                });
                                              },
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.text,
                                              focusNode: _focusNodeAirline,
                                              controller: _airline,
                                              decoration: InputDecoration(
                                                suffixIcon: (airlineError == true)
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
                                            (airlineError == true)
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
                                                              "Please enter Airline Name!",
                                                              style:
                                                                  TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
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
                                        Text(
                                          "Flight No",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        Column(
                                          children: [
                                            TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  (value.isEmpty) ? flightNoError = true : flightNoError = false;
                                                });
                                              },
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.text,
                                              focusNode: _focusNodeFlightNo,
                                              controller: _flightNo,
                                              decoration: InputDecoration(
                                                suffixIcon: (flightNoError == true)
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
                                            (flightNoError == true)
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
                                                              "Please enter Flight number!",
                                                              style:
                                                                  TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
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
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                trailing: (departureInformation)
                                    ? Icon(Icons.keyboard_arrow_down)
                                    : Icon(Icons.keyboard_arrow_up),
                                collapsedIconColor: Colors.black,
                                iconColor: Colors.black,
                                initiallyExpanded: true,
                                onExpansionChanged: (val) {
                                  setState(
                                    () {
                                      departureInformation = val;
                                    },
                                  );
                                },
                                title: Text(
                                  "Departure Information",
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
                                      children: [
                                        Text(
                                          "Transportation Type",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        SizedBox(
                                          height: 0.732,
                                        ),
                                        _departureTransportationTypesItems != null
                                            ? DropdownButton(
                                                itemHeight: null,
                                                isExpanded: true,
                                                hint: Text('Choose Transportation Types'),
                                                value: _departureSelectedTransportationsTypesItem == null
                                                    ? null
                                                    : _departureSelectedTransportationsTypesItem,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _departureSelectedTransportationsTypesItem =
                                                        newValue as TransportTypeModel;
                                                    _selectedDepartureTransportationType = Utils()
                                                        .nullSafeInt(_departureSelectedTransportationsTypesItem!.id);
                                                  });
                                                },
                                                items: _departureTransportationTypesItems!.map((item) {
                                                  return DropdownMenuItem(
                                                    child: new Text(Utils().nullSafeString(item!.name).trim(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.4,
                                                        )),
                                                    value: item,
                                                  );
                                                }).toList(),
                                              )
                                            : Container(height: 60),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Need Drop-Off",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        SizedBox(
                                          height: 0.732,
                                        ),
                                        _departureNeedDropOffItems != null
                                            ? DropdownButton(
                                                itemHeight: null,
                                                isExpanded: true,
                                                hint: Text('Choose Drop-Off option'),
                                                value: _departureSelectedNeedDropOffItem == null
                                                    ? null
                                                    : _departureSelectedNeedDropOffItem,
                                                onChanged: _selectedDepartureTransportationType != Constant.ttFLYING
                                                    ? null
                                                    : (newValue) {
                                                        setState(() {
                                                          _departureSelectedNeedDropOffItem =
                                                              newValue as NeedDropOffModel;
                                                        });
                                                      },
                                                items: _departureNeedDropOffItems!.map((item) {
                                                  return DropdownMenuItem(
                                                    child: new Text(Utils().nullSafeString(item!.name).trim(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.4,
                                                        )),
                                                    value: item,
                                                  );
                                                }).toList(),
                                              )
                                            : Container(height: 60),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Origin Airport",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        SizedBox(
                                          height: 0.732,
                                        ),
                                        _departureOriginAirportItems != null
                                            ? DropdownButton(
                                                itemHeight: null,
                                                isExpanded: true,
                                                hint: Text('Choose Origin Airport'),
                                                value: _departureSelectedOriginAirportItem == null
                                                    ? null
                                                    : _departureSelectedOriginAirportItem,
                                                onChanged: _selectedDepartureTransportationType != Constant.ttFLYING
                                                    ? null
                                                    : (newValue) {
                                                        setState(() {
                                                          _departureSelectedOriginAirportItem =
                                                              newValue as OriginAirportModel;
                                                        });
                                                      },
                                                items: _departureOriginAirportItems!.map((item) {
                                                  return DropdownMenuItem(
                                                    child: new Text(Utils().nullSafeString(item!.name).trim(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.4,
                                                        )),
                                                    value: item,
                                                  );
                                                }).toList(),
                                              )
                                            : Container(height: 60),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Destination Airport",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        SizedBox(
                                          height: 0.732,
                                        ),
                                        _departureDestinationAirportItems != null
                                            ? DropdownButton(
                                                itemHeight: null,
                                                isExpanded: true,
                                                hint: Text('Choose Destination Airport'),
                                                value: _departureSelectedDestinationAirportItem == null
                                                    ? null
                                                    : _departureSelectedDestinationAirportItem,
                                                onChanged: _selectedDepartureTransportationType != Constant.ttFLYING
                                                    ? null
                                                    : (newValue) {
                                                        setState(() {
                                                          _departureSelectedDestinationAirportItem =
                                                              newValue as DestinationAirportModel;
                                                        });
                                                      },
                                                items: _departureDestinationAirportItems!.map((item) {
                                                  return DropdownMenuItem(
                                                    child: new Text(Utils().nullSafeString(item!.name).trim(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.4,
                                                        )),
                                                    value: item,
                                                  );
                                                }).toList(),
                                              )
                                            : Container(height: 60),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Date",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        RaisedButton(
                                          onPressed: () => _departureSelectDate(context),
                                          child: Text(Utils().changeDateFormat(departureSelectedDate, "dd MMMM yyyy")),
                                        ),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Destination Time",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        RaisedButton(
                                          onPressed: () => _departureSelectTime(context),
                                          child: Text(Utils().formatTimeOfDay(departureSelectedTime)),
                                        ),
                                        SizedBox(
                                          height: 14.64,
                                        ),
                                        Text(
                                          "Airline",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        Column(
                                          children: [
                                            TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  (value.isEmpty)
                                                      ? departureAirlineError = true
                                                      : departureAirlineError = false;
                                                });
                                              },
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.text,
                                              focusNode: _departureFocusNodeAirline,
                                              controller: _departureAirline,
                                              decoration: InputDecoration(
                                                suffixIcon: (departureAirlineError == true)
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
                                            (departureAirlineError == true)
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
                                                              "Please enter Airline Name!",
                                                              style:
                                                                  TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
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
                                        Text(
                                          "Flight No",
                                          style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                        ),
                                        Column(
                                          children: [
                                            TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  (value.isEmpty)
                                                      ? departureFlightNoError = true
                                                      : departureFlightNoError = false;
                                                });
                                              },
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.text,
                                              focusNode: _departureFocusNodeFlightNo,
                                              controller: _departureFlightNo,
                                              decoration: InputDecoration(
                                                suffixIcon: (departureFlightNoError == true)
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
                                            (departureFlightNoError == true)
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
                                                              "Please enter Flight number!",
                                                              style:
                                                                  TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
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
                                          height: 36.6,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 80.52,
                              )
                            ],
                          ),
                        ),
                      ],
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
                                    backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff2F80ED)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (validateArrivalTransportationsDetails() &&
                                        validateDepartureTransportationsDetails()) {
                                      _showLoadingIndicator();

                                      final _pref = await Preferences.getInstance();
                                      LoginModel? loginModel = await _pref.getToken();

                                      ArrivalInformationRequestModel arrivalInformationRequestModel =
                                          ArrivalInformationRequestModel(
                                        _selectedTransportationsTypesItem != null
                                            ? _selectedTransportationsTypesItem!.id.toString()
                                            : "",
                                        _selectedNeedPickupItem != null ? _selectedNeedPickupItem!.id.toString() : "",
                                        Utils().changeDateFormat(selectedDate, Constant.defaultDateFormatWeb),
                                        Utils().formatTimeOfDay(selectedTime),
                                        _selectedOriginAirportItem != null
                                            ? _selectedOriginAirportItem!.id.toString()
                                            : "",
                                        _selectedDestinationAirportItem != null
                                            ? _selectedDestinationAirportItem!.id.toString()
                                            : "",
                                        _airline.text,
                                        _flightNo.text,
                                      );
                                      DepartureInformationRequestModel departureInformationRequestModel =
                                          DepartureInformationRequestModel(
                                        _departureSelectedTransportationsTypesItem != null
                                            ? _departureSelectedTransportationsTypesItem!.id.toString()
                                            : "",
                                        _departureSelectedNeedDropOffItem != null
                                            ? _departureSelectedNeedDropOffItem!.id.toString()
                                            : "",
                                        _departureSelectedOriginAirportItem != null
                                            ? _departureSelectedOriginAirportItem!.id.toString()
                                            : "",
                                        _departureSelectedDestinationAirportItem != null
                                            ? _departureSelectedDestinationAirportItem!.id.toString()
                                            : "",
                                        Utils().changeDateFormat(departureSelectedDate, Constant.defaultDateFormatWeb),
                                        Utils().formatTimeOfDay(departureSelectedTime),
                                        _departureAirline.text,
                                        _departureFlightNo.text,
                                      );

                                      var submitTransportationDetailsRequestModel =
                                          SubmitTransportationDetailsRequestModel(
                                        Utils().nullSafeString(loginModel!.login_user_type.toString()),
                                        Utils().nullSafeString(loginModel.login_parent_type),
                                        Utils().nullSafeInt(loginModel.bkms_id).toString(),
                                        Utils().nullSafeString(_myEventItem.id.toString()),
                                        Utils().nullSafeString(_myEventItem.userevent_id),
                                        _transportId == null ? "" : _transportId.toString(),
                                        arrivalInformationRequestModel,
                                        departureInformationRequestModel,
                                      );

                                      setState(() {
                                        BlocProvider.of<HomeBloc>(context).add(HomeEvent.submitTransportationDetails(
                                            context, submitTransportationDetailsRequestModel));
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10.8),
                                    child: Text(
                                      _transportId == null ? "Submit" : "Update",
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

  //region FOR VALIDATE ARRIVAL TRANSPORTATIONS
  bool validateArrivalTransportationsDetails() {
    if (_selectedTransportationsTypesItem != null) {
      if (_selectedArrivalTransportationType == Constant.ttFLYING) {
        if (_selectedNeedPickupItem != null) {
          if (_selectedOriginAirportItem != null) {
            if (_selectedDestinationAirportItem != null) {
              if (_airline.text.isNotEmpty) {
                _focusNodeAirline.unfocus();
                airlineError = false;
                if (_flightNo.text.isNotEmpty) {
                  _focusNodeFlightNo.unfocus();
                  flightNoError = false;
                  return true;
                } else {
                  setState(() {
                    flightNoError = true;
                    _focusNodeFlightNo.requestFocus();
                  });
                }
              } else {
                setState(() {
                  airlineError = true;
                  _focusNodeAirline.requestFocus();
                });
              }
            } else {
              Utils().showToast('Please choose Arrival Destination Airport!');
            }
          } else {
            Utils().showToast('Please choose Arrival Origin Airport!');
          }
        } else {
          Utils().showToast('Please choose Arrival Pick-Up option!');
        }
      } else {
        return true;
      }
    } else {
      Utils().showToast('Please choose Arrival Transportation type!');
    }

    return false;
  }
  //endregion

  //region FOR VALIDATE DEPARTURE TRANSPORTATIONS
  bool validateDepartureTransportationsDetails() {
    if (_departureSelectedTransportationsTypesItem != null) {
      if (_selectedDepartureTransportationType == Constant.ttFLYING) {
        if (_departureSelectedNeedDropOffItem != null) {
          if (_departureSelectedOriginAirportItem != null) {
            if (_departureSelectedDestinationAirportItem != null) {
              if (_departureAirline.text.isNotEmpty) {
                _departureFocusNodeAirline.unfocus();
                departureAirlineError = false;
                if (_departureFlightNo.text.isNotEmpty) {
                  _departureFocusNodeFlightNo.unfocus();
                  departureFlightNoError = false;
                  return true;
                } else {
                  setState(() {
                    departureFlightNoError = true;
                    _departureFocusNodeFlightNo.requestFocus();
                  });
                }
              } else {
                setState(() {
                  departureAirlineError = true;
                  _departureFocusNodeAirline.requestFocus();
                });
              }
            } else {
              Utils().showToast('Please choose Departure Destination Airport!');
            }
          } else {
            Utils().showToast('Please choose Departure Origin Airport!');
          }
        } else {
          Utils().showToast('Please choose Departure Drop-Off option!');
        }
      } else {
        return true;
      }
    } else {
      Utils().showToast('Please choose Departure Transportation type!');
    }

    return false;
  }
  //endregion
}
