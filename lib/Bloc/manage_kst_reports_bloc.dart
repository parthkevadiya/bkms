import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/create_all_kst_report_model.dart';
import 'package:flutter_app/models/kst_education_mentoring_list_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/networking_interaction_log_request_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/create_all_kst_report_request_model.dart';
import '../models/kst_1On1_mentoring_list_request_model.dart';
import '../models/kst_1on1_mentoring_list_model.dart';
import '../models/kst_education_mentoring_list_request_model.dart';
import '../models/manage_kst_attendance_model.dart';
import '../models/manage_kst_attendance_request_model.dart';
import '../models/manage_kst_quiz_score_model.dart';
import '../models/manage_kst_quiz_score_request_model.dart';
import '../models/manage_kst_report_model.dart';
import '../models/manage_kst_report_request_model.dart';
import '../models/networking_interaction_log_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'manage_kst_reports_bloc.freezed.dart';

@freezed
class ManageKSTReportState with _$ManageKSTReportState {
  const factory ManageKSTReportState.empty(LoadingStatus loadingStatus) = _ManageKSTReportEmpty;
  const factory ManageKSTReportState.manageKSTReports(
      ManageKSTReportModel? manageKSTReportModel, LoadingStatus loadingStatus) = _ReportStateManageKSTReports;
  const factory ManageKSTReportState.kst1On1MentoringList(
          KST1On1MentoringListModel? kst1On1MentoringListModel, LoadingStatus loadingStatus) =
      _ReportStateKST1On1MentoringList;
  const factory ManageKSTReportState.manageKSTAttendance(
          ManageKSTAttendanceModel? manageKSTAttendanceModel, LoadingStatus loadingStatus) =
      _ReportStateManageKSTAttendance;
  const factory ManageKSTReportState.manageKSTQuizScore(
      ManageKSTQuizScoreModel? manageKSTQuizScoreModel, LoadingStatus loadingStatus) = _ReportStateManageKSTQuizScore;
  const factory ManageKSTReportState.kstEducationMentoringList(
          KSTEducationMentoringListModel? kstEducationMentoringListModel, LoadingStatus loadingStatus) =
      _ReportStateKSTEducationMentoringList;
  const factory ManageKSTReportState.createAllKSTReport(
      CreateAllKSTReportModel? createAllKSTReportModel, LoadingStatus loadingStatus) = _ReportStateCreateAllKSTReport;
}

@freezed
class ManageKSTReportEvent with _$ManageKSTReportEvent {
  const factory ManageKSTReportEvent.manageKSTReports(
    BuildContext context,
    String kst_report_id,
    int page,
    int limit,
    String generic_search,
  ) = _manageKSTReports;
  const factory ManageKSTReportEvent.kst1On1MentoringList(
    BuildContext context,
    String kst_manage_report_id,
    String search_record,
    int page,
    int limit,
  ) = _kst1On1MentoringList;
  const factory ManageKSTReportEvent.manageKSTAttendance(
    BuildContext context,
    String kst_manage_report_id,
    String edit_mode,
    String selected_wing,
    String selected_center,
    String selected_region,
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
  ) = _manageKSTAttendance;
  const factory ManageKSTReportEvent.manageKSTQuizScore(
    BuildContext context,
    String kst_manage_report_id,
    String edit_mode,
    String selected_wing,
    String selected_center,
    String selected_region,
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
  ) = _manageKSTQuizScore;
  const factory ManageKSTReportEvent.kstEducationMentoringList(
    BuildContext context,
    String kst_manage_report_id,
    String search_record,
    int page,
    int limit,
  ) = _kstEducationMentoringList;
  const factory ManageKSTReportEvent.createAllKSTReport(
    BuildContext context,
    String report_center,
    String report_wing,
    bool all_center_report,
  ) = _createAllKSTReport;
}

@Singleton()
class ManageKSTReportBloc extends Bloc<ManageKSTReportEvent, ManageKSTReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  ManageKSTReportModel? manageKSTReportModel;
  KST1On1MentoringListModel? kst1on1mentoringListModel;
  ManageKSTAttendanceModel? manageKSTAttendanceModel;
  ManageKSTQuizScoreModel? manageKSTQuizScoreModel;
  KSTEducationMentoringListModel? kstEducationMentoringListModel;

  ManageKSTReportBloc(this._iReportService)
      : super(const ManageKSTReportState.manageKSTReports(null, LoadingStatus.Initialized)) {
    on<ManageKSTReportEvent>((event, emit) async {
      await event.when(
        manageKSTReports: (
          context,
          kst_report_id,
          page,
          limit,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(ManageKSTReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            manageKSTReportModel = null;
          }
          var manageKSTReportRequestModel = ManageKSTReportRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            page,
            limit,
            kst_report_id,
            generic_search,
          );

          final val = await await _iReportService.manageKSTReports(
              manageKSTReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (manageKSTReportModel == null) {
            manageKSTReportModel = val;
          } else {
            if (val != null) {
              manageKSTReportModel!.manage_kst_report!.data!.addAll(val.manage_kst_report!.data!);
            }
          }
          if (manageKSTReportModel == null) {
            emit(ManageKSTReportState.manageKSTReports(manageKSTReportModel, LoadingStatus.Error));
          } else {
            emit(ManageKSTReportState.manageKSTReports(manageKSTReportModel, LoadingStatus.Done));
          }
        },
        kst1On1MentoringList: (
          context,
          kst_manage_report_id,
          search_record,
          page,
          limit,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = _pref.getToken();
          emit(ManageKSTReportState.empty(LoadingStatus.Initialized));
          if (page == 1) {
            kst1on1mentoringListModel = null;
          }
          var kst1On1MentoringListRequestModel = KST1On1MentoringListRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            kst_manage_report_id,
            search_record,
            page,
            limit,
          );

          final val = await _iReportService.kst1On1MentoringList(
              kst1On1MentoringListRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (kst1on1mentoringListModel == null) {
            kst1on1mentoringListModel = val;
          } else {
            if (val != null) {
              kst1on1mentoringListModel!.result!.data!.addAll(val.result!.data!);
            }
          }
          if (kst1on1mentoringListModel == null) {
            emit(ManageKSTReportState.kst1On1MentoringList(kst1on1mentoringListModel, LoadingStatus.Error));
          } else {
            emit(ManageKSTReportState.kst1On1MentoringList(kst1on1mentoringListModel, LoadingStatus.Done));
          }
        },
        manageKSTAttendance: (
          context,
          kst_manage_report_id,
          edit_mode,
          selected_wing,
          selected_center,
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
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(ManageKSTReportState.empty(LoadingStatus.Initialized));
          if (page == 1) {
            manageKSTAttendanceModel = null;
          }
          var manageKSTAttendanceRequestModel = ManageKSTAttendanceRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            kst_manage_report_id,
            edit_mode,
            selected_wing,
            selected_center,
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

          final val = await _iReportService.manageKSTAttendance(
              manageKSTAttendanceRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (manageKSTAttendanceModel == null) {
            manageKSTAttendanceModel = val;
          } else {
            if (val != null) {
              manageKSTAttendanceModel!.kst_attendance_result!.data!.addAll(val.kst_attendance_result!.data!);
            }
          }
          if (manageKSTAttendanceModel == null) {
            emit(ManageKSTReportState.manageKSTAttendance(manageKSTAttendanceModel, LoadingStatus.Error));
          } else {
            emit(ManageKSTReportState.manageKSTAttendance(manageKSTAttendanceModel, LoadingStatus.Done));
          }
        },
        manageKSTQuizScore: (
          context,
          bst_fall_spring_report_data_id,
          edit_mode,
          selected_wing,
          selected_center,
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
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(ManageKSTReportState.empty(LoadingStatus.Initialized));
          if (page == 1) {
            manageKSTQuizScoreModel = null;
          }
          var manageKSTQuizScoreRequestModel = ManageKSTQuizScoreRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            bst_fall_spring_report_data_id,
            edit_mode,
            selected_wing,
            selected_center,
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

          final val = await _iReportService.manageKSTQuizScore(
              manageKSTQuizScoreRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (manageKSTQuizScoreModel == null) {
            manageKSTQuizScoreModel = val;
          } else {
            if (val != null) {
              manageKSTQuizScoreModel!.kst_quiz_score_result!.data!.addAll(val.kst_quiz_score_result!.data!);
            }
          }
          if (manageKSTQuizScoreModel == null) {
            emit(ManageKSTReportState.manageKSTQuizScore(manageKSTQuizScoreModel, LoadingStatus.Error));
          } else {
            emit(ManageKSTReportState.manageKSTQuizScore(manageKSTQuizScoreModel, LoadingStatus.Done));
          }
        },
        kstEducationMentoringList: (
          context,
          kst_manage_report_id,
          search_record,
          page,
          limit,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(ManageKSTReportState.empty(LoadingStatus.Initialized));
          if (page == 1) {
            kstEducationMentoringListModel = null;
          }
          var kstEducationMentoringListRequestModel = KSTEducationMentoringListRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            kst_manage_report_id,
            search_record,
            page,
            limit,
          );
          final val = await _iReportService.kstEducationMentoringList(
              kstEducationMentoringListRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (kstEducationMentoringListModel == null) {
            kstEducationMentoringListModel = val;
          } else {
            if (val != null) {
              kstEducationMentoringListModel!.result!.data!.addAll(val.result!.data!);
            }
          }
          if (kstEducationMentoringListModel == null) {
            emit(ManageKSTReportState.kstEducationMentoringList(kstEducationMentoringListModel, LoadingStatus.Error));
          } else {
            emit(ManageKSTReportState.kstEducationMentoringList(kstEducationMentoringListModel, LoadingStatus.Done));
          }
        },
        createAllKSTReport: (
          context,
          report_center,
          report_wing,
          all_center_report,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(ManageKSTReportState.empty(LoadingStatus.InProgress));
          var createAllKSTReportRequestModel = CreateAllKSTReportRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            report_center,
            report_wing,
            all_center_report,
          );
          final val = await _iReportService.createAllKSTReport(
              createAllKSTReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(ManageKSTReportState.createAllKSTReport(val, LoadingStatus.Done));
          } else {
            emit(ManageKSTReportState.createAllKSTReport(val, LoadingStatus.Error));
          }
        },
      );
    });
  }
}
