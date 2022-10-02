// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bkms_chopper_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$HttpChopperBkmsClient extends HttpChopperBkmsClient {
  _$HttpChopperBkmsClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HttpChopperBkmsClient;

  @override
  Future<Response<dynamic>> getLogin(LoginRequestModel loginRequestModel) {
    final $url = '/auth/login';
    final $body = loginRequestModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> refreshToken(
      RefreshTokenRequestModel refreshTokenRequestModel, String authorization) {
    final $url = '/auth/refresh';
    final $headers = {
      'authorization': authorization,
    };

    final $body = refreshTokenRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> forgotPassword(
      ForgotPasswordRequestModel forgotPasswordRequestModel) {
    final $url = '/forgot';
    final $body = forgotPasswordRequestModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) {
    final $url = '/resetpassword';
    final $body = resetPasswordRequestModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userProfile(
      UserProfileRequestModel userProfileRequestModel, String authorization) {
    final $url = '/new_userprofile';
    final $headers = {
      'authorization': authorization,
    };

    final $body = userProfileRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> eventDetail(
      EventDetailRequestModel eventDetailRequestModel, String authorization) {
    final $url = '/singleevent';
    final $headers = {
      'authorization': authorization,
    };

    final $body = eventDetailRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateProfile(
      UpdateProfileRequestModel updateProfileRequestModel,
      String authorization) {
    final $url = '/new_updateprofile';
    final $headers = {
      'authorization': authorization,
    };

    final $body = updateProfileRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addNewRecord(
      AddNewRecordRequestModel addNewRecordRequestModel, String authorization) {
    final $url = '/new_adduser';
    final $headers = {
      'authorization': authorization,
    };

    final $body = addNewRecordRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userWiseGroup(
      UserWiseGroupRequest userWiseGroupRequest, String authorization) {
    final $url = '/get_user_wing_group';
    final $headers = {
      'authorization': authorization,
    };

    final $body = userWiseGroupRequest;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deactivateUser(
      DeactivateUserRequestModel deactivateUserRequestModel,
      String authorization) {
    final $url = '/deactivemember';
    final $headers = {
      'authorization': authorization,
    };

    final $body = deactivateUserRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getRecords(
      RecordRequestModel recordRequestModel, String authorization) {
    final $url = '/memberlist';
    final $headers = {
      'authorization': authorization,
    };

    final $body = recordRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getFilters(
      CollectFiltersRequestModel getFiltersRequestModel, String authorization) {
    final $url = '/getfilterdata';
    final $headers = {
      'authorization': authorization,
    };

    final $body = getFiltersRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHomeDetails(
      HomeRequestModel homeRequestModel, String authorization) {
    final $url = '/home';
    final $headers = {
      'authorization': authorization,
    };

    final $body = homeRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> loadReports(
      ReportRequestModel reportRequestModel, String authorization) {
    final $url = '/report_week_sabha_attendance_listing';
    final $headers = {
      'authorization': authorization,
    };

    final $body = reportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> loadNetworkingReports(
      NetworkingReportRequestModel networkingReportRequestModel,
      String authorization) {
    final $url = '/network_report_listing';
    final $headers = {
      'authorization': authorization,
    };

    final $body = networkingReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> loadBSTReports(
      BSTReportRequestModel bstReportRequestModel, String authorization) {
    final $url = '/get_bst_report_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = bstReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> loadKSTReports(
      KSTReportRequestModel kstReportRequestModel, String authorization) {
    final $url = '/get_kst_report_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = kstReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> campusHangout(
      CampusHangoutRequestModel campusHangoutRequestModel,
      String authorization) {
    final $url = '/campus_hangout_report_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = campusHangoutRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> loadGoshthiReports(
      GoshthiReportRequestModel goshthiReportRequestModel,
      String authorization) {
    final $url = '/karyakar_goshthi_report_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = goshthiReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sabhaReportQuestions(
      SabhaReportQuestionsRequestModel sabhaReportQuestionsRequestModel,
      String authorization) {
    final $url = '/report_sabha_view';
    final $headers = {
      'authorization': authorization,
    };

    final $body = sabhaReportQuestionsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sabhaReportAttendance(
      SabhaReportAttendanceRequestModel sabhaReportAttendanceRequestModel,
      String authorization) {
    final $url = '/get_sabha_attendance_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = sabhaReportAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> goshthiReportAttendance(
      GoshthiReportAttendanceRequestModel goshthiReportAttendanceRequestModel,
      String authorization) {
    final $url = '/karyakar_goshthi_attendance_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = goshthiReportAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitSabhaReportAttendance(
      SubmitSabhaReportAttendanceRequestModel
          submitSabhaReportAttendanceRequestModel,
      String authorization) {
    final $url = '/add_sabha_attendance';
    final $headers = {
      'authorization': authorization,
    };

    final $body = submitSabhaReportAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitGoshthiReportAttendance(
      SubmitGoshthiReportAttendanceRequestModel
          submitGoshthiReportAttendanceRequestModel,
      String authorization) {
    final $url = '/take_karyakar_goshthi_attendance';
    final $headers = {
      'authorization': authorization,
    };

    final $body = submitGoshthiReportAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateGoshthiHeldStatus(
      UpdateGoshthiHeldStatusRequestModel updateGoshthiHeldStatusRequestModel,
      String authorization) {
    final $url = '/update_karyakar_goshthi_sabha';
    final $headers = {
      'authorization': authorization,
    };

    final $body = updateGoshthiHeldStatusRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> viewNetworkingReportList(
      ViewNetworkingReportListRequestModel viewNetworkingReportListRequestModel,
      String authorization) {
    final $url = '/view_network_report_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = viewNetworkingReportListRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> networkingInteractionLog(
      NetworkingInteractionLogRequestModel networkingInteractionLogRequestModel,
      String authorization) {
    final $url = '/get_networking_interaction_log';
    final $headers = {
      'authorization': authorization,
    };

    final $body = networkingInteractionLogRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> networkingInteractionDetails(
      NetworkingInteractionDetailsRequestModel
          networkingInteractionDetailsRequestModel,
      String authorization) {
    final $url = '/view_interaction_report';
    final $headers = {
      'authorization': authorization,
    };

    final $body = networkingInteractionDetailsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createInteractionDetails(
      CreateInteractionDetailsRequestModel createInteractionDetailsRequestModel,
      String authorization) {
    final $url = '/create_networking_interaction_report';
    final $headers = {
      'authorization': authorization,
    };

    final $body = createInteractionDetailsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> centerWiseInteractionTypes(
      CenterWiseInteractionRequestModel centerWiseInteractionRequestModel,
      String authorization) {
    final $url = '/get_networkinteraction_type';
    final $headers = {
      'authorization': authorization,
    };

    final $body = centerWiseInteractionRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> interactionWiseQuestions(
      InteractionsWiseQuestionsRequestModel
          interactionsWiseQuestionsRequestModel,
      String authorization) {
    final $url = '/get_report_base_on_interaction';
    final $headers = {
      'authorization': authorization,
    };

    final $body = interactionsWiseQuestionsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> manageBSTReports(
      ManageBSTReportRequestModel manageBSTReportRequestModel,
      String authorization) {
    final $url = '/manage_bst_report_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = manageBSTReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> manageKSTReports(
      ManageKSTReportRequestModel manageKSTReportRequestModel,
      String authorization) {
    final $url = '/get_kst_manage_report_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = manageKSTReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> manageBSTAttendance(
      ManageBSTAttendanceRequestModel manageBSTAttendanceRequestModel,
      String authorization) {
    final $url = '/manage_bst_attendance_api';
    final $headers = {
      'authorization': authorization,
    };

    final $body = manageBSTAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> manageKSTAttendance(
      ManageKSTAttendanceRequestModel manageKSTAttendanceRequestModel,
      String authorization) {
    final $url = '/get_kst_attendance_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = manageKSTAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userGroupWiseSubGroup(
      UserGroupWiseSubGroupRequestModel userGroupWiseSubGroupRequestModel,
      String authorization) {
    final $url = '/get_subgroup_name_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = userGroupWiseSubGroupRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> takeBSTAttendance(
      TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel,
      String authorization) {
    final $url = '/take_bst_attendance';
    final $headers = {
      'authorization': authorization,
    };

    final $body = takeBSTAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> takeKSTAttendance(
      TakeKSTAttendanceRequestModel takeKSTAttendanceRequestModel,
      String authorization) {
    final $url = '/take_kst_attendance';
    final $headers = {
      'authorization': authorization,
    };

    final $body = takeKSTAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> manageBSTQuizScore(
      ManageBSTQuizScoreRequestModel manageBSTQuizScoreRequestModel,
      String authorization) {
    final $url = '/bst_quiz_score_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = manageBSTQuizScoreRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> manageKSTQuizScore(
      ManageKSTQuizScoreRequestModel manageKSTQuizScoreRequestModel,
      String authorization) {
    final $url = '/get_kst_quiz_score_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = manageKSTQuizScoreRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> saveBSTQuizScore(
      SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel,
      String authorization) {
    final $url = '/save_bst_quiz_score';
    final $headers = {
      'authorization': authorization,
    };

    final $body = saveBSTQuizScoreRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> saveKSTQuizScore(
      SaveKSTQuizScoreRequestModel saveKSTQuizScoreRequestModel,
      String authorization) {
    final $url = '/save_kst_quiz_score';
    final $headers = {
      'authorization': authorization,
    };

    final $body = saveKSTQuizScoreRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> manageBSTNiyamAssesment(
      ManageBSTNiyamAssesmentRequestModel manageBSTNiyamAssesmentRequestModel,
      String authorization) {
    final $url = '/get_bst_niyam_assessment_attendees_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = manageBSTNiyamAssesmentRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateBSTNiyamAssesmentScore(
      UpdateBSTNiyamAssesmentScoreRequestModel
          updateBSTNiyamAssesmentScoreRequestModel,
      String authorization) {
    final $url = '/save_bst_niyam_assessment_attendees';
    final $headers = {
      'authorization': authorization,
    };

    final $body = updateBSTNiyamAssesmentScoreRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> regionWiseCampus(
      RegionWiseCampusRequestModel regionWiseCampusRequestModel,
      String authorization) {
    final $url = '/get_campus_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = regionWiseCampusRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> viewHangoutReport(
      ViewHangoutReportRequestModel viewHangoutReportRequestModel,
      String authorization) {
    final $url = '/view_hangout_report';
    final $headers = {
      'authorization': authorization,
    };

    final $body = viewHangoutReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> campusHangoutRegion(
      CampusHangoutRegionRequestModel campusHangoutRegionRequestModel,
      String authorization) {
    final $url = '/get_campus_hangout_region';
    final $headers = {
      'authorization': authorization,
    };

    final $body = campusHangoutRegionRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> hRegionWiseCampus(
      HRegionWiseCampusRequestModel hRegionWiseCampusRequestModel,
      String authorization) {
    final $url = '/get_hangout_campus';
    final $headers = {
      'authorization': authorization,
    };

    final $body = hRegionWiseCampusRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> campusWiseHangoutTypes(
      CampusWiseHangoutTypesRequestModel campusWiseHangoutTypesRequestModel,
      String authorization) {
    final $url = '/get_hangout_type_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = campusWiseHangoutTypesRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> hangoutTypeWiseQuestions(
      HangoutTypeWiseQuestionsRequestModel hangoutTypeWiseQuestionsRequestModel,
      String authorization) {
    final $url = '/get_dynamic_question';
    final $headers = {
      'authorization': authorization,
    };

    final $body = hangoutTypeWiseQuestionsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitCampusHangoutAttendance(
      SubmitCampusHangoutAttendanceRequestModel
          submitCampusHangoutAttendanceRequestModel,
      String authorization) {
    final $url = '/get_campus_sabha_id';
    final $headers = {
      'authorization': authorization,
    };

    final $body = submitCampusHangoutAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> takeCampusHangoutAttendance(
      TakeCampusHangoutAttendanceRequestModel
          takeCampusHangoutAttendanceRequestModel,
      String authorization) {
    final $url = '/get_campus_hangout_id';
    final $headers = {
      'authorization': authorization,
    };

    final $body = takeCampusHangoutAttendanceRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> campusHangoutReportDetails(
      CampusHangoutReportDetailsRequestModel
          campusHangoutReportDetailsRequestModel,
      String authorization) {
    final $url = '/get_campus_hangout_report_detail';
    final $headers = {
      'authorization': authorization,
    };

    final $body = campusHangoutReportDetailsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createAllBSTReport(
      CreateAllBSTReportRequestModel createAllBSTReportRequestModel,
      String authorization) {
    final $url = '/create_all_bst_center_report';
    final $headers = {
      'authorization': authorization,
    };

    final $body = createAllBSTReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createAllKSTReport(
      CreateAllKSTReportRequestModel createAllKSTReportRequestModel,
      String authorization) {
    final $url = '/create_all_kst_center_report';
    final $headers = {
      'authorization': authorization,
    };

    final $body = createAllKSTReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBSTWingNameRequestModel(
      GetBSTWingNameRequestModel getBSTWingNameRequestModel,
      String authorization) {
    final $url = '/get_bst_wing_name';
    final $headers = {
      'authorization': authorization,
    };

    final $body = getBSTWingNameRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createCenterBSTReport(
      CreateCenterBSTReportRequestModel createCenterBSTReportRequestModel,
      String authorization) {
    final $url = '/create_center_bst_report';
    final $headers = {
      'authorization': authorization,
    };

    final $body = createCenterBSTReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createCampusHangoutReport(
      CreateCampusHangoutReportRequestModel
          createCampusHangoutReportRequestModel,
      String authorization) {
    final $url = '/create_campus_hangout_report_api';
    final $headers = {
      'authorization': authorization,
    };

    final $body = createCampusHangoutReportRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> kstEducationMentoringList(
      KSTEducationMentoringListRequestModel
          kstEducationMentoringListRequestModel,
      String authorization) {
    final $url = '/get_kst_education_mentoring_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = kstEducationMentoringListRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> kst1On1MentoringList(
      KST1On1MentoringListRequestModel kst1On1MentoringListRequestModel,
      String authorization) {
    final $url = '/get_kst_1_on_1_mentoring_list';
    final $headers = {
      'authorization': authorization,
    };

    final $body = kst1On1MentoringListRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> educationMentoringInteractionDetails(
      EducationMentoringInteractionDetailsRequestModel
          educationMentoringInteractionDetailsRequestModel,
      String authorization) {
    final $url = '/get_kst_education_mentoring_form';
    final $headers = {
      'authorization': authorization,
    };

    final $body = educationMentoringInteractionDetailsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> k1On1MentoringInteractionDetails(
      K1On1MentoringInteractionDetailsRequestModel
          k1On1MentoringInteractionDetailsRequestModel,
      String authorization) {
    final $url = '/get_kst_1_on_1_mentoring_form';
    final $headers = {
      'authorization': authorization,
    };

    final $body = k1On1MentoringInteractionDetailsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitSabhaReportQuestions(
      Map<String, dynamic> submitSabhaReportQuestions, String authorization) {
    final $url = '/report_sabha_update';
    final $headers = {
      'authorization': authorization,
    };

    final $body = submitSabhaReportQuestions;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitInteractionsQuestionsDetails(
      Map<String, dynamic> submitSabhaReportQuestions, String authorization) {
    final $url = '/save_network_interaction_report';
    final $headers = {
      'authorization': authorization,
    };

    final $body = submitSabhaReportQuestions;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitCampusHangoutReport(
      Map<String, dynamic> submitCampusHangoutReport, String authorization) {
    final $url = '/submit_campus_hangout_report';
    final $headers = {
      'authorization': authorization,
    };

    final $body = submitCampusHangoutReport;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addKSTEducationMentoringForm(
      Map<String, dynamic> addKSTEducationMentoringForm, String authorization) {
    final $url = '/save_kst_education_mentoring_form';
    final $headers = {
      'authorization': authorization,
    };

    final $body = addKSTEducationMentoringForm;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addKST1On1MentoringForm(
      Map<String, dynamic> addKST1On1MentoringForm, String authorization) {
    final $url = '/save_kst_1_on_1_mentoring_form';
    final $headers = {
      'authorization': authorization,
    };

    final $body = addKST1On1MentoringForm;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getEventRegisterDetails(
      EventRegisterDetailsRequestModel eventRegisterDetailsRequestModel,
      String authorization) {
    final $url = '/eventregister';
    final $headers = {
      'authorization': authorization,
    };

    final $body = eventRegisterDetailsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLiabilityForm(
      LiabilityFormRequestModel liabilityFormRequestModel,
      String authorization) {
    final $url = '/getliabilityfrom';
    final $headers = {
      'authorization': authorization,
    };

    final $body = liabilityFormRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitLiabilityForm(
      String bkms_id,
      String event_id,
      String login_user_type,
      String login_parent_type,
      String liability_user_type,
      String signature,
      String approve_option,
      String initial_box1,
      String initial_box2,
      String initial_box3,
      String initial_box4,
      String initial_box5,
      String initial_box6,
      String initial_box7,
      String parents_name,
      String authorization) {
    final $url = '/submitliabilityfrom';
    final $headers = {
      'authorization': authorization,
    };

    final $parts = <PartValue>[
      PartValue<String>('bkms_id', bkms_id),
      PartValue<String>('event_id', event_id),
      PartValue<String>('login_user_type', login_user_type),
      PartValue<String>('login_parent_type', login_parent_type),
      PartValue<String>('liability_user_type', liability_user_type),
      PartValue<String>('signature', signature),
      PartValue<String>('approve_option', approve_option),
      PartValue<String>('initial_box1', initial_box1),
      PartValue<String>('initial_box2', initial_box2),
      PartValue<String>('initial_box3', initial_box3),
      PartValue<String>('initial_box4', initial_box4),
      PartValue<String>('initial_box5', initial_box5),
      PartValue<String>('initial_box6', initial_box6),
      PartValue<String>('initial_box7', initial_box7),
      PartValue<String>('parents_name', parents_name)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> eventWontBeAttend(
      EventWontBeAttendRequestModel eventWontBeAttendRequestModel,
      String authorization) {
    final $url = '/eventnotattend';
    final $headers = {
      'authorization': authorization,
    };

    final $body = eventWontBeAttendRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> eventRegistrationPayment(
      EventPaymentRequestModel eventPaymentRequestModel, String authorization) {
    final $url = '/eventregisterfee';
    final $headers = {
      'authorization': authorization,
    };

    final $body = eventPaymentRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> basicRegistrationFormDetails(
      BasicRegistrationFormRequestModel basicRegistrationFormRequestModel,
      String authorization) {
    final $url = '/basic_registration';
    final $headers = {
      'authorization': authorization,
    };

    final $body = basicRegistrationFormRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitBasicRegistrationDetails(String bkms_id,
      String event_id, MultipartFile signature, String authorization) {
    final $url = '/store_basic_registration';
    final $headers = {
      'authorization': authorization,
    };

    final $parts = <PartValue>[
      PartValue<String>('bkms_id', bkms_id),
      PartValue<String>('event_id', event_id),
      PartValueFile<MultipartFile>('signature', signature)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> stripeInfo(
      StripeInfoRequestModel stripeInfoRequestModel, String authorization) {
    final $url = '/create-payment-intent';
    final $headers = {
      'authorization': authorization,
    };

    final $body = stripeInfoRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> transportationDetails(
      TransportationRequestModel transportationRequestModel,
      String authorization) {
    final $url = '/gettransportlist';
    final $headers = {
      'authorization': authorization,
    };

    final $body = transportationRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> submitTransportationDetails(
      SubmitTransportationDetailsRequestModel
          submitTransportationDetailsRequestModel,
      String authorization) {
    final $url = '/savetransportation';
    final $headers = {
      'authorization': authorization,
    };

    final $body = submitTransportationDetailsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> checkIn(
      CheckInRequestModel checkInRequestModel, String authorization) {
    final $url = '/checkin';
    final $headers = {
      'authorization': authorization,
    };

    final $body = checkInRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> loadNotifications(
      LoadNotificationsRequestModel loadNotificationsRequestModel,
      String authorization) {
    final $url = '/getnotification';
    final $headers = {
      'authorization': authorization,
    };

    final $body = loadNotificationsRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> readNotification(
      ReadNotificationRequestModel readNotificationRequestModel,
      String authorization) {
    final $url = '/update_notification_status';
    final $headers = {
      'authorization': authorization,
    };

    final $body = readNotificationRequestModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
