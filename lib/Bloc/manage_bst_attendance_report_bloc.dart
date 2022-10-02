import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/create_campus_hangout_report_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/create_all_bst_report_model.dart';
import '../models/create_all_bst_report_request_model.dart';
import '../models/create_center_bst_report_model.dart';
import '../models/create_center_bst_report_request_model.dart';
import '../models/manage_bst_attendance_model.dart';
import '../models/manage_bst_attendance_request_model.dart';
import '../models/manage_bst_niyam_assesment_model.dart';
import '../models/manage_bst_niyam_assesment_request_model.dart';
import '../models/manage_bst_quiz_score_model.dart';
import '../models/manage_bst_quiz_score_request_model.dart';
import '../models/manage_bst_report_model.dart';
import '../models/manage_bst_report_request_model.dart';
import '../models/user_group_wise_sub_group_model.dart';
import '../models/user_group_wise_sub_group_request_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'manage_bst_attendance_report_bloc.freezed.dart';

@freezed
class ManageBstAttendanceReportState with _$ManageBstAttendanceReportState {
  const factory ManageBstAttendanceReportState.empty(LoadingStatus loadingStatus) = _ManageNiyamReportEmpty;
  const factory ManageBstAttendanceReportState.manageBSTAttendance(
          ManageBSTAttendanceModel? manageBSTAttendanceModel, LoadingStatus loadingStatus) =
      _ReportStateManageBSTAttendance;
  const factory ManageBstAttendanceReportState.manageBSTQuizScore(
      ManageBSTQuizScoreModel? manageBSTQuizScoreModel, LoadingStatus loadingStatus) = _ReportStateManageBSTQuizScore;
}

@freezed
class ManageBstAttendanceReportEvent with _$ManageBstAttendanceReportEvent {
  const factory ManageBstAttendanceReportEvent.manageBSTAttendance(
    BuildContext context,
    String bst_fall_spring_report_data_id,
    String edit_mode,
    String selected_wing,
    String selected_region,
    String selected_center,
    String search_user_id,
    String group,
    String subgroup,
    String schoolyear,
    String first_name,
    String middle_name,
    String last_name,
    int page,
    int limit,
    String generic_search,
  ) = _manageBSTAttendance;
  const factory ManageBstAttendanceReportEvent.manageBSTQuizScore(
    BuildContext context,
    String bst_fall_spring_report_data_id,
    String edit_mode,
    String selected_wing,
    String selected_region,
    String selected_center,
    String search_user_id,
    String group,
    String subgroup,
    String schoolyear,
    String first_name,
    String middle_name,
    String last_name,
    int page,
    int limit,
    String generic_search,
  ) = _manageBSTQuizScore;
}

@Singleton()
class ManageBstAttendanceReportBloc extends Bloc<ManageBstAttendanceReportEvent, ManageBstAttendanceReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  ManageBSTNiyamAssesmentModel? manageBSTNiyamAssesmentModel;
  ManageBSTReportModel? manageBSTReportModel;
  ManageBSTAttendanceModel? manageBSTAttendanceModel;
  ManageBSTQuizScoreModel? manageBSTQuizScoreModel;

  ManageBstAttendanceReportBloc(this._iReportService)
      : super(const ManageBstAttendanceReportState.manageBSTAttendance(null, LoadingStatus.Initialized)) {
    on<ManageBstAttendanceReportEvent>((event, emit) async {
      await event.when(
        manageBSTAttendance: (
          context,
          bst_fall_spring_report_data_id,
          edit_mode,
          selected_wing,
          selected_region,
          selected_center,
          search_user_id,
          group,
          subgroup,
          schoolyear,
          first_name,
          middle_name,
          last_name,
          page,
          limit,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(ManageBstAttendanceReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            manageBSTAttendanceModel = null;
          }
          var manageBSTAttendanceRequestModel = ManageBSTAttendanceRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            bst_fall_spring_report_data_id,
            edit_mode,
            selected_wing,
            selected_region,
            selected_center,
            search_user_id,
            group,
            subgroup,
            schoolyear,
            first_name,
            middle_name,
            last_name,
            page,
            limit,
            generic_search,
          );
          final val = await await _iReportService.manageBSTAttendance(
              manageBSTAttendanceRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (manageBSTAttendanceModel == null) {
            manageBSTAttendanceModel = val;
          } else {
            if (val != null) {
              manageBSTAttendanceModel!.bst_attendance_list!.data!.addAll(val.bst_attendance_list!.data!);
            }
          }
          if (manageBSTAttendanceModel == null) {
            emit(ManageBstAttendanceReportState.manageBSTAttendance(manageBSTAttendanceModel, LoadingStatus.Error));
          } else {
            emit(ManageBstAttendanceReportState.manageBSTAttendance(manageBSTAttendanceModel, LoadingStatus.Done));
          }
        },
        manageBSTQuizScore: (
          context,
          bst_fall_spring_report_data_id,
          edit_mode,
          selected_wing,
          selected_region,
          selected_center,
          search_user_id,
          group,
          subgroup,
          schoolyear,
          first_name,
          middle_name,
          last_name,
          page,
          limit,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(ManageBstAttendanceReportState.empty(LoadingStatus.Initialized));
          if (page == 1) {
            manageBSTQuizScoreModel = null;
          }
          var manageBSTQuizScoreRequestModel = ManageBSTQuizScoreRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            bst_fall_spring_report_data_id,
            edit_mode,
            selected_wing,
            selected_region,
            search_user_id,
            group,
            subgroup,
            schoolyear,
            first_name,
            middle_name,
            last_name,
            page,
            limit,
            generic_search,
          );

          final val = await _iReportService.manageBSTQuizScore(
              manageBSTQuizScoreRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (manageBSTQuizScoreModel == null) {
            manageBSTQuizScoreModel = val;
          } else {
            if (val != null) {
              manageBSTQuizScoreModel!.bst_quiz_list!.data!.addAll(val.bst_quiz_list!.data!);
            }
          }
          if (manageBSTQuizScoreModel == null) {
            emit(ManageBstAttendanceReportState.manageBSTQuizScore(manageBSTQuizScoreModel, LoadingStatus.Error));
          } else {
            emit(ManageBstAttendanceReportState.manageBSTQuizScore(manageBSTQuizScoreModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
