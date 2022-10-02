import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/submit_sabha_report_request_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/sabha_report_attendance_model.dart';
import '../models/sabha_report_attendance_request_model.dart';
import '../models/sabha_report_questions_model.dart';
import '../models/sabha_report_questions_request_model.dart';
import '../models/sabha_sabha_report_attendance_request_model.dart';
import '../models/submit_sabha_report_attendance_model.dart';
import '../models/submit_sabha_report_questions_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'sabha_report_question_bloc.freezed.dart';

@freezed
class SabhaReportQuestionAttendanceState
    with _$SabhaReportQuestionAttendanceState {
  const factory SabhaReportQuestionAttendanceState.empty(
      LoadingStatus loadingStatus) = _SabhaReportQuestionEmpty;
  const factory SabhaReportQuestionAttendanceState.sabhaReportQuestions(
      SabhaReportQuestionsModel? sabhaReportQuestionsModel,
      LoadingStatus loadingStatus) = _ReportStateSabhaReportQuestions;
  const factory SabhaReportQuestionAttendanceState.sabhaReportAttendance(
      SabhaReportAttendanceModel? sabhaReportAttendanceModel,
      LoadingStatus loadingStatus) = _ReportStateSabhaReportAttendance;
  const factory SabhaReportQuestionAttendanceState.submitSabhaReportQuestions(
      SubmitSabhaReportQuestionsModel? submitSabhaReportQuestionsRequestItems,
      LoadingStatus
          loadingStatus) = _ReportStateSubmitSabhaReportQuestionsModel;
  const factory SabhaReportQuestionAttendanceState.submitSabhaReportAttendance(
      SubmitSabhaReportAttendanceModel? submitSabhaReportAttendanceModel,
      LoadingStatus loadingStatus) = _ReportStateSubmitSabhaReportAttendance;
}

@freezed
class SabhaReportQuestionAttendanceEvent
    with _$SabhaReportQuestionAttendanceEvent {
  const factory SabhaReportQuestionAttendanceEvent.sabhaReportQuestions(
    BuildContext context,
    String sabha_id,
  ) = _sabhaReportQuestions;
  const factory SabhaReportQuestionAttendanceEvent.sabhaReportAttendance(
      BuildContext context,
      String sabha_id,
      int page,
      int limit,
      String search_name,
      String selected_wing,
      String selected_center,
      String selected_region,
      String edit_mode) = _sabhaReportAttendance;
  const factory SabhaReportQuestionAttendanceEvent.submitSabhaReportQuestions(
      BuildContext context,
      List<SubmitSabhaReportQuestionsRequestModel>
          submitSabhaReportQuestionsRequestModel) = _submitSabhaReportQuestions;
  const factory SabhaReportQuestionAttendanceEvent.submitSabhaReportAttendance(
      BuildContext context,
      String sabha_id,
      String user_id,
      String status,
      String user_group_name,
      String user_wing_name,
      String user_school_year_name) = _submitSabhaReportAttendance;
}

@Singleton()
class SabhaReportQuestionAttendanceBloc extends Bloc<
    SabhaReportQuestionAttendanceEvent, SabhaReportQuestionAttendanceState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  SabhaReportAttendanceModel? sabhaReportAttendanceModel;

  SabhaReportQuestionAttendanceBloc(this._iReportService)
      : super(const SabhaReportQuestionAttendanceState.sabhaReportQuestions(
            null, LoadingStatus.Initialized)) {
    on<SabhaReportQuestionAttendanceEvent>((event, emit) async {
      await event.when(
        sabhaReportQuestions: (context, sabha_id) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(
            SabhaReportQuestionAttendanceState.empty(LoadingStatus.Initialized),
          );
          var sabhaReportQuestionsRequestModel =
              SabhaReportQuestionsRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            sabha_id,
          );
          final val = await _iReportService.sabhaReportQuestions(
              sabhaReportQuestionsRequestModel,
              Utils().nullSafeString(loginModel.access_token),
              context);
          if (val != null) {
            emit(SabhaReportQuestionAttendanceState.sabhaReportQuestions(
              val,
              LoadingStatus.Done,
            ));
          } else {
            emit(SabhaReportQuestionAttendanceState.sabhaReportQuestions(
              val,
              LoadingStatus.Error,
            ));
          }
        },
        sabhaReportAttendance: (context, sabha_id, page, limit, search_name,
            selected_wing, selected_center, selected_region, edit_mode) async {
          emit(SabhaReportQuestionAttendanceState.empty(
              LoadingStatus.Initialized));
          if (page == 1) {
            sabhaReportAttendanceModel = null;
          }
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var sabhaReportAttendanceRequestModel =
              SabhaReportAttendanceRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            sabha_id,
            page,
            limit,
            search_name,
            selected_wing,
            selected_center,
            selected_region,
            edit_mode,
          );

          final val = await _iReportService.sabhaReportAttendance(
              sabhaReportAttendanceRequestModel,
              Utils().nullSafeString(loginModel.access_token),
              context);

          if (sabhaReportAttendanceModel == null) {
            sabhaReportAttendanceModel = val;
          } else {
            if (val != null) {
              sabhaReportAttendanceModel!.attendance_result!.data!
                  .addAll(val.attendance_result!.data!);
            }
          }
          if (sabhaReportAttendanceModel == null) {
            emit(SabhaReportQuestionAttendanceState.sabhaReportAttendance(
                sabhaReportAttendanceModel, LoadingStatus.Error));
          } else {
            emit(SabhaReportQuestionAttendanceState.sabhaReportAttendance(
                sabhaReportAttendanceModel, LoadingStatus.Done));
          }
        },
        submitSabhaReportQuestions:
            (context, submitSabhaReportQuestionsRequestItems) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          final val = await _iReportService.submitSabhaReportQuestions(
              submitSabhaReportQuestionsRequestItems,
              Utils().nullSafeString(loginModel!.access_token),
              context);
          if (val != null) {
            emit(SabhaReportQuestionAttendanceState.submitSabhaReportQuestions(
                val, LoadingStatus.Done));
          } else {
            emit(SabhaReportQuestionAttendanceState.submitSabhaReportQuestions(
                val, LoadingStatus.Error));
          }
        },
        submitSabhaReportAttendance: (context, sabha_id, user_id, status,
            user_group_name, user_wing_name, user_school_year_name) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var submitSabhaReportAttendanceRequestModel =
              SubmitSabhaReportAttendanceRequestModel(
                  Utils()
                      .nullSafeString(loginModel!.login_user_type.toString()),
                  Utils().nullSafeString(loginModel.login_parent_type),
                  Utils().nullSafeString(loginModel.role),
                  Utils().nullSafeInt(loginModel.bkms_id).toString(),
                  sabha_id,
                  user_id,
                  status,
                  user_group_name,
                  user_wing_name,
                  user_school_year_name);
          final val = await _iReportService.submitSabhaReportAttendance(
              submitSabhaReportAttendanceRequestModel,
              Utils().nullSafeString(loginModel.access_token),
              context);
          if (val != null) {
            emit(SabhaReportQuestionAttendanceState.submitSabhaReportAttendance(
                val, LoadingStatus.Done));
          } else {
            emit(SabhaReportQuestionAttendanceState.submitSabhaReportAttendance(
                val, LoadingStatus.Error));
          }
        },
      );
    });
  }
}
