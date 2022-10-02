import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/models/add_1_on_1_mentoring_form_request_model.dart';
import 'package:flutter_app/models/add_1on1_mentoring_form_model.dart';
import 'package:flutter_app/models/add_education_mentoring_form_model.dart';
import 'package:flutter_app/models/add_education_mentoring_form_request_model.dart';
import 'package:flutter_app/models/bst_report_request_model.dart';
import 'package:flutter_app/models/campus_hangout_details_request_model.dart';
import 'package:flutter_app/models/campus_hangout_region_model.dart';
import 'package:flutter_app/models/campus_hangout_region_request_model.dart';
import 'package:flutter_app/models/campus_hangout_report_details_model.dart';
import 'package:flutter_app/models/campus_hangout_request_model.dart';
import 'package:flutter_app/models/campus_wise_hangout_types_model.dart';
import 'package:flutter_app/models/campus_wise_hangout_types_request_model.dart';
import 'package:flutter_app/models/center_wise_interaction_model.dart';
import 'package:flutter_app/models/center_wise_interaction_request_model.dart';
import 'package:flutter_app/models/create_all_bst_report_model.dart';
import 'package:flutter_app/models/create_all_bst_report_request_model.dart';
import 'package:flutter_app/models/create_all_kst_report_model.dart';
import 'package:flutter_app/models/create_all_kst_report_request_model.dart';
import 'package:flutter_app/models/create_campus_hangout_report_model.dart';
import 'package:flutter_app/models/create_campus_hangout_report_request_model.dart';
import 'package:flutter_app/models/create_center_bst_report_model.dart';
import 'package:flutter_app/models/create_center_bst_report_request_model.dart';
import 'package:flutter_app/models/create_interaction_details_model.dart';
import 'package:flutter_app/models/create_interaction_details_request_model.dart';
import 'package:flutter_app/models/education_mentoring_interaction_details_model.dart';
import 'package:flutter_app/models/education_mentoring_interaction_details_request_model.dart';
import 'package:flutter_app/models/event_detail.dart';
import 'package:flutter_app/models/event_detail_request.dart';
import 'package:flutter_app/models/export_record_model.dart';
import 'package:flutter_app/models/get_bst_wing_name_model.dart';
import 'package:flutter_app/models/get_bst_wing_name_request_model.dart';
import 'package:flutter_app/models/goshthi_report_attendance_model.dart';
import 'package:flutter_app/models/goshthi_report_attendance_request_model.dart';
import 'package:flutter_app/models/goshthi_report_request_model.dart';
import 'package:flutter_app/models/h_region_wise_campus_model.dart';
import 'package:flutter_app/models/h_region_wise_campus_request_model.dart';
import 'package:flutter_app/models/hangout_type_wise_questions_model.dart';
import 'package:flutter_app/models/hangout_type_wise_questions_request_model.dart';
import 'package:flutter_app/models/interaction_wise_questions_model.dart';
import 'package:flutter_app/models/interaction_wise_questions_request_model.dart';
import 'package:flutter_app/models/k1On1_mentoring_interaction_details_model.dart';
import 'package:flutter_app/models/k1On1_mentoring_interaction_details_request_model.dart';
import 'package:flutter_app/models/kst_1On1_mentoring_list_request_model.dart';
import 'package:flutter_app/models/kst_1on1_mentoring_list_model.dart';
import 'package:flutter_app/models/kst_education_mentoring_list_model.dart';
import 'package:flutter_app/models/kst_education_mentoring_list_request_model.dart';
import 'package:flutter_app/models/kst_report_request_model.dart';
import 'package:flutter_app/models/load_notifications_request_model.dart';
import 'package:flutter_app/models/manage_bst_attendance_model.dart';
import 'package:flutter_app/models/manage_bst_attendance_request_model.dart';
import 'package:flutter_app/models/manage_bst_niyam_assesment_model.dart';
import 'package:flutter_app/models/manage_bst_niyam_assesment_request_model.dart';
import 'package:flutter_app/models/manage_bst_quiz_score_model.dart';
import 'package:flutter_app/models/manage_bst_quiz_score_request_model.dart';
import 'package:flutter_app/models/manage_bst_report_model.dart';
import 'package:flutter_app/models/manage_bst_report_request_model.dart';
import 'package:flutter_app/models/manage_kst_attendance_model.dart';
import 'package:flutter_app/models/manage_kst_attendance_request_model.dart';
import 'package:flutter_app/models/manage_kst_quiz_score_model.dart';
import 'package:flutter_app/models/manage_kst_quiz_score_request_model.dart';
import 'package:flutter_app/models/manage_kst_report_model.dart';
import 'package:flutter_app/models/manage_kst_report_request_model.dart';
import 'package:flutter_app/models/networking_interaction_details_model.dart';
import 'package:flutter_app/models/networking_interaction_details_request_model.dart';
import 'package:flutter_app/models/networking_interaction_log_model.dart';
import 'package:flutter_app/models/networking_interaction_log_request_model.dart';
import 'package:flutter_app/models/networking_report_request_model.dart';
import 'package:flutter_app/models/notification_model.dart';
import 'package:flutter_app/models/read_notification_model.dart';
import 'package:flutter_app/models/read_notification_request_model.dart';
import 'package:flutter_app/models/region_wise_campus_model.dart';
import 'package:flutter_app/models/region_wise_campus_request_model.dart';
import 'package:flutter_app/models/report_request_model.dart';
import 'package:flutter_app/models/sabha_report_attendance_model.dart';
import 'package:flutter_app/models/sabha_report_attendance_request_model.dart';
import 'package:flutter_app/models/sabha_report_questions_model.dart';
import 'package:flutter_app/models/sabha_report_questions_request_model.dart';
import 'package:flutter_app/models/sabha_sabha_report_attendance_request_model.dart';
import 'package:flutter_app/models/save_bst_quiz_score_model.dart';
import 'package:flutter_app/models/save_bst_quiz_score_request_model.dart';
import 'package:flutter_app/models/save_kst_quiz_score_model.dart';
import 'package:flutter_app/models/save_kst_quiz_score_request_model.dart';
import 'package:flutter_app/models/submit_basic_registration_details_request_model.dart';
import 'package:flutter_app/models/submit_basic_registrations_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_attendance_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_attendance_request_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_report_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_report_request_model.dart';
import 'package:flutter_app/models/submit_goshthi_report_attendance_model.dart';
import 'package:flutter_app/models/submit_goshthi_report_attendance_request_model.dart';
import 'package:flutter_app/models/submit_interaction_questions_request_model.dart';
import 'package:flutter_app/models/submit_interactions_questions_details_model.dart';
import 'package:flutter_app/models/submit_sabha_report_attendance_model.dart';
import 'package:flutter_app/models/submit_sabha_report_questions_model.dart';
import 'package:flutter_app/models/submit_sabha_report_request_model.dart';
import 'package:flutter_app/models/take_bst_attendance_model.dart';
import 'package:flutter_app/models/take_bst_attendance_request_model.dart';
import 'package:flutter_app/models/take_campus_hangout_attendance_model.dart';
import 'package:flutter_app/models/take_campus_hangout_attendance_request_model.dart';
import 'package:flutter_app/models/take_kst_attendance_model.dart';
import 'package:flutter_app/models/take_kst_attendance_request_model.dart';
import 'package:flutter_app/models/update_bst_niyam_assesment_score_model.dart';
import 'package:flutter_app/models/update_bst_niyam_assesment_score_request_model.dart';
import 'package:flutter_app/models/update_goshthi_held_status_model.dart';
import 'package:flutter_app/models/update_goshthi_held_status_request_model.dart';
import 'package:flutter_app/models/user_group_wise_sub_group_model.dart';
import 'package:flutter_app/models/user_group_wise_sub_group_request_model.dart';
import 'package:flutter_app/models/view_hangout_report_model.dart';
import 'package:flutter_app/models/view_hangout_report_request_model.dart';
import 'package:flutter_app/models/view_network_report_list_model.dart';
import 'package:flutter_app/models/view_networking_report_list_request_model.dart';
import 'package:flutter_app/presentation/reports_page/bst_report_model.dart';
import 'package:flutter_app/presentation/reports_page/campus_hangout_model.dart';
import 'package:flutter_app/presentation/reports_page/goshthi_report_model.dart';
import 'package:flutter_app/presentation/reports_page/kst_report_model.dart';
import 'package:flutter_app/presentation/reports_page/networking_report_model.dart';
import 'package:flutter_app/presentation/reports_page/report_model.dart';
import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api_calling_class/bkms_chopper_client.dart';
import 'package:flutter_app/models/add_new_record_model.dart';
import 'package:flutter_app/models/add_new_record_request_model.dart';
import 'package:flutter_app/models/basic_registration_form_model.dart';
import 'package:flutter_app/models/basic_registration_form_request_model.dart';
import 'package:flutter_app/models/check_in_model.dart';
import 'package:flutter_app/models/check_in_request_model.dart';
import 'package:flutter_app/models/deactivate_user_model.dart';
import 'package:flutter_app/models/deactivate_user_request_model.dart';
import 'package:flutter_app/models/event_payment_model.dart';
import 'package:flutter_app/models/event_payment_request_model.dart';
import 'package:flutter_app/models/event_register_details_model.dart';
import 'package:flutter_app/models/event_register_details_request_model.dart';
import 'package:flutter_app/models/event_wont_be_attend_model.dart';
import 'package:flutter_app/models/event_wont_be_attend_request_model.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/forgot_password_model.dart';
import 'package:flutter_app/models/forgot_password_request_model.dart';
import 'package:flutter_app/models/collect_filters_request_model.dart';
import 'package:flutter_app/models/home_request_model.dart';
import 'package:flutter_app/models/liability_form_model.dart';
import 'package:flutter_app/models/liability_form_request_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/login_request_model.dart';
import 'package:flutter_app/models/record_request_model.dart';
import 'package:flutter_app/models/refresh_token_model.dart';
import 'package:flutter_app/models/refresh_token_request_model.dart';
import 'package:flutter_app/models/reset_password_model.dart';
import 'package:flutter_app/models/reset_password_request_model.dart';
import 'package:flutter_app/models/standardErrorResponse.dart';
import 'package:flutter_app/models/standardResponse.dart';
import 'package:flutter_app/models/stripe_info_model.dart';
import 'package:flutter_app/models/stripe_info_request_model.dart';
import 'package:flutter_app/models/submit_liability_form_model.dart';
import 'package:flutter_app/models/submit_liability_form_request_model.dart';
import 'package:flutter_app/models/submit_transportation_details_model.dart';
import 'package:flutter_app/models/submit_transportation_details_request_model.dart';
import 'package:flutter_app/models/transportation_details_model.dart';
import 'package:flutter_app/models/transportation_request_model.dart';
import 'package:flutter_app/models/update_profile_model.dart';
import 'package:flutter_app/models/update_profile_request_model.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:flutter_app/models/user_profile_request_model.dart';
import 'package:flutter_app/preferences.dart';
import 'package:flutter_app/presentation/auth/auth_bloc.dart';
import 'package:flutter_app/presentation/login/login.dart';
import 'package:flutter_app/presentation/records_page/record_model.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vrouter/vrouter.dart';

import '../models/remote_config.dart';

class CommonChopperClass {
  ChopperClient? chopper;
  RemoteConfigModel? remoteConfigModel;
  final Logger _logger = Logger();
  printResponse(Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      if (LogConstants.responseData) {
        _logger.d(response.body, null, StackTrace.empty);
      }
    } else {
      if (LogConstants.rawResponseData) {
        _logger.d(response.error, null, StackTrace.empty);
      }
    }
  }

  CommonChopperClass() {
    chopper = ChopperClient(
      interceptors: [
        if (LogConstants.api)
          (Request request) async {
            _logger.i(
                request.baseUrl +
                    request.url +
                    (request.body != null ? "\nbody : ${request.body}" : "") +
                    (request.parameters.isNotEmpty ? "\nparams : ${request.parameters}" : "") +
                    (LogConstants.header ? "\nheader : ${request.headers}" : ""),
                null,
                StackTrace.empty);
            return request;
          }
      ],
      baseUrl: Constant.BASE_URL,
      services: [
        HttpChopperBkmsClient.create(ChopperClient()),
      ],
      converter: JsonConverter(),
    );
  }

  Future<dynamic> getLogin(LoginRequestModel loginRequestModel) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.getLogin(loginRequestModel);

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        LoginModel loginModel = LoginModel.fromJson(standardResponse.data);
        print(response.body);
        return loginModel;
      } else {
        StandardErrorResponse standardErrorResponse =
            StandardErrorResponse.fromJson(jsonDecode(response.error.toString()));
        return standardErrorResponse.message;
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    } on Exception {
      Utils().showToast("Something is wrong please try again later");
    }
  }

  Future<dynamic> refreshToken(
      RefreshTokenRequestModel refreshTokenRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.refreshToken(refreshTokenRequestModel, 'bearer $token');
      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        RefreshTokenModel refreshTokenModel = RefreshTokenModel.fromJson(standardResponse.data);
        return refreshTokenModel;
      } else {
        handleErrorResponseForRefreshToken(context, response.error);
        return null;
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> forgotPassword(ForgotPasswordRequestModel forgotPasswordRequestModel) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.forgotPassword(forgotPasswordRequestModel);
      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel.fromJson(standardResponse.data);
        if (LogConstants.responseData) {
          _logger.d(forgotPasswordModel, null, StackTrace.empty);
        }
        Utils().showToast(standardResponse.message);
        return forgotPasswordModel;
      } else {
        if (response.error != null) {
          StandardResponse _standardResponse = StandardResponse.fromJson(jsonDecode(response.error!.toString()));

          if (_standardResponse.message != "") {
            return _standardResponse.message;
          } else {
            return 'Something went wrong, Please try again!';
          }
        } else {
          return 'Something went wrong, Please try again!';
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.resetPassword(resetPasswordRequestModel);
      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ResetPasswordModel resetPasswordModel = ResetPasswordModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return resetPasswordModel;
      }
      return 'Something went wrong, Please try again!';
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> userProfile(
      UserProfileRequestModel userProfileRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.userProfile(userProfileRequestModel, 'bearer $token');
      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        UserProfileModel userProfileModel = UserProfileModel.fromJson(standardResponse.data);
        print("=====${response.body}======");

        return userProfileModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return userProfile(userProfileRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> eventDetail(
      EventDetailRequestModel eventDetailRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.eventDetail(eventDetailRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        EventDetailModel eventDetailModel = EventDetailModel.fromJson(standardResponse.data);
        print("=====${response.body}======");

        return eventDetailModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return eventDetail(eventDetailRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> updateProfile(
      UpdateProfileRequestModel updateProfileRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.updateProfile(updateProfileRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        UpdateProfileModel updateProfileModel = UpdateProfileModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return updateProfileModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return updateProfile(updateProfileRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> addNewRecord(
      AddNewRecordRequestModel addNewRecordRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.addNewRecord(addNewRecordRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        AddNewRecordModel addNewRecordModel = AddNewRecordModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return addNewRecordModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return addNewRecord(addNewRecordRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> userWiseGroup(UserWiseGroupRequest userWiseGroupRequest, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.userWiseGroup(userWiseGroupRequest, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        UserWiseGroup userWiseGroup = UserWiseGroup.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return userWiseGroup;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return userWiseGroup(userWiseGroupRequest, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> deactivateUser(
      DeactivateUserRequestModel deactivateUserRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.deactivateUser(deactivateUserRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        DeactivateUserModel deactivateUserModel = DeactivateUserModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return deactivateUserModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return deactivateUser(deactivateUserRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> getRecords(RecordRequestModel recordRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.getRecords(recordRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        RecordModel recordModel = RecordModel.fromJson(standardResponse.data);
        print(response.body);
        return recordModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return getRecords(recordRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> getExportRecords(RecordRequestModel recordRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.getRecords(recordRequestModel, 'bearer $token');
      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        RecordModel recordModel = RecordModel.fromJson(standardResponse.data);
        return recordModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return getExportRecords(recordRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> getHomeDetails(HomeRequestModel homeRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.getHomeDetails(homeRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        if (standardResponse.data != null) {
          HomeModel homeModel = HomeModel.fromJson(standardResponse.data);
          print(response.body);
          return homeModel;
        }
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return getHomeDetails(homeRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> loadReports(ReportRequestModel reportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.loadReports(reportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ReportModel reportModel = ReportModel.fromJson(standardResponse.data);
        print(response.body);
        return reportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return loadReports(reportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> loadNetworkingReports(
      NetworkingReportRequestModel networkingReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.loadNetworkingReports(networkingReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        NetworkingReportModel networkingReportModel = NetworkingReportModel.fromJson(standardResponse.data);
        print(response.body);
        return networkingReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return loadNetworkingReports(networkingReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> loadBSTReports(
      BSTReportRequestModel bstReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.loadBSTReports(bstReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        BSTReportModel bstReportModel = BSTReportModel.fromJson(standardResponse.data);
        print(response.body);
        return bstReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return loadBSTReports(bstReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> loadKSTReports(
      KSTReportRequestModel kstReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.loadKSTReports(kstReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        KSTReportModel kstReportModel = KSTReportModel.fromJson(standardResponse.data);
        print(response.body);
        return kstReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return loadKSTReports(kstReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> campusHangout(
      CampusHangoutRequestModel campusHangoutRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.campusHangout(campusHangoutRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CampusHangoutModel campusHangoutModel = CampusHangoutModel.fromJson(standardResponse.data);
        print(response.body);
        return campusHangoutModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return campusHangout(campusHangoutRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> loadGoshthiReports(
      GoshthiReportRequestModel goshthiReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.loadGoshthiReports(goshthiReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        GoshthiReportModel goshthiReportModel = GoshthiReportModel.fromJson(standardResponse.data);
        print(response.body);
        return goshthiReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return loadGoshthiReports(goshthiReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> sabhaReportQuestions(
      SabhaReportQuestionsRequestModel sabhaReportQuestionsRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.sabhaReportQuestions(sabhaReportQuestionsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SabhaReportQuestionsModel sabhaReportQuestionsModel = SabhaReportQuestionsModel.fromJson(standardResponse.data);
        print(response.body);
        return sabhaReportQuestionsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return sabhaReportQuestions(sabhaReportQuestionsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> sabhaReportAttendance(
      SabhaReportAttendanceRequestModel sabhaReportAttendanceRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.sabhaReportAttendance(sabhaReportAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SabhaReportAttendanceModel sabhaReportAttendanceModel =
            SabhaReportAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        return sabhaReportAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return sabhaReportAttendance(sabhaReportAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> goshthiReportAttendance(GoshthiReportAttendanceRequestModel goshthiReportAttendanceRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.goshthiReportAttendance(goshthiReportAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        GoshthiReportAttendanceModel goshthiReportAttendanceModel =
            GoshthiReportAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        return goshthiReportAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return goshthiReportAttendance(goshthiReportAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitSabhaReportAttendance(
      SubmitSabhaReportAttendanceRequestModel submitSabhaReportAttendanceRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.submitSabhaReportAttendance(submitSabhaReportAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SubmitSabhaReportAttendanceModel submitSabhaReportAttendanceModel =
            SubmitSabhaReportAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return submitSabhaReportAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitSabhaReportAttendance(submitSabhaReportAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitGoshthiReportAttendance(
      SubmitGoshthiReportAttendanceRequestModel submitGoshthiReportAttendanceRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.submitGoshthiReportAttendance(submitGoshthiReportAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SubmitGoshthiReportAttendanceModel submitGoshthiReportAttendanceModel =
            SubmitGoshthiReportAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return submitGoshthiReportAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitGoshthiReportAttendance(submitGoshthiReportAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> updateGoshthiHeldStatus(UpdateGoshthiHeldStatusRequestModel updateGoshthiHeldStatusRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.updateGoshthiHeldStatus(updateGoshthiHeldStatusRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        UpdateGoshthiHeldStatusModel updateGoshthiHeldStatusModel =
            UpdateGoshthiHeldStatusModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return updateGoshthiHeldStatusModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return updateGoshthiHeldStatus(updateGoshthiHeldStatusRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> viewNetworkingReportList(ViewNetworkingReportListRequestModel viewNetworkingReportListRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.viewNetworkingReportList(viewNetworkingReportListRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ViewNetworkingReportListModel viewNetworkingReportListModel =
            ViewNetworkingReportListModel.fromJson(standardResponse.data);
        print(response.body);
        return viewNetworkingReportListModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return viewNetworkingReportList(viewNetworkingReportListRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> networkingInteractionLog(NetworkingInteractionLogRequestModel networkingInteractionLogRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.networkingInteractionLog(networkingInteractionLogRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        NetworkingInteractionLogModel networkingInteractionLogModel =
            NetworkingInteractionLogModel.fromJson(standardResponse.data);
        print(response.body);
        return networkingInteractionLogModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return networkingInteractionLog(networkingInteractionLogRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> networkingInteractionDetails(
      NetworkingInteractionDetailsRequestModel networkingInteractionDetailsRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.networkingInteractionDetails(networkingInteractionDetailsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        NetworkingInteractionDetailsModel networkingInteractionDetailsModel =
            NetworkingInteractionDetailsModel.fromJson(standardResponse.data);
        print(response.body);
        return networkingInteractionDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return networkingInteractionDetails(networkingInteractionDetailsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> createInteractionDetails(CreateInteractionDetailsRequestModel createInteractionDetailsRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.createInteractionDetails(createInteractionDetailsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CreateInteractionDetailsModel createInteractionDetailsModel =
            CreateInteractionDetailsModel.fromJson(standardResponse.data);
        print(response.body);
        return createInteractionDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return createInteractionDetails(createInteractionDetailsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> centerWiseInteractionTypes(
      CenterWiseInteractionRequestModel centerWiseInteractionRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.centerWiseInteractionTypes(centerWiseInteractionRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CenterWiseInteractionTypesModel centerWiseInteractionTypesModel =
            CenterWiseInteractionTypesModel.fromJson(standardResponse.data);
        print(response.body);
        return centerWiseInteractionTypesModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return centerWiseInteractionTypes(centerWiseInteractionRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> interactionWiseQuestions(InteractionsWiseQuestionsRequestModel interactionsWiseQuestionsRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.interactionWiseQuestions(interactionsWiseQuestionsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        InteractionWiseQuestionsModel interactionWiseQuestionsModel =
            InteractionWiseQuestionsModel.fromJson(standardResponse.data);
        print(response.body);
        return interactionWiseQuestionsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return interactionWiseQuestions(interactionsWiseQuestionsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> manageBSTReports(
      ManageBSTReportRequestModel manageBSTReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.manageBSTReports(manageBSTReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ManageBSTReportModel manageBSTReportModel = ManageBSTReportModel.fromJson(standardResponse.data);
        print(response.body);
        return manageBSTReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return manageBSTReports(manageBSTReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> manageKSTReports(
      ManageKSTReportRequestModel manageKSTReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.manageKSTReports(manageKSTReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ManageKSTReportModel manageKSTReportModel = ManageKSTReportModel.fromJson(standardResponse.data);
        print(response.body);
        return manageKSTReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return manageKSTReports(manageKSTReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> manageBSTAttendance(
      ManageBSTAttendanceRequestModel manageBSTAttendanceRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.manageBSTAttendance(manageBSTAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ManageBSTAttendanceModel manageBSTAttendanceModel = ManageBSTAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        return manageBSTAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return manageBSTAttendance(manageBSTAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> manageKSTAttendance(
      ManageKSTAttendanceRequestModel manageKSTAttendanceRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.manageKSTAttendance(manageKSTAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ManageKSTAttendanceModel manageKSTAttendanceModel = ManageKSTAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        return manageKSTAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return manageKSTAttendance(manageKSTAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> userGroupWiseSubGroup(
      UserGroupWiseSubGroupRequestModel userGroupWiseSubGroupRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.userGroupWiseSubGroup(userGroupWiseSubGroupRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        UserGroupWiseSubGroupModel userGroupWiseSubGroupModel =
            UserGroupWiseSubGroupModel.fromJson(standardResponse.data);
        print(response.body);
        return userGroupWiseSubGroupModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return userGroupWiseSubGroup(userGroupWiseSubGroupRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> takeBSTAttendance(
      TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.takeBSTAttendance(takeBSTAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        TakeBSTAttendanceModel takeBSTAttendanceModel = TakeBSTAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return takeBSTAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return takeBSTAttendance(takeBSTAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> takeKSTAttendance(
      TakeKSTAttendanceRequestModel takeKSTAttendanceRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.takeKSTAttendance(takeKSTAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        TakeKSTAttendanceModel takeKSTAttendanceModel = TakeKSTAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return takeKSTAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return takeKSTAttendance(takeKSTAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> manageBSTQuizScore(
      ManageBSTQuizScoreRequestModel manageBSTQuizScoreRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.manageBSTQuizScore(manageBSTQuizScoreRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ManageBSTQuizScoreModel manageBSTQuizScoreModel = ManageBSTQuizScoreModel.fromJson(standardResponse.data);
        print(response.body);
        return manageBSTQuizScoreModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return manageBSTQuizScore(manageBSTQuizScoreRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> manageKSTQuizScore(
      ManageKSTQuizScoreRequestModel manageKSTQuizScoreRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.manageKSTQuizScore(manageKSTQuizScoreRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ManageKSTQuizScoreModel manageKSTQuizScoreModel = ManageKSTQuizScoreModel.fromJson(standardResponse.data);
        print(response.body);
        return manageKSTQuizScoreModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return manageKSTQuizScore(manageKSTQuizScoreRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> saveBSTQuizScore(
      SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.saveBSTQuizScore(saveBSTQuizScoreRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SaveBSTQuizScoreModel saveBSTQuizScoreModel = SaveBSTQuizScoreModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return saveBSTQuizScoreModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return saveBSTQuizScore(saveBSTQuizScoreRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> saveKSTQuizScore(
      SaveKSTQuizScoreRequestModel saveKSTQuizScoreRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.saveKSTQuizScore(saveKSTQuizScoreRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SaveKSTQuizScoreModel saveKSTQuizScoreModel = SaveKSTQuizScoreModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return saveKSTQuizScoreModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return saveKSTQuizScore(saveKSTQuizScoreRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> manageBSTNiyamAssesment(ManageBSTNiyamAssesmentRequestModel manageBSTNiyamAssesmentRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.manageBSTNiyamAssesment(manageBSTNiyamAssesmentRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ManageBSTNiyamAssesmentModel manageBSTNiyamAssesmentModel =
            ManageBSTNiyamAssesmentModel.fromJson(standardResponse.data);
        print(response.body);
        return manageBSTNiyamAssesmentModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return manageBSTNiyamAssesment(manageBSTNiyamAssesmentRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> updateBSTNiyamAssesmentScore(
      UpdateBSTNiyamAssesmentScoreRequestModel updateBSTNiyamAssesmentScoreRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.updateBSTNiyamAssesmentScore(updateBSTNiyamAssesmentScoreRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        UpdateBSTNiyamAssesmentScoreModel updateBSTNiyamAssesmentScoreModel =
            UpdateBSTNiyamAssesmentScoreModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return updateBSTNiyamAssesmentScoreModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return updateBSTNiyamAssesmentScore(updateBSTNiyamAssesmentScoreRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> regionWiseCampus(
      RegionWiseCampusRequestModel regionWiseCampusRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.regionWiseCampus(regionWiseCampusRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        RegionWiseCampusModel regionWiseCampusModel = RegionWiseCampusModel.fromJson(standardResponse.data);
        print(response.body);
        return regionWiseCampusModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return regionWiseCampus(regionWiseCampusRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> viewHangoutReport(
      ViewHangoutReportRequestModel viewHangoutReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.viewHangoutReport(viewHangoutReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ViewHangoutReportModel viewHangoutReportModel = ViewHangoutReportModel.fromJson(standardResponse.data);
        print(response.body);
        return viewHangoutReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return viewHangoutReport(viewHangoutReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> campusHangoutRegion(
      CampusHangoutRegionRequestModel campusHangoutRegionRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.campusHangoutRegion(campusHangoutRegionRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CampusHangoutRegionModel campusHangoutRegionModel = CampusHangoutRegionModel.fromJson(standardResponse.data);
        print(response.body);
        return campusHangoutRegionModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return campusHangoutRegion(campusHangoutRegionRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> hRegionWiseCampus(
      HRegionWiseCampusRequestModel hRegionWiseCampusRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.hRegionWiseCampus(hRegionWiseCampusRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        HRegionWiseCampusModel hRegionWiseCampusModel = HRegionWiseCampusModel.fromJson(standardResponse.data);
        print(response.body);
        return hRegionWiseCampusModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return hRegionWiseCampus(hRegionWiseCampusRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> campusWiseHangoutTypes(
      CampusWiseHangoutTypesRequestModel campusWiseHangoutTypesRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.campusWiseHangoutTypes(campusWiseHangoutTypesRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CampusWiseHangoutTypesModel campusWiseHangoutTypesModel =
            CampusWiseHangoutTypesModel.fromJson(standardResponse.data);
        print(response.body);
        return campusWiseHangoutTypesModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return campusWiseHangoutTypes(campusWiseHangoutTypesRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> hangoutTypeWiseQuestions(HangoutTypeWiseQuestionsRequestModel hangoutTypeWiseQuestionsRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.hangoutTypeWiseQuestions(hangoutTypeWiseQuestionsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        HangoutTypeWiseQuestionsModel hangoutTypeWiseQuestionsModel =
            HangoutTypeWiseQuestionsModel.fromJson(standardResponse.data);
        print(response.body);
        return hangoutTypeWiseQuestionsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return hangoutTypeWiseQuestions(hangoutTypeWiseQuestionsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitCampusHangoutAttendance(
      SubmitCampusHangoutAttendanceRequestModel submitCampusHangoutAttendanceRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.submitCampusHangoutAttendance(submitCampusHangoutAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SubmitCampusHangoutAttendanceModel submitCampusHangoutAttendanceModel =
            SubmitCampusHangoutAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        if (submitCampusHangoutAttendanceModel.has_error!) {
          Utils().showToast(standardResponse.message);
        }
        return submitCampusHangoutAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitCampusHangoutAttendance(submitCampusHangoutAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> takeCampusHangoutAttendance(
      TakeCampusHangoutAttendanceRequestModel takeCampusHangoutAttendanceRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.takeCampusHangoutAttendance(takeCampusHangoutAttendanceRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        TakeCampusHangoutAttendanceModel takeCampusHangoutAttendanceModel =
            TakeCampusHangoutAttendanceModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return takeCampusHangoutAttendanceModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return takeCampusHangoutAttendance(takeCampusHangoutAttendanceRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> campusHangoutReportDetails(
      CampusHangoutReportDetailsRequestModel campusHangoutReportDetailsRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.campusHangoutReportDetails(campusHangoutReportDetailsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CampusHangoutReportDetailsModel campusHangoutReportDetailsModel =
            CampusHangoutReportDetailsModel.fromJson(standardResponse.data);
        print(response.body);
        return campusHangoutReportDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return campusHangoutReportDetails(campusHangoutReportDetailsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> createAllBSTReport(
      CreateAllBSTReportRequestModel createAllBSTReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.createAllBSTReport(createAllBSTReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CreateAllBSTReportModel createAllBSTReportModel = CreateAllBSTReportModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return createAllBSTReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return createAllBSTReport(createAllBSTReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> createAllKSTReport(
      CreateAllKSTReportRequestModel createAllKSTReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.createAllKSTReport(createAllKSTReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CreateAllKSTReportModel createAllKSTReportModel = CreateAllKSTReportModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return createAllKSTReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return createAllKSTReport(createAllKSTReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> getBSTWingName(
      GetBSTWingNameRequestModel getBSTWingNameRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.getBSTWingNameRequestModel(getBSTWingNameRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        GetBSTWingNameModel getBSTWingNameModel = GetBSTWingNameModel.fromJson(standardResponse.data);
        print(response.body);
        return getBSTWingNameModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return getBSTWingName(getBSTWingNameRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> createCenterBSTReport(
      CreateCenterBSTReportRequestModel createCenterBSTReportRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.createCenterBSTReport(createCenterBSTReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CreateCenterBSTReportModel createCenterBSTReportModel =
            CreateCenterBSTReportModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return createCenterBSTReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return createCenterBSTReport(createCenterBSTReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> createCampusHangoutReport(CreateCampusHangoutReportRequestModel createCampusHangoutReportRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.createCampusHangoutReport(createCampusHangoutReportRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CreateCampusHangoutReportModel createCampusHangoutReportModel =
            CreateCampusHangoutReportModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return createCampusHangoutReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return createCampusHangoutReport(createCampusHangoutReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> kstEducationMentoringList(KSTEducationMentoringListRequestModel kstEducationMentoringListRequestModel,
      String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.kstEducationMentoringList(kstEducationMentoringListRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        KSTEducationMentoringListModel kstEducationMentoringListModel =
            KSTEducationMentoringListModel.fromJson(standardResponse.data);
        print(response.body);
        return kstEducationMentoringListModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return kstEducationMentoringList(kstEducationMentoringListRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> kst1On1MentoringList(
      KST1On1MentoringListRequestModel kst1On1MentoringListRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.kst1On1MentoringList(kst1On1MentoringListRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        KST1On1MentoringListModel kst1On1MentoringListModel = KST1On1MentoringListModel.fromJson(standardResponse.data);
        print(response.body);
        return kst1On1MentoringListModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return kst1On1MentoringList(kst1On1MentoringListRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> educationMentoringInteractionDetails(
      EducationMentoringInteractionDetailsRequestModel educationMentoringInteractionDetailsRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.educationMentoringInteractionDetails(
          educationMentoringInteractionDetailsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        EducationMentoringInteractionDetailsModel educationMentoringInteractionDetailsModel =
            EducationMentoringInteractionDetailsModel.fromJson(standardResponse.data);
        print(response.body);
        return educationMentoringInteractionDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return educationMentoringInteractionDetails(
                educationMentoringInteractionDetailsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> k1On1MentoringInteractionDetails(
      K1On1MentoringInteractionDetailsRequestModel k1On1MentoringInteractionDetailsRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.k1On1MentoringInteractionDetails(
          k1On1MentoringInteractionDetailsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        K1On1MentoringInteractionDetailsModel k1On1MentoringInteractionDetailsModel =
            K1On1MentoringInteractionDetailsModel.fromJson(standardResponse.data);
        print(response.body);
        return k1On1MentoringInteractionDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return k1On1MentoringInteractionDetails(k1On1MentoringInteractionDetailsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> addKSTEducationMentoringForm(
      List<AddEducationMentoringFormRequestModel> addKSTEducationMentoringFormRequestModel,
      String token,
      BuildContext context) async {
    Map<String, dynamic> map = new Map<String, dynamic>();
    for (int v = 0; v < addKSTEducationMentoringFormRequestModel.length; v++) {
      if (addKSTEducationMentoringFormRequestModel[v].value != null) {
        map[addKSTEducationMentoringFormRequestModel[v].name] = addKSTEducationMentoringFormRequestModel[v].value;
      }

      if (addKSTEducationMentoringFormRequestModel[v].file != null) {
        map[addKSTEducationMentoringFormRequestModel[v].name] = addKSTEducationMentoringFormRequestModel[v].file!.path;
      }

      if (addKSTEducationMentoringFormRequestModel[v].multipleValues != null) {
        map[addKSTEducationMentoringFormRequestModel[v].name] =
            jsonEncode(addKSTEducationMentoringFormRequestModel[v].multipleValues!);
      }
    }

    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.addKSTEducationMentoringForm(map, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        AddEducationMentoringFormModel addEducationMentoringFormModel =
            AddEducationMentoringFormModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return addEducationMentoringFormModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return addKSTEducationMentoringForm(addKSTEducationMentoringFormRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> addKST1On1MentoringForm(List<Add1On1MentoringFormRequestModel> addKST1On1MentoringFormRequestModel,
      String token, BuildContext context) async {
    Map<String, dynamic> map = new Map<String, dynamic>();
    for (int v = 0; v < addKST1On1MentoringFormRequestModel.length; v++) {
      if (addKST1On1MentoringFormRequestModel[v].value != null) {
        map[addKST1On1MentoringFormRequestModel[v].name] = addKST1On1MentoringFormRequestModel[v].value;
      }

      if (addKST1On1MentoringFormRequestModel[v].file != null) {
        map[addKST1On1MentoringFormRequestModel[v].name] = addKST1On1MentoringFormRequestModel[v].file!.path;
      }

      if (addKST1On1MentoringFormRequestModel[v].multipleValues != null) {
        map[addKST1On1MentoringFormRequestModel[v].name] =
            jsonEncode(addKST1On1MentoringFormRequestModel[v].multipleValues!);
      }
    }

    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.addKST1On1MentoringForm(map, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        Add1On1MentoringFormModel add1On1MentoringFormModel = Add1On1MentoringFormModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return add1On1MentoringFormModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return addKST1On1MentoringForm(addKST1On1MentoringFormRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitCampusHangoutReport(
      List<SubmitCampusHangoutReportRequestModel> submitCampusHangoutReportRequestModel,
      String token,
      BuildContext context) async {
    Map<String, dynamic> map = new Map<String, dynamic>();
    for (int v = 0; v < submitCampusHangoutReportRequestModel.length; v++) {
      map[submitCampusHangoutReportRequestModel[v].name] = submitCampusHangoutReportRequestModel[v].value;
    }

    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.submitCampusHangoutReport(map, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SubmitCampusHangoutReportModel submitCampusHangoutReportModel =
            SubmitCampusHangoutReportModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return submitCampusHangoutReportModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitCampusHangoutReport(submitCampusHangoutReportRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitInteractionsQuestionsDetails(
      List<SubmitInteractionsQuestionsRequestModel> submitInteractionsQuestionsRequestModel,
      String token,
      BuildContext context) async {
    Map<String, dynamic> map = new Map<String, dynamic>();
    for (int v = 0; v < submitInteractionsQuestionsRequestModel.length; v++) {
      map[submitInteractionsQuestionsRequestModel[v].name] = submitInteractionsQuestionsRequestModel[v].value;
    }

    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.submitInteractionsQuestionsDetails(map, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SubmitInteractionsQuestionsDetailsModel submitInteractionsQuestionsDetailsModel =
            SubmitInteractionsQuestionsDetailsModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return submitInteractionsQuestionsDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitInteractionsQuestionsDetails(submitInteractionsQuestionsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitSabhaReportQuestions(
      List<SubmitSabhaReportQuestionsRequestModel> submitSabhaReportQuestionsRequestModel,
      String token,
      BuildContext context) async {
    Map<String, dynamic> map = new Map<String, dynamic>();
    for (int v = 0; v < submitSabhaReportQuestionsRequestModel.length; v++) {
      map[submitSabhaReportQuestionsRequestModel[v].name] = (submitSabhaReportQuestionsRequestModel[v].intValue == -1)
          ? submitSabhaReportQuestionsRequestModel[v].strValue
          : submitSabhaReportQuestionsRequestModel[v].intValue;
    }

    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.submitSabhaReportQuestions(map, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SubmitSabhaReportQuestionsModel submitSabhaReportQuestionsModel =
            SubmitSabhaReportQuestionsModel.fromJson(standardResponse.data);
        print(response.body);
        Utils().showToast(standardResponse.message);
        return submitSabhaReportQuestionsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitSabhaReportQuestions(submitSabhaReportQuestionsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> getEventRegisterDetails(
      EventRegisterDetailsRequestModel eventRegisterDetailsRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.getEventRegisterDetails(eventRegisterDetailsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        EventRegisterDetailsModel eventRegisterDetailsModel = EventRegisterDetailsModel.fromJson(standardResponse.data);
        print(response.body);
        return eventRegisterDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return getEventRegisterDetails(eventRegisterDetailsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> getLiabilityForm(
      LiabilityFormRequestModel liabilityFormRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.getLiabilityForm(liabilityFormRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        LiabilityFormModel liabilityFormModel = LiabilityFormModel.fromJson(standardResponse.data);
        print(response.body);
        return liabilityFormModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return getLiabilityForm(liabilityFormRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitLiabilityForm(
      SubmitLiabilityFormRequestModel submitLiabilityFormRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.submitLiabilityForm(
          submitLiabilityFormRequestModel.bkms_id,
          submitLiabilityFormRequestModel.event_id,
          submitLiabilityFormRequestModel.login_user_type,
          submitLiabilityFormRequestModel.login_parent_type,
          submitLiabilityFormRequestModel.liability_user_type,
          submitLiabilityFormRequestModel.signature,
          submitLiabilityFormRequestModel.approve_option,
          submitLiabilityFormRequestModel.initial_box1,
          submitLiabilityFormRequestModel.initial_box2,
          submitLiabilityFormRequestModel.initial_box3,
          submitLiabilityFormRequestModel.initial_box4,
          submitLiabilityFormRequestModel.initial_box5,
          submitLiabilityFormRequestModel.initial_box6,
          submitLiabilityFormRequestModel.initial_box7,
          submitLiabilityFormRequestModel.parents_name,
          'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SubmitLiabilityFormModel submitLiabilityFormModel = SubmitLiabilityFormModel.fromJson(standardResponse.data);
        Utils().showToast(standardResponse.message);
        print(response.body);
        return submitLiabilityFormModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitLiabilityForm(submitLiabilityFormRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> eventWontBeAttend(
      EventWontBeAttendRequestModel eventWontBeAttendRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.eventWontBeAttend(eventWontBeAttendRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        EventWontBeAttendModel eventWontBeAttendModel = EventWontBeAttendModel.fromJson(standardResponse.data);
        Utils().showToast(standardResponse.message);
        print(response.body);
        return eventWontBeAttendModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return eventWontBeAttend(eventWontBeAttendRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> eventRegistrationPayment(
      EventPaymentRequestModel eventPaymentRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.eventRegistrationPayment(eventPaymentRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        EventPaymentModel eventPaymentModel = EventPaymentModel.fromJson(standardResponse.data);
        Utils().showToast(standardResponse.message);
        print(response.body);
        return eventPaymentModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return eventRegistrationPayment(eventPaymentRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> basicRegistrationsDetails(
      BasicRegistrationFormRequestModel basicRegistrationFormRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.basicRegistrationFormDetails(basicRegistrationFormRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);

        //TODO Temp purpose only.
        /*String strTempResponse = await DefaultAssetBundle.of(context).loadString("assets/form_basic_registration.json");
      StandardResponse standardResponse = StandardResponse.fromJson(jsonDecode(strTempResponse));*/

        BasicRegistrationsFormModel basicRegistrationsFormModel =
            BasicRegistrationsFormModel.fromJson(standardResponse.data);
        print(response.body);
        return basicRegistrationsFormModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return basicRegistrationsDetails(basicRegistrationFormRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitBasicRegistrationsDetails(
      List<SubmitBasicRegistrationDetailsRequestModel> submitBasicRegistrationDetailsRequestModel,
      String token,
      BuildContext context) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse(Constant.BASE_URL + "/" + Constant.PREFIX + "/store_basic_registration"));

    for (int v = 0; v < submitBasicRegistrationDetailsRequestModel.length; v++) {
      var item = submitBasicRegistrationDetailsRequestModel[v];
      if (item.value != null) {
        request.fields[item.name] = Utils().nullSafeString(item.value);
      }

      if (item.file != null) {
        request.files.add(await http.MultipartFile.fromPath(item.name, Utils().nullSafeString(item.file!.path)));
      }

      if (item.multipleValues != null) {
        request.fields[item.name] = jsonEncode(item.multipleValues!);
      }
    }

    try {
      Map<String, String> headers = {HttpHeaders.authorizationHeader: 'bearer $token'};
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      final response = await streamedResponse.stream.bytesToString();
      if (streamedResponse.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(jsonDecode(response));
        SubmitBasicRegistrationsModel submitBasicRegistrationsModel =
            SubmitBasicRegistrationsModel.fromJson(standardResponse.data);
        Utils().showToast(standardResponse.message);
        print(response);
        return submitBasicRegistrationsModel;
      } else {
        if (handleErrorResponse(context, response)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitBasicRegistrationsDetails(submitBasicRegistrationDetailsRequestModel, newToken, context);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> stripeInfo(StripeInfoRequestModel stripeInfoRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.stripeInfo(stripeInfoRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        StripeInfoModel stripeInfoModel = StripeInfoModel.fromJson(standardResponse.data);
        return stripeInfoModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return stripeInfo(stripeInfoRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> transportationDetails(
      TransportationRequestModel transportationRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.transportationDetails(transportationRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        TransportationsDetailsModel transportationsDetailsModel =
            TransportationsDetailsModel.fromJson(standardResponse.data);
        print(response.body);
        return transportationsDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return transportationDetails(transportationRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> submitTransportationDetails(
      SubmitTransportationDetailsRequestModel submitTransportationDetailsRequestModel,
      String token,
      BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response =
          await clientService.submitTransportationDetails(submitTransportationDetailsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        SubmitTransportationsDetailsModel submitTransportationsDetailsModel =
            SubmitTransportationsDetailsModel.fromJson(standardResponse.data);
        Utils().showToast(standardResponse.message);
        print(response.body);
        return submitTransportationsDetailsModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return submitTransportationDetails(submitTransportationDetailsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> checkIn(CheckInRequestModel checkInRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.checkIn(checkInRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        CheckInModel checkInModel = CheckInModel.fromJson(standardResponse.data);
        Utils().showToast(standardResponse.message);
        print(response.body);
        return checkInModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return checkIn(checkInRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> collectFilters(
      CollectFiltersRequestModel getFiltersRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    final response = await clientService.getFilters(getFiltersRequestModel, 'bearer $token');

    /*if(response.isSuccessful) {
      StandardResponse standardResponse = StandardResponse.fromJson(response.body);
      CollectFiltersModel collectFiltersModel = CollectFiltersModel.fromJson(standardResponse.data);
      print(response.body);
      return collectFiltersModel;
    }else {
     handleErrorResponse(context, response.error);
      return null;
    }*/

    return null;
  }

  Future<dynamic> loadNotifications(
      LoadNotificationsRequestModel loadNotificationsRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.loadNotifications(loadNotificationsRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        NotificationModel notificationModel = NotificationModel.fromJson(standardResponse.data);
        print(response.body);
        return notificationModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return loadNotifications(loadNotificationsRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  Future<dynamic> readNotification(
      ReadNotificationRequestModel readNotificationRequestModel, String token, BuildContext context) async {
    final clientService = chopper!.getService<HttpChopperBkmsClient>();
    try {
      final response = await clientService.readNotification(readNotificationRequestModel, 'bearer $token');

      if (response.isSuccessful && response.statusCode == 200) {
        StandardResponse standardResponse = StandardResponse.fromJson(response.body);
        ReadNotificationModel readNotificationModel = ReadNotificationModel.fromJson(standardResponse.data);
        Utils().showToast(standardResponse.message);
        print(response.body);
        return readNotificationModel;
      } else {
        if (handleErrorResponse(context, response.error)) {
          dynamic newToken = await _collectNewRefreshToken(token, context);
          if (newToken is String) {
            return readNotification(readNotificationRequestModel, newToken, context);
          }
        }
      }
    } on SocketException {
      Utils().showToast("No Internet Connection");
    }
  }

  //region FOR HANDLE ERROR RESPONSE FOR REFRESH TOKEN
  bool handleErrorResponseForRefreshToken(BuildContext context, Object? error) {
    try {
      StandardErrorResponse standardErrorResponse = StandardErrorResponse.fromJson(jsonDecode(error.toString()));

      if (standardErrorResponse.status == 401) {
        return true;
      }

      //WHILE 401 WE CAN'T DISPLAY MESSAGE TOAST AS A SECURITY PURPOSE
      Utils().showToast(standardErrorResponse.message);

      if (standardErrorResponse.status == 400) {
        _redirectToLogin(context);
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
  //endregion

  // region FOR HANDLE ERROR RESPONSE
  bool handleErrorResponse(BuildContext context, Object? error) {
    try {
      StandardErrorResponse standardErrorResponse = StandardErrorResponse.fromJson(jsonDecode(error.toString()));

      if (standardErrorResponse.status == 401) {
        return true;
      }
      //WHILE 401 WE CAN'T DISPLAY MESSAGE TOAST AS A SECURITY PURPOSE
      Utils().showToast(standardErrorResponse.message);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
  //endregion

  //region REDIRECT TO LOGIN WHILE TOKEN IS EXPIRED
  void _redirectToLogin(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(AuthEvent.logOut());
    VRouter.of(context).to(Login.path, isReplacement: true);
  }
  //endregion

  //region FOR COLLECT NEW REFRESH TOKEN
  Future<dynamic> _collectNewRefreshToken(String token, BuildContext context) async {
    final _pref = await Preferences.getInstance();
    LoginModel? loginModel = await _pref.getToken();

    RefreshTokenRequestModel refreshTokenRequestModel = RefreshTokenRequestModel(
        Utils().nullSafeString(loginModel!.login_user_type.toString()),
        Utils().nullSafeString(loginModel.login_parent_type),
        Utils().nullSafeInt(loginModel.bkms_id).toString(),
        Utils().nullSafeString(loginModel.refresh_token));
    final refreshTokenModel = await refreshToken(refreshTokenRequestModel, token, context);
    if (refreshTokenModel is RefreshTokenModel) {
      //Update your Access-Token in LoginModel Preference
      token = refreshTokenModel.access_token;
      loginModel.access_token = token;
      await _pref.setToken(loginModel);
      return token;
    }
  }
  //endregion
}
