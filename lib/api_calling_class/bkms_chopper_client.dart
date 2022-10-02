import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_app/models/add_new_record_request_model.dart';
import 'package:flutter_app/models/basic_registration_form_request_model.dart';
import 'package:flutter_app/models/bst_report_request_model.dart';
import 'package:flutter_app/models/campus_hangout_details_request_model.dart';
import 'package:flutter_app/models/campus_hangout_region_request_model.dart';
import 'package:flutter_app/models/campus_hangout_request_model.dart';
import 'package:flutter_app/models/campus_wise_hangout_types_request_model.dart';
import 'package:flutter_app/models/center_wise_interaction_request_model.dart';
import 'package:flutter_app/models/check_in_request_model.dart';
import 'package:flutter_app/models/create_all_bst_report_request_model.dart';
import 'package:flutter_app/models/create_all_kst_report_request_model.dart';
import 'package:flutter_app/models/create_campus_hangout_report_request_model.dart';
import 'package:flutter_app/models/create_center_bst_report_request_model.dart';
import 'package:flutter_app/models/create_interaction_details_request_model.dart';
import 'package:flutter_app/models/deactivate_user_request_model.dart';
import 'package:flutter_app/models/education_mentoring_interaction_details_request_model.dart';
import 'package:flutter_app/models/event_detail_request.dart';
import 'package:flutter_app/models/event_payment_request_model.dart';
import 'package:flutter_app/models/event_register_details_request_model.dart';
import 'package:flutter_app/models/event_wont_be_attend_request_model.dart';
import 'package:flutter_app/models/forgot_password_request_model.dart';
import 'package:flutter_app/models/collect_filters_request_model.dart';
import 'package:flutter_app/models/get_bst_wing_name_request_model.dart';
import 'package:flutter_app/models/goshthi_report_attendance_request_model.dart';
import 'package:flutter_app/models/goshthi_report_request_model.dart';
import 'package:flutter_app/models/h_region_wise_campus_request_model.dart';
import 'package:flutter_app/models/hangout_type_wise_questions_request_model.dart';
import 'package:flutter_app/models/home_request_model.dart';
import 'package:flutter_app/models/interaction_wise_questions_request_model.dart';
import 'package:flutter_app/models/k1On1_mentoring_interaction_details_request_model.dart';
import 'package:flutter_app/models/kst_1On1_mentoring_list_request_model.dart';
import 'package:flutter_app/models/kst_education_mentoring_list_request_model.dart';
import 'package:flutter_app/models/kst_report_request_model.dart';
import 'package:flutter_app/models/liability_form_request_model.dart';
import 'package:flutter_app/models/load_notifications_request_model.dart';
import 'package:flutter_app/models/login_request_model.dart';
import 'package:flutter_app/models/manage_bst_attendance_request_model.dart';
import 'package:flutter_app/models/manage_bst_niyam_assesment_request_model.dart';
import 'package:flutter_app/models/manage_bst_quiz_score_request_model.dart';
import 'package:flutter_app/models/manage_bst_report_request_model.dart';
import 'package:flutter_app/models/manage_kst_attendance_request_model.dart';
import 'package:flutter_app/models/manage_kst_quiz_score_request_model.dart';
import 'package:flutter_app/models/manage_kst_report_request_model.dart';
import 'package:flutter_app/models/networking_interaction_details_request_model.dart';
import 'package:flutter_app/models/networking_interaction_log_request_model.dart';
import 'package:flutter_app/models/networking_report_request_model.dart';
import 'package:flutter_app/models/read_notification_request_model.dart';
import 'package:flutter_app/models/record_request_model.dart';
import 'package:flutter_app/models/refresh_token_request_model.dart';
import 'package:flutter_app/models/region_wise_campus_request_model.dart';
import 'package:flutter_app/models/report_request_model.dart';
import 'package:flutter_app/models/reset_password_request_model.dart';
import 'package:flutter_app/models/sabha_report_attendance_request_model.dart';
import 'package:flutter_app/models/sabha_report_questions_request_model.dart';
import 'package:flutter_app/models/sabha_sabha_report_attendance_request_model.dart';
import 'package:flutter_app/models/save_bst_quiz_score_request_model.dart';
import 'package:flutter_app/models/save_kst_quiz_score_request_model.dart';
import 'package:flutter_app/models/stripe_info_request_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_attendance_request_model.dart';
import 'package:flutter_app/models/submit_goshthi_report_attendance_request_model.dart';
import 'package:flutter_app/models/submit_transportation_details_request_model.dart';
import 'package:flutter_app/models/take_bst_attendance_request_model.dart';
import 'package:flutter_app/models/take_campus_hangout_attendance_request_model.dart';
import 'package:flutter_app/models/take_kst_attendance_request_model.dart';
import 'package:flutter_app/models/transportation_request_model.dart';
import 'package:flutter_app/models/update_bst_niyam_assesment_score_request_model.dart';
import 'package:flutter_app/models/update_goshthi_held_status_request_model.dart';
import 'package:flutter_app/models/update_profile_request_model.dart';
import 'package:flutter_app/models/user_group_wise_sub_group_request_model.dart';
import 'package:flutter_app/models/user_profile_request_model.dart';
import 'package:flutter_app/models/view_hangout_report_request_model.dart';
import 'package:flutter_app/models/view_networking_report_list_request_model.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:http/http.dart' as http;

part "bkms_chopper_client.chopper.dart";

@ChopperApi(baseUrl: "")
abstract class HttpChopperBkmsClient extends ChopperService {
  static HttpChopperBkmsClient create([ChopperClient? client]) => _$HttpChopperBkmsClient(client);

  @Post(
    path: "/auth/login",
  )
  Future<Response> getLogin(@Body() LoginRequestModel loginRequestModel);

  @Post(
    path: "/auth/refresh",
  )
  Future<Response> refreshToken(@Body() RefreshTokenRequestModel refreshTokenRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(
    path: "/forgot",
  )
  Future<Response> forgotPassword(@Body() ForgotPasswordRequestModel forgotPasswordRequestModel);

  @Post(
    path: "/resetpassword",
  )
  Future<Response> resetPassword(@Body() ResetPasswordRequestModel resetPasswordRequestModel);

  @Post(path: "/new_userprofile")
  Future<Response> userProfile(@Body() UserProfileRequestModel userProfileRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/singleevent")
  Future<Response> eventDetail(@Body() EventDetailRequestModel eventDetailRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/new_updateprofile")
  Future<Response> updateProfile(@Body() UpdateProfileRequestModel updateProfileRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/new_adduser")
  Future<Response> addNewRecord(@Body() AddNewRecordRequestModel addNewRecordRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_user_wing_group")
  Future<Response> userWiseGroup(
      @Body() UserWiseGroupRequest userWiseGroupRequest, @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/deactivemember")
  Future<Response> deactivateUser(@Body() DeactivateUserRequestModel deactivateUserRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/memberlist")
  Future<Response> getRecords(
      @Body() RecordRequestModel recordRequestModel, @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/getfilterdata")
  Future<Response> getFilters(@Body() CollectFiltersRequestModel getFiltersRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/home")
  Future<Response> getHomeDetails(
      @Body() HomeRequestModel homeRequestModel, @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/report_week_sabha_attendance_listing")
  Future<Response> loadReports(
      @Body() ReportRequestModel reportRequestModel, @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/network_report_listing")
  Future<Response> loadNetworkingReports(@Body() NetworkingReportRequestModel networkingReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_bst_report_list")
  Future<Response> loadBSTReports(@Body() BSTReportRequestModel bstReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_kst_report_list")
  Future<Response> loadKSTReports(@Body() KSTReportRequestModel kstReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/campus_hangout_report_list")
  Future<Response> campusHangout(@Body() CampusHangoutRequestModel campusHangoutRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/karyakar_goshthi_report_list")
  Future<Response> loadGoshthiReports(@Body() GoshthiReportRequestModel goshthiReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/report_sabha_view")
  Future<Response> sabhaReportQuestions(@Body() SabhaReportQuestionsRequestModel sabhaReportQuestionsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_sabha_attendance_list")
  Future<Response> sabhaReportAttendance(@Body() SabhaReportAttendanceRequestModel sabhaReportAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/karyakar_goshthi_attendance_list")
  Future<Response> goshthiReportAttendance(
      @Body() GoshthiReportAttendanceRequestModel goshthiReportAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/add_sabha_attendance")
  Future<Response> submitSabhaReportAttendance(
      @Body() SubmitSabhaReportAttendanceRequestModel submitSabhaReportAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/take_karyakar_goshthi_attendance")
  Future<Response> submitGoshthiReportAttendance(
      @Body() SubmitGoshthiReportAttendanceRequestModel submitGoshthiReportAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/update_karyakar_goshthi_sabha")
  Future<Response> updateGoshthiHeldStatus(
      @Body() UpdateGoshthiHeldStatusRequestModel updateGoshthiHeldStatusRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/view_network_report_list")
  Future<Response> viewNetworkingReportList(
      @Body() ViewNetworkingReportListRequestModel viewNetworkingReportListRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_networking_interaction_log")
  Future<Response> networkingInteractionLog(
      @Body() NetworkingInteractionLogRequestModel networkingInteractionLogRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/view_interaction_report")
  Future<Response> networkingInteractionDetails(
      @Body() NetworkingInteractionDetailsRequestModel networkingInteractionDetailsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/create_networking_interaction_report")
  Future<Response> createInteractionDetails(
      @Body() CreateInteractionDetailsRequestModel createInteractionDetailsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_networkinteraction_type")
  Future<Response> centerWiseInteractionTypes(
      @Body() CenterWiseInteractionRequestModel centerWiseInteractionRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_report_base_on_interaction")
  Future<Response> interactionWiseQuestions(
      @Body() InteractionsWiseQuestionsRequestModel interactionsWiseQuestionsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/manage_bst_report_list")
  Future<Response> manageBSTReports(@Body() ManageBSTReportRequestModel manageBSTReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_kst_manage_report_list")
  Future<Response> manageKSTReports(@Body() ManageKSTReportRequestModel manageKSTReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/manage_bst_attendance_api")
  Future<Response> manageBSTAttendance(@Body() ManageBSTAttendanceRequestModel manageBSTAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_kst_attendance_list")
  Future<Response> manageKSTAttendance(@Body() ManageKSTAttendanceRequestModel manageKSTAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_subgroup_name_list")
  Future<Response> userGroupWiseSubGroup(@Body() UserGroupWiseSubGroupRequestModel userGroupWiseSubGroupRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/take_bst_attendance")
  Future<Response> takeBSTAttendance(@Body() TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/take_kst_attendance")
  Future<Response> takeKSTAttendance(@Body() TakeKSTAttendanceRequestModel takeKSTAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/bst_quiz_score_list")
  Future<Response> manageBSTQuizScore(@Body() ManageBSTQuizScoreRequestModel manageBSTQuizScoreRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_kst_quiz_score_list")
  Future<Response> manageKSTQuizScore(@Body() ManageKSTQuizScoreRequestModel manageKSTQuizScoreRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/save_bst_quiz_score")
  Future<Response> saveBSTQuizScore(@Body() SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/save_kst_quiz_score")
  Future<Response> saveKSTQuizScore(@Body() SaveKSTQuizScoreRequestModel saveKSTQuizScoreRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_bst_niyam_assessment_attendees_list")
  Future<Response> manageBSTNiyamAssesment(
      @Body() ManageBSTNiyamAssesmentRequestModel manageBSTNiyamAssesmentRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/save_bst_niyam_assessment_attendees")
  Future<Response> updateBSTNiyamAssesmentScore(
      @Body() UpdateBSTNiyamAssesmentScoreRequestModel updateBSTNiyamAssesmentScoreRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_campus_list")
  Future<Response> regionWiseCampus(@Body() RegionWiseCampusRequestModel regionWiseCampusRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/view_hangout_report")
  Future<Response> viewHangoutReport(@Body() ViewHangoutReportRequestModel viewHangoutReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_campus_hangout_region")
  Future<Response> campusHangoutRegion(@Body() CampusHangoutRegionRequestModel campusHangoutRegionRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_hangout_campus")
  Future<Response> hRegionWiseCampus(@Body() HRegionWiseCampusRequestModel hRegionWiseCampusRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_hangout_type_list")
  Future<Response> campusWiseHangoutTypes(@Body() CampusWiseHangoutTypesRequestModel campusWiseHangoutTypesRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_dynamic_question")
  Future<Response> hangoutTypeWiseQuestions(
      @Body() HangoutTypeWiseQuestionsRequestModel hangoutTypeWiseQuestionsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_campus_sabha_id")
  Future<Response> submitCampusHangoutAttendance(
      @Body() SubmitCampusHangoutAttendanceRequestModel submitCampusHangoutAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_campus_hangout_id")
  Future<Response> takeCampusHangoutAttendance(
      @Body() TakeCampusHangoutAttendanceRequestModel takeCampusHangoutAttendanceRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_campus_hangout_report_detail")
  Future<Response> campusHangoutReportDetails(
      @Body() CampusHangoutReportDetailsRequestModel campusHangoutReportDetailsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/create_all_bst_center_report")
  Future<Response> createAllBSTReport(@Body() CreateAllBSTReportRequestModel createAllBSTReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/create_all_kst_center_report")
  Future<Response> createAllKSTReport(@Body() CreateAllKSTReportRequestModel createAllKSTReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_bst_wing_name")
  Future<Response> getBSTWingNameRequestModel(@Body() GetBSTWingNameRequestModel getBSTWingNameRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/create_center_bst_report")
  Future<Response> createCenterBSTReport(@Body() CreateCenterBSTReportRequestModel createCenterBSTReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/create_campus_hangout_report_api")
  Future<Response> createCampusHangoutReport(
      @Body() CreateCampusHangoutReportRequestModel createCampusHangoutReportRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_kst_education_mentoring_list")
  Future<Response> kstEducationMentoringList(
      @Body() KSTEducationMentoringListRequestModel kstEducationMentoringListRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_kst_1_on_1_mentoring_list")
  Future<Response> kst1On1MentoringList(@Body() KST1On1MentoringListRequestModel kst1On1MentoringListRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_kst_education_mentoring_form")
  Future<Response> educationMentoringInteractionDetails(
      @Body() EducationMentoringInteractionDetailsRequestModel educationMentoringInteractionDetailsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/get_kst_1_on_1_mentoring_form")
  Future<Response> k1On1MentoringInteractionDetails(
      @Body() K1On1MentoringInteractionDetailsRequestModel k1On1MentoringInteractionDetailsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/report_sabha_update")
  Future<Response> submitSabhaReportQuestions(@Body() Map<String, dynamic> submitSabhaReportQuestions,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/save_network_interaction_report")
  Future<Response> submitInteractionsQuestionsDetails(@Body() Map<String, dynamic> submitSabhaReportQuestions,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/submit_campus_hangout_report")
  Future<Response> submitCampusHangoutReport(@Body() Map<String, dynamic> submitCampusHangoutReport,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/save_kst_education_mentoring_form")
  Future<Response> addKSTEducationMentoringForm(@Body() Map<String, dynamic> addKSTEducationMentoringForm,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/save_kst_1_on_1_mentoring_form")
  Future<Response> addKST1On1MentoringForm(@Body() Map<String, dynamic> addKST1On1MentoringForm,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/eventregister")
  Future<Response> getEventRegisterDetails(@Body() EventRegisterDetailsRequestModel eventRegisterDetailsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/getliabilityfrom")
  Future<Response> getLiabilityForm(@Body() LiabilityFormRequestModel liabilityFormRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  /*@Post(path: "/submitliabilityfrom")
  @Multipart()
  Future<Response> submitLiabilityForm(
      @Part('bkms_id') String bkms_id,
      @Part('event_id') String event_id,
      @PartFile('signature') http.MultipartFile signature,
      @Header(HttpHeaders.authorizationHeader) String authorization);*/
  @Post(path: "/submitliabilityfrom")
  @Multipart()
  Future<Response> submitLiabilityForm(
      @Part('bkms_id') String bkms_id,
      @Part('event_id') String event_id,
      @Part('login_user_type') String login_user_type,
      @Part('login_parent_type') String login_parent_type,
      @Part('liability_user_type') String liability_user_type,
      @Part('signature') String signature,
      @Part('approve_option') String approve_option,
      @Part('initial_box1') String initial_box1,
      @Part('initial_box2') String initial_box2,
      @Part('initial_box3') String initial_box3,
      @Part('initial_box4') String initial_box4,
      @Part('initial_box5') String initial_box5,
      @Part('initial_box6') String initial_box6,
      @Part('initial_box7') String initial_box7,
      @Part('parents_name') String parents_name,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/eventnotattend")
  Future<Response> eventWontBeAttend(@Body() EventWontBeAttendRequestModel eventWontBeAttendRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/eventregisterfee")
  Future<Response> eventRegistrationPayment(@Body() EventPaymentRequestModel eventPaymentRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/basic_registration")
  Future<Response> basicRegistrationFormDetails(
      @Body() BasicRegistrationFormRequestModel basicRegistrationFormRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/store_basic_registration")
  @Multipart()
  Future<Response> submitBasicRegistrationDetails(
      @Part('bkms_id') String bkms_id,
      @Part('event_id') String event_id,
      @PartFile('signature') http.MultipartFile signature,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/create-payment-intent")
  Future<Response> stripeInfo(@Body() StripeInfoRequestModel stripeInfoRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/gettransportlist")
  Future<Response> transportationDetails(@Body() TransportationRequestModel transportationRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/savetransportation")
  Future<Response> submitTransportationDetails(
      @Body() SubmitTransportationDetailsRequestModel submitTransportationDetailsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/checkin")
  Future<Response> checkIn(
      @Body() CheckInRequestModel checkInRequestModel, @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/getnotification")
  Future<Response> loadNotifications(@Body() LoadNotificationsRequestModel loadNotificationsRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);

  @Post(path: "/update_notification_status")
  Future<Response> readNotification(@Body() ReadNotificationRequestModel readNotificationRequestModel,
      @Header(HttpHeaders.authorizationHeader) String authorization);
}
