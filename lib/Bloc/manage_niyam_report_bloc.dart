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
part 'manage_niyam_report_bloc.freezed.dart';

@freezed
class ManageNiyamReportState with _$ManageNiyamReportState {
  const factory ManageNiyamReportState.empty(LoadingStatus loadingStatus) = _ManageNiyamReportEmpty;
  const factory ManageNiyamReportState.manageBSTNiyamAssesment(
          ManageBSTNiyamAssesmentModel? amanageBSTNiyamAssesmentModel, LoadingStatus loadingStatus) =
      _ReportStateManageBSTNiyamAssesment;
  const factory ManageNiyamReportState.manageBSTReports(
      ManageBSTReportModel? manageBSTReportModel, LoadingStatus loadingStatus) = _ReportStateManageBSTReports;
  const factory ManageNiyamReportState.createCenterBSTReport(CreateCenterBSTReportModel? createCenterBSTReportModel) =
      _ReportStateCreateCenterBSTReport;
  const factory ManageNiyamReportState.createAllBSTReport(
      CreateAllBSTReportModel? createAllBSTReportModel, LoadingStatus loadingStatus) = _ReportStateCreateAllBSTReport;
  const factory ManageNiyamReportState.userGroupWiseSubGroup(
          UserGroupWiseSubGroupModel? userGroupWiseSubGroupModel, LoadingStatus loadingStatus) =
      _ReportStateUserGroupWiseSubGroup;
}

@freezed
class ManageNiyamReportEvent with _$ManageNiyamReportEvent {
  const factory ManageNiyamReportEvent.manageBSTNiyamAssesment(
    BuildContext context,
    String bst_center_report_id,
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
  ) = _manageBSTNiyamAssesment;
  const factory ManageNiyamReportEvent.manageBSTReports(
    BuildContext context,
    String campus_report_id,
    int page,
    int limit,
    String generic_search,
  ) = _manageBSTReports;
  const factory ManageNiyamReportEvent.createCenterBSTReport(
    BuildContext context,
    String report_center,
    String report_wing,
  ) = _createCenterBSTReport;
  const factory ManageNiyamReportEvent.createAllBSTReport(
    BuildContext context,
  ) = _createAllBSTReport;
  const factory ManageNiyamReportEvent.userGroupWiseSubGroup(
    BuildContext context,
    String center_id,
    String personal_wing_name,
    String group_name,
  ) = _userGroupWiseSubGroup;
}

@Singleton()
class ManageNiyamReportBloc extends Bloc<ManageNiyamReportEvent, ManageNiyamReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  ManageBSTNiyamAssesmentModel? manageBSTNiyamAssesmentModel;
  ManageBSTReportModel? manageBSTReportModel;
  ManageBSTAttendanceModel? manageBSTAttendanceModel;
  ManageBSTQuizScoreModel? manageBSTQuizScoreModel;

  ManageNiyamReportBloc(this._iReportService)
      : super(const ManageNiyamReportState.manageBSTNiyamAssesment(null, LoadingStatus.Initialized)) {
    on<ManageNiyamReportEvent>((event, emit) async {
      await event.when(
        manageBSTNiyamAssesment: (
          context,
          bst_center_report_id,
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
          var manageBSTNiyamAssesmentRequestModel = ManageBSTNiyamAssesmentRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            bst_center_report_id,
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
          emit(ManageNiyamReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            manageBSTNiyamAssesmentModel = null;
          }
          final val = await _iReportService.manageBSTNiyamAssesment(
              manageBSTNiyamAssesmentRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (manageBSTNiyamAssesmentModel == null) {
            manageBSTNiyamAssesmentModel = val;
          } else {
            if (val != null) {
              manageBSTNiyamAssesmentModel!.bst_niyam_assessment_result!.data!
                  .addAll(val.bst_niyam_assessment_result!.data!);
            }
          }
          if (manageBSTNiyamAssesmentModel == null) {
            emit(ManageNiyamReportState.manageBSTNiyamAssesment(manageBSTNiyamAssesmentModel, LoadingStatus.Error));
          } else {
            emit(ManageNiyamReportState.manageBSTNiyamAssesment(manageBSTNiyamAssesmentModel, LoadingStatus.Done));
          }
        },
        manageBSTReports: (
          context,
          bst_center_report_id,
          page,
          limit,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var manageBSTReportRequestModel = ManageBSTReportRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            page,
            limit,
            bst_center_report_id,
            generic_search,
          );
          emit(ManageNiyamReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            manageBSTReportModel = null;
          }

          final val = await await _iReportService.manageBSTReports(
              manageBSTReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (manageBSTReportModel == null) {
            manageBSTReportModel = val;
          } else {
            if (val != null) {
              manageBSTReportModel!.manage_bst_report_list!.data!.addAll(val.manage_bst_report_list!.data!);
            }
          }
          if (manageBSTReportModel == null) {
            emit(ManageNiyamReportState.manageBSTReports(manageBSTReportModel, LoadingStatus.Error));
          } else {
            emit(ManageNiyamReportState.manageBSTReports(manageBSTReportModel, LoadingStatus.Done));
          }
        },
        createCenterBSTReport: (
          context,
          report_center,
          report_wing,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var createCenterBSTReportRequestModel = CreateCenterBSTReportRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            report_center,
            report_wing,
          );

          emit(ManageNiyamReportState.createCenterBSTReport(await _iReportService.createCenterBSTReport(
              createCenterBSTReportRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
        createAllBSTReport: (
          context,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(ManageNiyamReportState.empty(LoadingStatus.InProgress));
          var createAllBSTReportRequestModel = CreateAllBSTReportRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
          );
          final val = await _iReportService.createAllBSTReport(
              createAllBSTReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(ManageNiyamReportState.createAllBSTReport(val, LoadingStatus.Done));
          } else {
            emit(ManageNiyamReportState.createAllBSTReport(val, LoadingStatus.Error));
          }
        },
        userGroupWiseSubGroup: (
          context,
          center_id,
          personal_wing_name,
          group_name,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var userGroupWiseSubGroupRequestModel = UserGroupWiseSubGroupRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            center_id,
            personal_wing_name,
            group_name,
          );
          final val = await _iReportService.userGroupWiseSubGroup(
              userGroupWiseSubGroupRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(ManageNiyamReportState.userGroupWiseSubGroup(val, LoadingStatus.Done));
          } else {
            emit(ManageNiyamReportState.userGroupWiseSubGroup(val, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
