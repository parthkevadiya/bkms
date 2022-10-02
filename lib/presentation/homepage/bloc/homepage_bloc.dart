import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/basic_registration_form_model.dart';
import 'package:flutter_app/models/basic_registration_form_request_model.dart';
import 'package:flutter_app/models/check_in_model.dart';
import 'package:flutter_app/models/check_in_request_model.dart';
import 'package:flutter_app/models/event_payment_model.dart';
import 'package:flutter_app/models/event_payment_request_model.dart';
import 'package:flutter_app/models/event_register_details_model.dart';
import 'package:flutter_app/models/event_register_details_request_model.dart';
import 'package:flutter_app/models/event_wont_be_attend_model.dart';
import 'package:flutter_app/models/event_wont_be_attend_request_model.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/home_request_model.dart';
import 'package:flutter_app/models/liability_form_model.dart';
import 'package:flutter_app/models/liability_form_request_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/stripe_info_model.dart';
import 'package:flutter_app/models/stripe_info_request_model.dart';
import 'package:flutter_app/models/submit_basic_registration_details_request_model.dart';
import 'package:flutter_app/models/submit_basic_registrations_model.dart';
import 'package:flutter_app/models/submit_liability_form_model.dart';
import 'package:flutter_app/models/submit_liability_form_request_model.dart';
import 'package:flutter_app/models/submit_transportation_details_model.dart';
import 'package:flutter_app/models/submit_transportation_details_request_model.dart';
import 'package:flutter_app/models/transportation_details_model.dart';
import 'package:flutter_app/models/transportation_request_model.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:flutter_app/presentation/bloc/setting_bloc.dart';
import 'package:flutter_app/presentation/lifecycle/local_auth_api.dart';
import 'package:flutter_app/services/home_service.dart';
import 'package:flutter_app/services/user_profile_service.dart';
import 'package:flutter_app/utils/failure.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:move_to_background/move_to_background.dart';

import '../../../models/user_profile_request_model.dart';
import '../../../preferences.dart';

part 'homepage_bloc.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.load(HomeModel homeModel, LoadingStatus loadingStatus) = _HomeStateLoad;

  const factory HomeState.empty() = _HomeStateEmpty;
  const factory HomeState.loading() = _HomeStateLoading;
  const factory HomeState.error(Failure failure) = _HomeStateError;
  const factory HomeState.resisterDetails(EventRegisterDetailsModel? eventRegisterDetailsModel) =
      _HomeStateResisterDetails;
  const factory HomeState.getLiabilityForm(LiabilityFormModel liabilityFormModel, LoadingStatus loadingStatus) =
      _HomeStateGetLiabilityForm;
  const factory HomeState.submitLiabilityForm(SubmitLiabilityFormModel submitLiabilityFormModel) =
      _HomeStateSubmitLiabilityForm;
  const factory HomeState.eventWontBeAttend(
      EventWontBeAttendModel? eventWontBeAttendModel, LoadingStatus loadingStatus) = _HomeStateEventWontBeAttend;
  const factory HomeState.eventRegistrationPayment(EventPaymentModel eventPaymentModel) =
      _HomeStateEventRegistrationPayment;
  const factory HomeState.basicRegistrationsDetails(
          BasicRegistrationsFormModel? basicRegistrationsFormModel, LoadingStatus loadingState) =
      _HomeStateBasicRegistrationsDetails;
  const factory HomeState.submitBasicRegistrationsDetails(
          SubmitBasicRegistrationsModel? submitBasicRegistrationsModel, LoadingStatus loadingStatus) =
      _SubmitBasicRegistrationsDetails;
  const factory HomeState.stripeInfo(UserProfileModel userProfileModel, StripeInfoModel? stripeInfoModel) =
      _HomeStateStripeInfo;
  const factory HomeState.transportationDetails(TransportationsDetailsModel? transportationsDetailsModel) =
      _TransportationDetails;
  const factory HomeState.submitTransportationDetails(
      SubmitTransportationsDetailsModel? submitTransportationsDetailsModel) = _SubmitTransportationDetails;
  const factory HomeState.checkIn(CheckInModel? checkInModel) = _CheckIn;
}

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadload(BuildContext context) = _load;
  const factory HomeEvent.resisterDetails(BuildContext context, String eventId) = _resisterDetails;
  const factory HomeEvent.getLiabilityForm(
      BuildContext context, String eventId, String userevent_id, String event_user_type) = _getLiabilityForm;
  const factory HomeEvent.submitLiabilityForm(
      BuildContext context, SubmitLiabilityFormRequestModel submitLiabilityFormRequestModel) = _submitLiabilityForm;
  const factory HomeEvent.eventWontBeAttend(BuildContext context, String eventId) = _eventWontBeAttend;
  const factory HomeEvent.eventRegistrationPayment(
      BuildContext context, EventPaymentRequestModel eventPaymentRequestModel) = _eventRegistrationPayment;
  const factory HomeEvent.basicRegistrationsDetails(BuildContext context, String eventId, bool is_view_mode) =
      _basicRegistrationsDetails;
  const factory HomeEvent.submitBasicRegistrationsDetails(
          BuildContext context, List<SubmitBasicRegistrationDetailsRequestModel> submitBasicRegistrationRequestModel) =
      _submitBasicRegistrationsDetails;
  const factory HomeEvent.stripeInfo(BuildContext context, String eventId) = _stripeInfo;
  const factory HomeEvent.transportationDetails(BuildContext context, String eventId, String userevents_id) =
      _transportationDetails;
  const factory HomeEvent.submitTransportationDetails(
          BuildContext context, SubmitTransportationDetailsRequestModel submitTransportationDetailsRequestModel) =
      _submitTransportationDetails;
  const factory HomeEvent.checkIn(BuildContext context, String eventId, String userevents_id, String qrCodeResult) =
      _checkIn;
}

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IHomeService _iHomeService;
  IUserProfileService _profileService;
  StripeInfoModel? stripeInfoModel;
  UserProfileModel? userProfileModel;
  var check;
  HomeBloc(this._iHomeService, this._profileService)
      : super(HomeState.load(HomeModel.fromJson(Map<String, String>()), LoadingStatus.Initialized)) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        load: (context) async {
          if (GetIt.I<SettingBloc>().state.bio) {
            final _pref = await Preferences.getInstance();
            bool authGet = await _pref.getAuthDialog();
            if (authGet == true) {
              final authenticated = await LocalAuthApi.authenticate();
              check = authenticated.fold(
                (l) => InternalFailure(),
                (r) => r,
              );
              if (check == false) {
                MoveToBackground.moveTaskToBack();
              } else {
                await _pref.setAuthDialog(false);
              }
            }
          }
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(HomeState.loading());
          var homeRequestModel = HomeRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              Utils().nullSafeString(loginModel.role));
          final resp = await _iHomeService.homeDetails(
              homeRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (resp != null) {
            emit(HomeState.load(resp, LoadingStatus.Done));
          } else {
            emit(HomeState.empty());
          }
          // emit (HomeState.load(await _iHomeService.homeDe        tails(homeRequestModel,
          //     Utils().nullSafeString(loginModel.access_token), context)));
        },
        resisterDetails: (context, eventId) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var eventRegisterDetailsRequestModel = EventRegisterDetailsRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              eventId,
              Utils().nullSafeInt(loginModel.bkms_id).toString());
          emit(HomeState.resisterDetails(await _iHomeService.resisterDetails(
              eventRegisterDetailsRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
        getLiabilityForm: (context, eventId, userevent_id, event_user_type) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var liabilityFormRequestModel = LiabilityFormRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              eventId,
              userevent_id,
              event_user_type);
          final val = await _iHomeService.getLiabilityForm(
              liabilityFormRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(
              HomeState.getLiabilityForm(val, LoadingStatus.Done),
            );
          } else {
            emit(
              HomeState.getLiabilityForm(val, LoadingStatus.Error),
            );
          }
        },
        submitLiabilityForm: (context, submitLiabilityFormRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(HomeState.submitLiabilityForm(await _iHomeService.submitLiabilityForm(
              submitLiabilityFormRequestModel, Utils().nullSafeString(loginModel!.access_token), context)));
        },
        eventWontBeAttend: (context, eventId) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(HomeState.empty());
          var eventWontBeAttendRequestModel = EventWontBeAttendRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              eventId);
          final val = await _iHomeService.eventWontBeAttend(
              eventWontBeAttendRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(HomeState.eventWontBeAttend(val, LoadingStatus.Done));
          } else {
            emit(HomeState.eventWontBeAttend(val, LoadingStatus.Error));
          }
        },
        eventRegistrationPayment: (context, eventPaymentRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(HomeState.eventRegistrationPayment(await _iHomeService.eventRegistrationPayment(
              eventPaymentRequestModel, Utils().nullSafeString(loginModel!.access_token), context)));
        },
        basicRegistrationsDetails: (context, eventId, is_view_mode) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          emit(HomeState.empty());

          var basicRegistrationFormRequestModel = BasicRegistrationFormRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              eventId,
              is_view_mode);
          final val = await _iHomeService.basicRegistrationsDetails(
              basicRegistrationFormRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(HomeState.basicRegistrationsDetails(val, LoadingStatus.Done));
          } else {
            emit(HomeState.basicRegistrationsDetails(val, LoadingStatus.Error));
          }
        },
        submitBasicRegistrationsDetails: (context, submitBasicRegistrationRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(HomeState.empty());
          final val = await _iHomeService.submitBasicRegistrationsDetails(
              submitBasicRegistrationRequestModel, Utils().nullSafeString(loginModel!.access_token), context);
          if (val != null) {
            emit(HomeState.submitBasicRegistrationsDetails(val, LoadingStatus.Done));
          } else {
            emit(HomeState.submitBasicRegistrationsDetails(val, LoadingStatus.Error));
          }
        },
        stripeInfo: (context, eventId) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var stripeInfoRequestModel = StripeInfoRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              eventId);

          var userProfileRequestModel = UserProfileRequestModel(
              Utils().nullSafeString(loginModel.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              "");

          final resp = await Future.wait([
            _profileService.load(userProfileRequestModel, Utils().nullSafeString(loginModel.access_token), context),
            _iHomeService.stripeInfo(stripeInfoRequestModel, Utils().nullSafeString(loginModel.access_token), context),
          ]);
          userProfileModel = resp[0];
          stripeInfoModel = resp[1];
          if (userProfileModel != null && stripeInfoModel != null) {
            emit(
              HomeState.stripeInfo(userProfileModel!, stripeInfoModel),
            );
          } else {
            emit(HomeState.empty());
          }
        },
        transportationDetails: (context, eventId, userevent_id) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var transportationRequestModel = TransportationRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              eventId,
              userevent_id);
          emit(HomeState.transportationDetails(await _iHomeService.transportationDetails(
              transportationRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
        submitTransportationDetails: (context, submitTransportationDetailsRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(HomeState.submitTransportationDetails(await _iHomeService.submitTransportationDetails(
              submitTransportationDetailsRequestModel, Utils().nullSafeString(loginModel!.access_token), context)));
        },
        checkIn: (context, eventId, userevent_id, qrCodeResult) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var checkInRequestModel = CheckInRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              eventId,
              userevent_id,
              qrCodeResult);
          emit(HomeState.checkIn(await _iHomeService.checkIn(
              checkInRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
      );
    });
  }

  // @override
  // Stream<HomeState> mapEventToState(HomeEvent event) async {
  //
  // }
}
