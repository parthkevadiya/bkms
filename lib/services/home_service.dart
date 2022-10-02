import 'package:flutter_app/api_calling_class/chopper_class.dart';
import 'package:flutter_app/models/basic_registration_form_request_model.dart';
import 'package:flutter_app/models/check_in_request_model.dart';
import 'package:flutter_app/models/event_payment_request_model.dart';
import 'package:flutter_app/models/event_register_details_request_model.dart';
import 'package:flutter_app/models/event_wont_be_attend_request_model.dart';
import 'package:flutter_app/models/home_request_model.dart';
import 'package:flutter_app/models/liability_form_request_model.dart';
import 'package:flutter_app/models/stripe_info_request_model.dart';
import 'package:flutter_app/models/submit_basic_registration_details_request_model.dart';
import 'package:flutter_app/models/submit_liability_form_request_model.dart';
import 'package:flutter_app/models/submit_transportation_details_request_model.dart';
import 'package:flutter_app/models/transportation_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class IHomeService {
  Future<dynamic> homeDetails(HomeRequestModel homeRequestModel, accessToken, context);
  Future<dynamic> resisterDetails(EventRegisterDetailsRequestModel eventRegisterDetailsRequestModel, accessToken, context);
  Future<dynamic> getLiabilityForm(LiabilityFormRequestModel liabilityFormRequestModel, accessToken, context);
  Future<dynamic> submitLiabilityForm(SubmitLiabilityFormRequestModel submitLiabilityFormRequestModel, accessToken, context);
  Future<dynamic> eventWontBeAttend(EventWontBeAttendRequestModel eventWontBeAttendRequestModel, accessToken, context);
  Future<dynamic> eventRegistrationPayment(EventPaymentRequestModel eventPaymentRequestModel, accessToken, context);
  Future<dynamic> basicRegistrationsDetails(BasicRegistrationFormRequestModel basicRegistrationFormRequestModel, accessToken, context);
  Future<dynamic> submitBasicRegistrationsDetails(List<SubmitBasicRegistrationDetailsRequestModel> submitBasicRegistrationDetailsRequestModel, accessToken, context);
  Future<dynamic> stripeInfo(StripeInfoRequestModel stripeInfoRequestModel, accessToken, context);
  Future<dynamic> transportationDetails(TransportationRequestModel transportationRequestModel, accessToken, context);
  Future<dynamic> submitTransportationDetails(SubmitTransportationDetailsRequestModel submitTransportationDetailsRequestModel, accessToken, context);
  Future<dynamic> checkIn(CheckInRequestModel checkInRequestModel, accessToken, context);
}

@Singleton(as: IHomeService)
class HomeService implements IHomeService {
  CommonChopperClass commonChopperClass = CommonChopperClass();

  @override
  Future<dynamic> homeDetails(homeRequestModel, accessToken, context) async {
    return await commonChopperClass.getHomeDetails(homeRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> resisterDetails(eventRegisterDetailsRequestModel, accessToken, context) async {
    return await commonChopperClass.getEventRegisterDetails(eventRegisterDetailsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> getLiabilityForm(liabilityFormRequestModel, accessToken, context) async {
    return await commonChopperClass.getLiabilityForm(liabilityFormRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitLiabilityForm(submitLiabilityFormRequestModel, accessToken, context) async {
    return await commonChopperClass.submitLiabilityForm(submitLiabilityFormRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> eventWontBeAttend(eventWontBeAttendRequestModel, accessToken, context) async {
    return await commonChopperClass.eventWontBeAttend(eventWontBeAttendRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> eventRegistrationPayment(eventPaymentRequestModel, accessToken, context) async {
    return await commonChopperClass.eventRegistrationPayment(eventPaymentRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> basicRegistrationsDetails(basicRegistrationFormRequestModel, accessToken, context) async {
    return await commonChopperClass.basicRegistrationsDetails(basicRegistrationFormRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitBasicRegistrationsDetails(submitBasicRegistrationDetailsRequestModel, accessToken, context) async {
    return await commonChopperClass.submitBasicRegistrationsDetails(submitBasicRegistrationDetailsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> stripeInfo(stripeInfoRequestModel, accessToken, context) async {
    return await commonChopperClass.stripeInfo(stripeInfoRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> transportationDetails(transportationRequestModel, accessToken, context) async {
    return await commonChopperClass.transportationDetails(transportationRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitTransportationDetails(submitTransportationDetailsRequestModel, accessToken, context) async {
    return await commonChopperClass.submitTransportationDetails(submitTransportationDetailsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> checkIn(checkInRequestModel, accessToken, context) async {
    return await commonChopperClass.checkIn(checkInRequestModel, accessToken, context);
  }
}