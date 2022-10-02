import 'package:flutter/material.dart';
import 'package:flutter_app/models/event_detail.dart';
import 'package:flutter_app/models/event_register_details_model.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_app/presentation/homepage/component/registration_node.dart';
import 'package:flutter_app/presentation/homepage/innerpage/eventpage.dart';
import 'package:flutter_app/presentation/homepage/innerpage/liability_form.dart';
import 'package:flutter_app/presentation/homepage/innerpage/registrationFee.dart';
import 'package:flutter_app/presentation/homepage/innerpage/transportation_details_form.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vrouter/vrouter.dart';
import '../../../loader.dart';
import 'agile_form.dart';
import 'basic_registration_form.dart';
import 'check_in_qr_scan.dart';

class Registration extends StatefulWidget {
  static String id = "registration";
  static String path = "${EventPage.path}/$id";
  final MyEvent _myEventItem;
  final EventDetailModel? eventDetailModel;
  const Registration(this._myEventItem, this.eventDetailModel);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  EventRegisterDetailsModel? _eventRegisterDetailsModel;

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
    _showLoadingIndicator();
    BlocProvider.of<HomeBloc>(context)
        .add(HomeEvent.resisterDetails(context, Utils().nullSafeString(widget._myEventItem.id.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                resisterDetails: (eventRegisterDetailsModel) {
                  if (eventRegisterDetailsModel != null) {
                    _eventRegisterDetailsModel = eventRegisterDetailsModel;

                    //FOR UPDATE EVENT STATUS
                    BlocProvider.of<ParamsBloc>(context).add(SetEventRegistrationStatusValue(
                        Utils().nullSafeString(_eventRegisterDetailsModel!.registration_status)));
                  }
                },
                checkIn: (checkInModel) {
                  if (checkInModel != null) {
                    Navigator.pop(context);
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            // if (state is QrScanState) {
            //   // Barcode resultBarcode = state.barcode;
            //
            //   //API CALLING FOR SUBMIT QR CODE RESULT WHILE CHECK-IN
            //   _showLoadingIndicator();
            //   BlocProvider.of<HomeBloc>(context).add(HomeEvent.checkIn(
            //       context,
            //       Utils().nullSafeString(widget._myEventItem.id.toString()),
            //       _eventRegisterDetailsModel != null
            //           ? Utils().nullSafeString(_eventRegisterDetailsModel!.userevent_id)
            //           : "",
            //       Utils().nullSafeString(resultBarcode.code)));
            // }

            if (state is UpdateRegistrationStatusState) {
              _showLoadingIndicator();
              BlocProvider.of<HomeBloc>(context)
                  .add(HomeEvent.resisterDetails(context, Utils().nullSafeString(widget._myEventItem.id.toString())));
              /*switch (state.registrationType) {
                  case Constant.ertBasicRegistration:
                    _eventRegisterDetailsModel!.has_basic_registration =
                        Constant.erfsCOMPLETED;
                    _eventRegisterDetailsModel!.basic_registration_status = Constant.eCompleted;
                    break;

                  case Constant.ertLiabilityForm:
                    _eventRegisterDetailsModel!.liability_form_status =
                        Constant.eCompleted;
                    break;

                  case Constant.ertRegistrationFee:
                    _eventRegisterDetailsModel!.has_registration_fee =
                        Constant.erfsCOMPLETED;
                    _eventRegisterDetailsModel!.registration_fee_status =
                        Constant.eCompleted;
                    break;

                  case Constant.ertTransportationDetails:
                    _eventRegisterDetailsModel!.has_transportation =
                        Constant.erfsCOMPLETED;
                    _eventRegisterDetailsModel!.transportation_details_status =
                        Constant.eCompleted;
                    break;
                  case Constant.ertCheckIn:
                    _eventRegisterDetailsModel!.has_checked_in =
                        Constant.erfsCOMPLETED;
                    _eventRegisterDetailsModel!.checkin_status =
                        Constant.eCompleted;
                    break;
                }*/
            }
          },
        ),
      ],
      child: Stack(children: <Widget>[
        Container(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              top: 18,
              left: 14.4,
              right: 14.4,
            ),
            child: Column(
              children: [
                (_eventRegisterDetailsModel != null &&
                        Utils().nullSafeString(_eventRegisterDetailsModel!.has_basic_registration) ==
                            Constant.erssVISIBLE)
                    ? TimelineNode(
                        canView: true,
                        canEdit: false,
                        isLast: false,
                        title: "Basic Registration Details",
                        discription: _eventRegisterDetailsModel != null
                            ? Utils().nullSafeString(_eventRegisterDetailsModel!.basic_registration_description)
                            : "",
                        color: Colors.grey,
                        flag: _eventRegisterDetailsModel != null
                            ? Utils().nullSafeWithDefaultString(
                                _eventRegisterDetailsModel!.basic_registration_status, Constant.eNotReadyYet)
                            : Constant.eNotReadyYet,
                        bottonText: _getEventButtonText(
                            _eventRegisterDetailsModel != null
                                ? Utils().nullSafeString(_eventRegisterDetailsModel!.basic_registration_status)
                                : "",
                            false),
                        onTap: () {
                          MyEvent myEventItem = widget._myEventItem;
                          myEventItem.userevent_id = Utils().nullSafeString(_eventRegisterDetailsModel!.userevent_id);
                          myEventItem.basic_registration_status =
                              Utils().nullSafeString(_eventRegisterDetailsModel!.basic_registration_status);
                          BlocProvider.of<ParamsBloc>(context).add(SetEventValue(myEventItem));
                          VRouter.of(context).to(BasicRegistrationForm.id);
                        },
                        icon: "img/sort.png",
                      )
                    : Container(),
                TimelineNode(
                  canView: true,
                  canEdit: false,
                  isLast: false,
                  title: "Liability Form",
                  discription: _eventRegisterDetailsModel != null
                      ? Utils().nullSafeString(_eventRegisterDetailsModel!.liability_form_description)
                      : "",
                  color: Colors.grey,
                  flag: _eventRegisterDetailsModel != null
                      ? Utils().nullSafeWithDefaultString(
                          _eventRegisterDetailsModel!.liability_form_status, Constant.eNotReadyYet)
                      : Constant.eNotReadyYet,
                  bottonText: _getEventButtonText(
                      _eventRegisterDetailsModel != null
                          ? Utils().nullSafeString(_eventRegisterDetailsModel!.liability_form_status)
                          : "",
                      false),
                  onTap: () {
                    MyEvent myEventItem = widget._myEventItem;
                    myEventItem.userevent_id = Utils().nullSafeString(_eventRegisterDetailsModel!.userevent_id);
                    myEventItem.liability_form_status =
                        Utils().nullSafeString(_eventRegisterDetailsModel!.liability_form_status);
                    BlocProvider.of<ParamsBloc>(context).add(SetEventValue(myEventItem));
                    VRouter.of(context).to(LiabilityForm.id);
                  },
                  icon: "img/hart.png",
                ),
                (_eventRegisterDetailsModel != null &&
                        Utils().nullSafeString(_eventRegisterDetailsModel!.has_registration_fee) ==
                            Constant.erssVISIBLE)
                    ? TimelineNode(
                        canView: false,
                        canEdit: false,
                        isLast: false,
                        title: "Registration Fee",
                        discription: _eventRegisterDetailsModel != null
                            ? Utils().nullSafeString(_eventRegisterDetailsModel!.registration_fee_description)
                            : "",
                        color: Colors.grey,
                        flag: _eventRegisterDetailsModel != null
                            ? Utils().nullSafeWithDefaultString(
                                _eventRegisterDetailsModel!.registration_fee_status, Constant.eNotReadyYet)
                            : Constant.eNotReadyYet,
                        bottonText: _getEventButtonText(
                            _eventRegisterDetailsModel != null
                                ? Utils().nullSafeString(_eventRegisterDetailsModel!.registration_fee_status)
                                : "",
                            false),
                        onTap: () {
                          MyEvent myEventItem = widget._myEventItem;
                          myEventItem.userevent_id = Utils().nullSafeString(_eventRegisterDetailsModel!.userevent_id);
                          BlocProvider.of<ParamsBloc>(context).add(SetEventValue(myEventItem));
                          VRouter.of(context).to(RegistrationFee.id);
                        },
                        icon: "img/pay.png",
                      )
                    : Container(),
                (_eventRegisterDetailsModel != null &&
                        Utils().nullSafeString(_eventRegisterDetailsModel!.has_transportation) == Constant.erssVISIBLE)
                    ? TimelineNode(
                        canView: false,
                        canEdit: Utils().nullSafeWithDefaultString(
                                    _eventRegisterDetailsModel!.checkin_status, Constant.eNotReadyYet) ==
                                Constant.eCompleted
                            ? false
                            : true,
                        isLast: false,
                        title: "Transportation Details",
                        discription: _eventRegisterDetailsModel != null
                            ? Utils().nullSafeString(_eventRegisterDetailsModel!.transportation_details_description)
                            : "",
                        color: Colors.grey,
                        flag: _eventRegisterDetailsModel != null
                            ? Utils().nullSafeWithDefaultString(
                                _eventRegisterDetailsModel!.transportation_details_status, Constant.eNotReadyYet)
                            : Constant.eNotReadyYet,
                        bottonText: _getEventButtonText(
                            _eventRegisterDetailsModel != null
                                ? Utils().nullSafeString(_eventRegisterDetailsModel!.transportation_details_status)
                                : "",
                            true),
                        onTap: () {
                          MyEvent myEventItem = widget._myEventItem;
                          myEventItem.userevent_id = Utils().nullSafeString(_eventRegisterDetailsModel!.userevent_id);
                          BlocProvider.of<ParamsBloc>(context).add(SetEventValue(myEventItem));
                          VRouter.of(context).to(TransportationsDetailsForm.id);
                        },
                        icon: "img/page.png",
                      )
                    : Container(),
                (_eventRegisterDetailsModel != null &&
                        Utils().nullSafeString(_eventRegisterDetailsModel!.has_checked_in) == Constant.erssVISIBLE)
                    ? TimelineNode(
                        canView: false,
                        canEdit: false,
                        isLast: true,
                        title: "Check In",
                        discription: _eventRegisterDetailsModel != null
                            ? Utils().nullSafeString(_eventRegisterDetailsModel!.checkin_description)
                            : "",
                        color: Colors.grey,
                        flag: _eventRegisterDetailsModel != null
                            ? Utils().nullSafeWithDefaultString(
                                _eventRegisterDetailsModel!.checkin_status, Constant.eNotReadyYet)
                            : Constant.eNotReadyYet,
                        onTap: () {
                          VRouter.of(context).to(CheckInQRScan.id + "/${widget.eventDetailModel!.name}");
                        },
                        bottonText: _getEventButtonText(
                            _eventRegisterDetailsModel != null
                                ? Utils().nullSafeString(_eventRegisterDetailsModel!.checkin_status)
                                : "",
                            false),
                        icon: "img/done.png",
                      )
                    : Container(),
                SizedBox(height: 35),
              ],
            ),
          ),
        )),
        Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
      ]),
    );
  }

  //region FOR GET EVENT BUTTON STATUS
  String _getEventButtonText(String status, bool canEdit) {
    String strResult = '';

    switch (status) {
      case Constant.eNotReadyYet:
        strResult = '';
        break;

      case Constant.eReadyToBeCompleted:
        strResult = 'Complete';
        break;

      case Constant.eCompleted:
        if (canEdit) {
          strResult = 'Edit';
        } else {
          strResult = 'View';
        }
        break;
    }

    return strResult;
  }
//endregion
}
