import 'package:flutter_app/api_calling_class/chopper_class.dart';
import 'package:flutter_app/models/add_1_on_1_mentoring_form_request_model.dart';
import 'package:flutter_app/models/add_education_mentoring_form_request_model.dart';
import 'package:flutter_app/models/bst_report_request_model.dart';
import 'package:flutter_app/models/campus_hangout_details_request_model.dart';
import 'package:flutter_app/models/campus_hangout_region_request_model.dart';
import 'package:flutter_app/models/campus_hangout_request_model.dart';
import 'package:flutter_app/models/campus_wise_hangout_types_request_model.dart';
import 'package:flutter_app/models/center_wise_interaction_request_model.dart';
import 'package:flutter_app/models/create_all_bst_report_request_model.dart';
import 'package:flutter_app/models/create_all_kst_report_request_model.dart';
import 'package:flutter_app/models/create_campus_hangout_report_request_model.dart';
import 'package:flutter_app/models/create_center_bst_report_request_model.dart';
import 'package:flutter_app/models/create_interaction_details_request_model.dart';
import 'package:flutter_app/models/education_mentoring_interaction_details_request_model.dart';
import 'package:flutter_app/models/get_bst_wing_name_request_model.dart';
import 'package:flutter_app/models/goshthi_report_attendance_request_model.dart';
import 'package:flutter_app/models/goshthi_report_request_model.dart';
import 'package:flutter_app/models/h_region_wise_campus_request_model.dart';
import 'package:flutter_app/models/hangout_type_wise_questions_request_model.dart';
import 'package:flutter_app/models/interaction_wise_questions_request_model.dart';
import 'package:flutter_app/models/k1On1_mentoring_interaction_details_request_model.dart';
import 'package:flutter_app/models/kst_1On1_mentoring_list_request_model.dart';
import 'package:flutter_app/models/kst_education_mentoring_list_request_model.dart';
import 'package:flutter_app/models/kst_report_request_model.dart';
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
import 'package:flutter_app/models/region_wise_campus_request_model.dart';
import 'package:flutter_app/models/report_request_model.dart';
import 'package:flutter_app/models/sabha_report_attendance_request_model.dart';
import 'package:flutter_app/models/sabha_report_questions_request_model.dart';
import 'package:flutter_app/models/sabha_sabha_report_attendance_request_model.dart';
import 'package:flutter_app/models/save_bst_quiz_score_request_model.dart';
import 'package:flutter_app/models/save_kst_quiz_score_request_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_attendance_request_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_report_request_model.dart';
import 'package:flutter_app/models/submit_goshthi_report_attendance_request_model.dart';
import 'package:flutter_app/models/submit_interaction_questions_request_model.dart';
import 'package:flutter_app/models/submit_sabha_report_request_model.dart';
import 'package:flutter_app/models/take_bst_attendance_request_model.dart';
import 'package:flutter_app/models/take_campus_hangout_attendance_request_model.dart';
import 'package:flutter_app/models/take_kst_attendance_request_model.dart';
import 'package:flutter_app/models/update_bst_niyam_assesment_score_request_model.dart';
import 'package:flutter_app/models/update_goshthi_held_status_request_model.dart';
import 'package:flutter_app/models/user_group_wise_sub_group_request_model.dart';
import 'package:flutter_app/models/view_hangout_report_request_model.dart';
import 'package:flutter_app/models/view_networking_report_list_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class IReportService {
  Future<dynamic> loadReports(
      ReportRequestModel reportRequestModel, accessToken, context);
  Future<dynamic> loadSabhaReports(
      ReportRequestModel sabhaReportRequestModel, accessToken, context);
  Future<dynamic> loadNetworkingReports(
      NetworkingReportRequestModel networkingReportRequestModel,
      accessToken,
      context);
  Future<dynamic> loadGoshthiReports(
      GoshthiReportRequestModel goshthiReportRequestModel,
      accessToken,
      context);
  Future<dynamic> loadBSTReports(
      BSTReportRequestModel bstReportRequestModel, accessToken, context);
  Future<dynamic> loadKSTReports(
      KSTReportRequestModel kstReportRequestModel, accessToken, context);
  Future<dynamic> campusHangout(
      CampusHangoutRequestModel campusHangoutRequestModel,
      accessToken,
      context);
  Future<dynamic> sabhaReportQuestions(
      SabhaReportQuestionsRequestModel sabhaReportQuestionsRequestModel,
      accessToken,
      context);
  Future<dynamic> sabhaReportAttendance(
      SabhaReportAttendanceRequestModel sabhaReportAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> goshthiReportAttendance(
      GoshthiReportAttendanceRequestModel goshthiReportAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> submitSabhaReportAttendance(
      SubmitSabhaReportAttendanceRequestModel
          submitSabhaReportAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> submitGoshthiReportAttendance(
      SubmitGoshthiReportAttendanceRequestModel
          submitGoshthiReportAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> submitSabhaReportQuestions(
      List<SubmitSabhaReportQuestionsRequestModel>
          submitSabhaReportQuestionsRequestModel,
      accessToken,
      context);
  Future<dynamic> updateGoshthiHeldStatus(
      UpdateGoshthiHeldStatusRequestModel updateGoshthiHeldStatusRequestModel,
      accessToken,
      context);
  Future<dynamic> viewNetworkingReportList(
      ViewNetworkingReportListRequestModel viewNetworkingReportListRequestModel,
      accessToken,
      context);
  Future<dynamic> networkingInteractionLog(
      NetworkingInteractionLogRequestModel networkingInteractionLogRequestModel,
      accessToken,
      context);
  Future<dynamic> networkingInteractionDetails(
      NetworkingInteractionDetailsRequestModel
          networkingInteractionDetailsRequestModel,
      accessToken,
      context);
  Future<dynamic> createInteractionDetails(
      CreateInteractionDetailsRequestModel createInteractionDetailsRequestModel,
      accessToken,
      context);
  Future<dynamic> centerWiseInteractionTypes(
      CenterWiseInteractionRequestModel centerWiseInteractionRequestModel,
      accessToken,
      context);
  Future<dynamic> interactionWiseQuestions(
      InteractionsWiseQuestionsRequestModel
          interactionsWiseQuestionsRequestModel,
      accessToken,
      context);
  Future<dynamic> submitInteractionsQuestionsDetails(
      List<SubmitInteractionsQuestionsRequestModel>
          submitInteractionsQuestionsRequestModel,
      accessToken,
      context);
  Future<dynamic> manageBSTReports(
      ManageBSTReportRequestModel manageBSTReportRequestModel,
      accessToken,
      context);
  Future<dynamic> manageKSTReports(
      ManageKSTReportRequestModel manageKSTReportRequestModel,
      accessToken,
      context);
  Future<dynamic> manageBSTAttendance(
      ManageBSTAttendanceRequestModel manageBSTAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> manageKSTAttendance(
      ManageKSTAttendanceRequestModel manageKSTAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> manageBSTQuizScore(
      ManageBSTQuizScoreRequestModel manageBSTQuizScoreRequestModel,
      accessToken,
      context);
  Future<dynamic> manageKSTQuizScore(
      ManageKSTQuizScoreRequestModel manageKSTQuizScoreRequestModel,
      accessToken,
      context);
  Future<dynamic> userGroupWiseSubGroup(
      UserGroupWiseSubGroupRequestModel userGroupWiseSubGroupRequestModel,
      accessToken,
      context);
  Future<dynamic> takeBSTAttendance(
      TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> takeKSTAttendance(
      TakeKSTAttendanceRequestModel takeKSTAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> saveBSTQuizScore(
      SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel,
      accessToken,
      context);
  Future<dynamic> saveKSTQuizScore(
      SaveKSTQuizScoreRequestModel saveKSTQuizScoreRequestModel,
      accessToken,
      context);
  Future<dynamic> manageBSTNiyamAssesment(
      ManageBSTNiyamAssesmentRequestModel manageBSTNiyamAssesmentRequestModel,
      accessToken,
      context);
  Future<dynamic> updateBSTNiyamAssesmentScore(
      UpdateBSTNiyamAssesmentScoreRequestModel
          updateBSTNiyamAssesmentScoreRequestModel,
      accessToken,
      context);
  Future<dynamic> regionWiseCampus(
      RegionWiseCampusRequestModel regionWiseCampusRequestModel,
      accessToken,
      context);
  Future<dynamic> viewHangoutReport(
      ViewHangoutReportRequestModel viewHangoutReportRequestModel,
      accessToken,
      context);
  Future<dynamic> campusHangoutRegion(
      CampusHangoutRegionRequestModel campusHangoutRegionRequestModel,
      accessToken,
      context);
  Future<dynamic> hRegionWiseCampus(
      HRegionWiseCampusRequestModel hRegionWiseCampusRequestModel,
      accessToken,
      context);
  Future<dynamic> campusWiseHangoutTypes(
      CampusWiseHangoutTypesRequestModel campusWiseHangoutTypesRequestModel,
      accessToken,
      context);
  Future<dynamic> hangoutTypeWiseQuestions(
      HangoutTypeWiseQuestionsRequestModel hangoutTypeWiseQuestionsRequestModel,
      accessToken,
      context);
  Future<dynamic> submitCampusHangoutAttendance(
      SubmitCampusHangoutAttendanceRequestModel
          submitCampusHangoutAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> takeCampusHangoutAttendance(
      TakeCampusHangoutAttendanceRequestModel
          takeCampusHangoutAttendanceRequestModel,
      accessToken,
      context);
  Future<dynamic> submitCampusHangoutReport(
      List<SubmitCampusHangoutReportRequestModel>
          submitCampusHangoutReportRequestModel,
      accessToken,
      context);
  Future<dynamic> campusHangoutReportDetails(
      CampusHangoutReportDetailsRequestModel
          campusHangoutReportDetailsRequestModel,
      accessToken,
      context);
  Future<dynamic> createAllBSTReport(
      CreateAllBSTReportRequestModel createAllBSTReportRequestModel,
      accessToken,
      context);
  Future<dynamic> createAllKSTReport(
      CreateAllKSTReportRequestModel createAllKSTReportRequestModel,
      accessToken,
      context);
  Future<dynamic> getBSTWingName(
      GetBSTWingNameRequestModel getBSTWingNameRequestModel,
      accessToken,
      context);
  Future<dynamic> createCenterBSTReport(
      CreateCenterBSTReportRequestModel createCenterBSTReportRequestModel,
      accessToken,
      context);
  Future<dynamic> createCampusHangoutReport(
      CreateCampusHangoutReportRequestModel
          createCampusHangoutReportRequestModel,
      accessToken,
      context);
  Future<dynamic> kstEducationMentoringList(
      KSTEducationMentoringListRequestModel
          kstEducationMentoringListRequestModel,
      accessToken,
      context);
  Future<dynamic> kst1On1MentoringList(
      KST1On1MentoringListRequestModel kstEducationMentoringListRequestModel,
      accessToken,
      context);
  Future<dynamic> educationMentoringInteractionDetails(
      EducationMentoringInteractionDetailsRequestModel
          educationMentoringInteractionDetailsRequestModel,
      accessToken,
      context);
  Future<dynamic> k1On1MentoringInteractionDetails(
      K1On1MentoringInteractionDetailsRequestModel
          k1On1MentoringInteractionDetailsRequestModel,
      accessToken,
      context);
  Future<dynamic> addKSTEducationMentoringForm(
      List<AddEducationMentoringFormRequestModel>
          addKSTEducationMentoringFormRequestModel,
      accessToken,
      context);
  Future<dynamic> addKST1On1MentoringForm(
      List<Add1On1MentoringFormRequestModel>
          addKST1On1MentoringFormRequestModel,
      accessToken,
      context);
}

@Singleton(as: IReportService)
class ReportService implements IReportService {
  CommonChopperClass commonChopperClass = CommonChopperClass();

  @override
  Future<dynamic> loadReports(reportRequestModel, accessToken, context) async {
    return await commonChopperClass.loadReports(
        reportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> loadSabhaReports(
      sabhaReportRequestModel, accessToken, context) async {
    return await commonChopperClass.loadReports(
        sabhaReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> loadNetworkingReports(
      networkingReportRequestModel, accessToken, context) async {
    return await commonChopperClass.loadNetworkingReports(
        networkingReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> loadBSTReports(
      bstReportRequestModel, accessToken, context) async {
    return await commonChopperClass.loadBSTReports(
        bstReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> loadKSTReports(
      kstReportRequestModel, accessToken, context) async {
    return await commonChopperClass.loadKSTReports(
        kstReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> campusHangout(
      campusHangoutRequestModel, accessToken, context) async {
    return await commonChopperClass.campusHangout(
        campusHangoutRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> sabhaReportQuestions(
      sabhaReportQuestionsRequestModel, accessToken, context) async {
    return await commonChopperClass.sabhaReportQuestions(
        sabhaReportQuestionsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> sabhaReportAttendance(
      sabhaReportAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.sabhaReportAttendance(
        sabhaReportAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> goshthiReportAttendance(
      goshthiReportAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.goshthiReportAttendance(
        goshthiReportAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitSabhaReportAttendance(
      submitSabhaReportAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.submitSabhaReportAttendance(
        submitSabhaReportAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitGoshthiReportAttendance(
      submitGoshthiReportAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.submitGoshthiReportAttendance(
        submitGoshthiReportAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitSabhaReportQuestions(
      submitSabhaReportQuestionsRequestModel, accessToken, context) async {
    return await commonChopperClass.submitSabhaReportQuestions(
        submitSabhaReportQuestionsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> loadGoshthiReports(
      goshthiReportRequestModel, accessToken, context) async {
    return await commonChopperClass.loadGoshthiReports(
        goshthiReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> updateGoshthiHeldStatus(
      updateGoshthiHeldStatusRequestModel, accessToken, context) async {
    return await commonChopperClass.updateGoshthiHeldStatus(
        updateGoshthiHeldStatusRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> viewNetworkingReportList(
      viewNetworkingReportListRequestModel, accessToken, context) async {
    return await commonChopperClass.viewNetworkingReportList(
        viewNetworkingReportListRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> networkingInteractionLog(
      networkingInteractionLogRequestModel, accessToken, context) async {
    return await commonChopperClass.networkingInteractionLog(
        networkingInteractionLogRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> networkingInteractionDetails(
      networkingInteractionDetailsRequestModel, accessToken, context) async {
    return await commonChopperClass.networkingInteractionDetails(
        networkingInteractionDetailsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> createInteractionDetails(
      createInteractionDetailsRequestModel, accessToken, context) async {
    return await commonChopperClass.createInteractionDetails(
        createInteractionDetailsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> centerWiseInteractionTypes(
      centerWiseInteractionRequestModel, accessToken, context) async {
    return await commonChopperClass.centerWiseInteractionTypes(
        centerWiseInteractionRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> interactionWiseQuestions(
      interactionsWiseQuestionsRequestModel, accessToken, context) async {
    return await commonChopperClass.interactionWiseQuestions(
        interactionsWiseQuestionsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitInteractionsQuestionsDetails(
      submitInteractionsQuestionsRequestModel, accessToken, context) async {
    return await commonChopperClass.submitInteractionsQuestionsDetails(
        submitInteractionsQuestionsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> manageBSTReports(
      manageBSTReportRequestModel, accessToken, context) async {
    return await commonChopperClass.manageBSTReports(
        manageBSTReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> manageKSTReports(
      manageKSTReportRequestModel, accessToken, context) async {
    return await commonChopperClass.manageKSTReports(
        manageKSTReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> manageBSTAttendance(
      manageBSTAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.manageBSTAttendance(
        manageBSTAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> manageKSTAttendance(
      manageKSTAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.manageKSTAttendance(
        manageKSTAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> userGroupWiseSubGroup(
      userGroupWiseSubGroupRequestModel, accessToken, context) async {
    return await commonChopperClass.userGroupWiseSubGroup(
        userGroupWiseSubGroupRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> takeBSTAttendance(
      takeBSTAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.takeBSTAttendance(
        takeBSTAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> takeKSTAttendance(
      takeKSTAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.takeKSTAttendance(
        takeKSTAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> manageBSTQuizScore(
      manageBSTQuizScoreRequestModel, accessToken, context) async {
    return await commonChopperClass.manageBSTQuizScore(
        manageBSTQuizScoreRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> manageKSTQuizScore(
      manageKSTQuizScoreRequestModel, accessToken, context) async {
    return await commonChopperClass.manageKSTQuizScore(
        manageKSTQuizScoreRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> saveBSTQuizScore(
      saveBSTQuizScoreRequestModel, accessToken, context) async {
    return await commonChopperClass.saveBSTQuizScore(
        saveBSTQuizScoreRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> saveKSTQuizScore(
      saveKSTQuizScoreRequestModel, accessToken, context) async {
    return await commonChopperClass.saveKSTQuizScore(
        saveKSTQuizScoreRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> manageBSTNiyamAssesment(
      manageBSTNiyamAssesmentRequestModel, accessToken, context) async {
    return await commonChopperClass.manageBSTNiyamAssesment(
        manageBSTNiyamAssesmentRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> updateBSTNiyamAssesmentScore(
      updateBSTNiyamAssesmentScoreRequestModel, accessToken, context) async {
    return await commonChopperClass.updateBSTNiyamAssesmentScore(
        updateBSTNiyamAssesmentScoreRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> regionWiseCampus(
      regionWiseCampusRequestModel, accessToken, context) async {
    return await commonChopperClass.regionWiseCampus(
        regionWiseCampusRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> viewHangoutReport(
      viewHangoutReportRequestModel, accessToken, context) async {
    return await commonChopperClass.viewHangoutReport(
        viewHangoutReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> campusHangoutRegion(
      campusHangoutRegionRequestModel, accessToken, context) async {
    return await commonChopperClass.campusHangoutRegion(
        campusHangoutRegionRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> hRegionWiseCampus(
      hRegionWiseCampusRequestModel, accessToken, context) async {
    return await commonChopperClass.hRegionWiseCampus(
        hRegionWiseCampusRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> campusWiseHangoutTypes(
      campusWiseHangoutTypesRequestModel, accessToken, context) async {
    return await commonChopperClass.campusWiseHangoutTypes(
        campusWiseHangoutTypesRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> hangoutTypeWiseQuestions(
      hangoutTypeWiseQuestionsRequestModel, accessToken, context) async {
    return await commonChopperClass.hangoutTypeWiseQuestions(
        hangoutTypeWiseQuestionsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitCampusHangoutAttendance(
      submitCampusHangoutAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.submitCampusHangoutAttendance(
        submitCampusHangoutAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> takeCampusHangoutAttendance(
      takeCampusHangoutAttendanceRequestModel, accessToken, context) async {
    return await commonChopperClass.takeCampusHangoutAttendance(
        takeCampusHangoutAttendanceRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> submitCampusHangoutReport(
      submitCampusHangoutReportRequestModel, accessToken, context) async {
    return await commonChopperClass.submitCampusHangoutReport(
        submitCampusHangoutReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> campusHangoutReportDetails(
      campusHangoutReportDetailsRequestModel, accessToken, context) async {
    return await commonChopperClass.campusHangoutReportDetails(
        campusHangoutReportDetailsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> createAllBSTReport(
      createAllBSTReportRequestModel, accessToken, context) async {
    return await commonChopperClass.createAllBSTReport(
        createAllBSTReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> createAllKSTReport(
      createAllKSTReportRequestModel, accessToken, context) async {
    return await commonChopperClass.createAllKSTReport(
        createAllKSTReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> getBSTWingName(
      getBSTWingNameRequestModel, accessToken, context) async {
    return await commonChopperClass.getBSTWingName(
        getBSTWingNameRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> createCenterBSTReport(
      createCenterBSTReportRequestModel, accessToken, context) async {
    return await commonChopperClass.createCenterBSTReport(
        createCenterBSTReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> createCampusHangoutReport(
      createCampusHangoutReportRequestModel, accessToken, context) async {
    return await commonChopperClass.createCampusHangoutReport(
        createCampusHangoutReportRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> kstEducationMentoringList(
      kstEducationMentoringListRequestModel, accessToken, context) async {
    return await commonChopperClass.kstEducationMentoringList(
        kstEducationMentoringListRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> kst1On1MentoringList(
      kst1On1MentoringListRequestModel, accessToken, context) async {
    return await commonChopperClass.kst1On1MentoringList(
        kst1On1MentoringListRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> educationMentoringInteractionDetails(
      educationMentoringInteractionDetailsRequestModel,
      accessToken,
      context) async {
    return await commonChopperClass.educationMentoringInteractionDetails(
        educationMentoringInteractionDetailsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> k1On1MentoringInteractionDetails(
      k1On1MentoringInteractionDetailsRequestModel,
      accessToken,
      context) async {
    return await commonChopperClass.k1On1MentoringInteractionDetails(
        k1On1MentoringInteractionDetailsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> addKSTEducationMentoringForm(
      addKSTEducationMentoringFormRequestModel, accessToken, context) async {
    return await commonChopperClass.addKSTEducationMentoringForm(
        addKSTEducationMentoringFormRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> addKST1On1MentoringForm(
      addKST1On1MentoringFormRequestModel, accessToken, context) async {
    return await commonChopperClass.addKST1On1MentoringForm(
        addKST1On1MentoringFormRequestModel, accessToken, context);
  }
}
