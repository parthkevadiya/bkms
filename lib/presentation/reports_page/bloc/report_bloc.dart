import 'package:flutter/cupertino.dart';
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
import 'package:flutter_app/models/login_model.dart';
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
import 'package:flutter_app/presentation/reports_page/report_model.dart';
import 'package:flutter_app/services/report_all_service.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../bst_report_model.dart';
import '../campus_hangout_model.dart';
import '../goshthi_report_model.dart';
import '../kst_report_model.dart';
import '../networking_report_model.dart';
part 'report_bloc.freezed.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.empty(LoadingStatus loadingStatus) = _ReportStateEmpty;
  const factory ReportState.loadReports(
      ReportModel? reportModel,
      GoshthiReportModel? goshthiModel,
      NetworkingReportModel? networkingModel,
      BSTReportModel? bstModel,
      KSTReportModel? kstModel,
      CampusHangoutModel? campusHangoutModel,
      LoadingStatus loadingStatus) = _ReportStateLoadReports;
}

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.loadReports(
    BuildContext context,
    int page,
    int limit,
    int is_filter,
    String selected_region,
    String selected_center,
    String selected_wing,
    String hangOutYear,
    String sabha_year,
    String sabha_month,
    String sabha_week,
    String report_status,
  ) = _loadReports;
}

@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  ManageBSTNiyamAssesmentModel? manageBSTNiyamAssesmentModel;
  GoshthiReportModel? goshthiModel;
  NetworkingReportModel? networkingModel;
  BSTReportModel? bstModel;
  KSTReportModel? kstModel;
  SabhaReportAttendanceModel? sabhaReportAttendanceModel;
  KSTReportModel? kstReportModel;
  CampusHangoutModel? campusHangoutModel;
  NetworkingReportModel? networkingReportModel;
  ViewNetworkingReportListModel? viewNetworkingReportListModel;
  ManageKSTReportModel? manageKSTReportModel;
  ManageBSTAttendanceModel? manageBSTAttendanceModel;
  ManageBSTReportModel? manageBSTReportModel;
  ManageKSTAttendanceModel? manageKSTAttendanceModel;
  ManageKSTQuizScoreModel? manageKSTQuizScoreModel;
  KSTEducationMentoringListModel? kstEducationMentoringListModel;
  KST1On1MentoringListModel? kst1on1mentoringListModel;
  GoshthiReportAttendanceModel? goshthiReportAttendanceModel;
  ManageBSTQuizScoreModel? manageBSTQuizScoreModel;
  ReportBloc(this._iReportService)
      : super(
          ReportState.loadReports(null, null, null, null, null, null, LoadingStatus.Initialized),
        ) {
    on<ReportEvent>((event, emit) async {
      await event.when(
        loadReports: (context, page, limit, is_filter, selected_region, selected_center, selected_wing, hangOutYear,
            sabha_year, sabha_month, sabha_week, report_status) async {
          emit(ReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            reportModel = null;
          }
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          var reportRequestModel = ReportRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              is_filter,
              selected_region,
              selected_center,
              selected_wing,
              sabha_year,
              sabha_week,
              report_status,
              page,
              limit,
              "");

          var goshthiReportRequestModel = GoshthiReportRequestModel(
              Utils().nullSafeString(loginModel.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              selected_center,
              selected_region,
              sabha_month,
              sabha_year,
              // "sabha_gender"
              "",
              page,
              limit,
              "");

          var networkingReportRequestModel = NetworkingReportRequestModel(
              Utils().nullSafeString(loginModel.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              selected_region,
              selected_center,
              sabha_year,
              page,
              limit,
              "");
          var bstReportRequestModel = BSTReportRequestModel(
              Utils().nullSafeString(loginModel.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              selected_wing,
              selected_center,
              selected_region,
              sabha_year,
              page,
              limit,
              "");
          var kstReportRequestModel = KSTReportRequestModel(
              Utils().nullSafeString(loginModel.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              is_filter,
              selected_wing,
              selected_center,
              selected_region,
              sabha_year,
              page,
              limit,
              "");
          var campusHangoutRequestModel = CampusHangoutRequestModel(
              Utils().nullSafeString(loginModel.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              selected_wing,
              "",
              // selected_campus,
              selected_region,
              hangOutYear,
              page,
              limit,
              "");
          final respList = await Future.wait([
            _iReportService.loadReports(reportRequestModel, Utils().nullSafeString(loginModel.access_token), context),
            _iReportService.loadGoshthiReports(
                goshthiReportRequestModel, Utils().nullSafeString(loginModel.access_token), context),
            _iReportService.loadNetworkingReports(
                networkingReportRequestModel, Utils().nullSafeString(loginModel.access_token), context),
            _iReportService.loadBSTReports(
                bstReportRequestModel, Utils().nullSafeString(loginModel.access_token), context),
            _iReportService.loadKSTReports(
                kstReportRequestModel, Utils().nullSafeString(loginModel.access_token), context),
            _iReportService.campusHangout(
                campusHangoutRequestModel, Utils().nullSafeString(loginModel.access_token), context),
          ]);
          reportModel = respList[0];
          goshthiModel = respList[1];
          networkingModel = respList[2];
          bstModel = respList[3];
          kstModel = respList[4];
          campusHangoutModel = respList[5];
          if (reportModel == null ||
              goshthiModel == null ||
              networkingModel == null ||
              bstModel == null ||
              kstModel == null ||
              campusHangoutModel == null) {
            emit(ReportState.loadReports(reportModel, goshthiModel, networkingModel, bstModel, kstModel,
                campusHangoutModel, LoadingStatus.Error));
          } else {
            emit(ReportState.loadReports(reportModel, goshthiModel, networkingModel, bstModel, kstModel,
                campusHangoutModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
