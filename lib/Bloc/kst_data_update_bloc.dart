import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/add_education_mentoring_form_model.dart';
import 'package:flutter_app/models/add_education_mentoring_form_request_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/add_1_on_1_mentoring_form_request_model.dart';
import '../models/add_1on1_mentoring_form_model.dart';
import '../models/education_mentoring_interaction_details_model.dart';
import '../models/education_mentoring_interaction_details_request_model.dart';
import '../models/k1On1_mentoring_interaction_details_model.dart';
import '../models/k1On1_mentoring_interaction_details_request_model.dart';
import '../models/save_kst_quiz_score_model.dart';
import '../models/save_kst_quiz_score_request_model.dart';
import '../models/take_kst_attendance_model.dart';
import '../models/take_kst_attendance_request_model.dart';
import '../services/report_all_service.dart';
part 'kst_data_update_bloc.freezed.dart';

@freezed
class KSTDataUpdateState with _$KSTDataUpdateState {
  const factory KSTDataUpdateState.empty(LoadingStatus loadingStatus) =
      _KSTDataUpdateEmpty;
  const factory KSTDataUpdateState.k1On1MentoringInteractionDetails(
          K1On1MentoringInteractionDetailsModel?
              k1On1MentoringInteractionDetailsModel) =
      _ReportStateK1On1MentoringInteractionDetails;
  const factory KSTDataUpdateState.addKST1On1MentoringForm(
          Add1On1MentoringFormModel? add1On1MentoringFormModel) =
      _ReportStateAddKST1On1MentoringForm;
  const factory KSTDataUpdateState.educationMentoringInteractionDetails(
          EducationMentoringInteractionDetailsModel?
              educationMentoringInteractionDetailsModel) =
      _ReportStateEducationMentoringInteractionDetails;
  const factory KSTDataUpdateState.addKSTEducationMentoringForm(
          AddEducationMentoringFormModel? addEducationMentoringFormModel) =
      _ReportStateAddKSTEducationMentoringForm;
  const factory KSTDataUpdateState.takeKSTAttendance(
    TakeKSTAttendanceModel? takeKSTAttendanceModel,
    LoadingStatus loadingStatus,
  ) = _ReportStateTakeKSTAttendance;
  const factory KSTDataUpdateState.saveKSTQuizScore(
      SaveKSTQuizScoreModel? saveKSTQuizScoreModel,
      LoadingStatus loadingStatus) = _ReportStateSaveKSTQuizScore;
}

@freezed
class KSTDataUpdateEvent with _$KSTDataUpdateEvent {
  const factory KSTDataUpdateEvent.k1On1MentoringInteractionDetails(
    BuildContext context,
    String kst_manage_report_id,
    String is_view_mode,
    String kst_1on1_mentoring_id,
  ) = _k1On1MentoringInteractionDetails;
  const factory KSTDataUpdateEvent.addKST1On1MentoringForm(
      BuildContext context,
      List<Add1On1MentoringFormRequestModel>
          addKST1On1MentoringFormRequestModel) = _addKST1On1MentoringForm;
  const factory KSTDataUpdateEvent.educationMentoringInteractionDetails(
    BuildContext context,
    String kst_manage_report_id,
    String is_view_mode,
    String kst_education_mentoring_id,
  ) = _educationMentoringInteractionDetails;
  const factory KSTDataUpdateEvent.addKSTEducationMentoringForm(
          BuildContext context,
          List<AddEducationMentoringFormRequestModel>
              addKSTEducationMentoringFormRequestModel) =
      _addKSTEducationMentoringForm;
  const factory KSTDataUpdateEvent.takeKSTAttendance(BuildContext context,
          TakeKSTAttendanceRequestModel takeKSTAttendanceRequestModel) =
      _takeKSTAttendance;
  const factory KSTDataUpdateEvent.saveKSTQuizScore(BuildContext context,
          SaveKSTQuizScoreRequestModel saveKSTQuizScoreRequestModel) =
      _saveKSTQuizScore;
}

@Singleton()
class KSTDataUpdateBloc extends Bloc<KSTDataUpdateEvent, KSTDataUpdateState> {
  IReportService _iReportService;

  KSTDataUpdateBloc(this._iReportService)
      : super(const KSTDataUpdateState.k1On1MentoringInteractionDetails(
          null, /*LoadingStatus.Initialized*/
        )) {
    on<KSTDataUpdateEvent>((event, emit) async {
      await event.when(
        k1On1MentoringInteractionDetails: (
          context,
          kst_manage_report_id,
          is_view_mode,
          kst_1on1_mentoring_id,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var k1On1MentoringInteractionDetailsRequestModel =
              K1On1MentoringInteractionDetailsRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            kst_manage_report_id,
            is_view_mode,
            kst_1on1_mentoring_id,
          );

          emit(KSTDataUpdateState.k1On1MentoringInteractionDetails(
              await _iReportService.k1On1MentoringInteractionDetails(
            k1On1MentoringInteractionDetailsRequestModel,
            Utils().nullSafeString(loginModel.access_token),
            context,
          )));
        },
        addKST1On1MentoringForm: (
          context,
          addKST1On1MentoringFormRequestModel,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          emit(KSTDataUpdateState.addKST1On1MentoringForm(
              await _iReportService.addKST1On1MentoringForm(
                  addKST1On1MentoringFormRequestModel,
                  Utils().nullSafeString(loginModel!.access_token),
                  context)));
        },
        educationMentoringInteractionDetails: (
          context,
          kst_manage_report_id,
          is_view_mode,
          kst_education_mentoring_id,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var educationMentoringInteractionDetailsRequestModel =
              EducationMentoringInteractionDetailsRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            kst_manage_report_id,
            is_view_mode,
            kst_education_mentoring_id,
          );

          emit(KSTDataUpdateState.educationMentoringInteractionDetails(
              await _iReportService.educationMentoringInteractionDetails(
            educationMentoringInteractionDetailsRequestModel,
            Utils().nullSafeString(loginModel.access_token),
            context,
          )));
        },
        addKSTEducationMentoringForm: (
          context,
          addKSTEducationMentoringFormRequestModel,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          emit(KSTDataUpdateState.addKSTEducationMentoringForm(
              await _iReportService.addKSTEducationMentoringForm(
                  addKSTEducationMentoringFormRequestModel,
                  Utils().nullSafeString(loginModel!.access_token),
                  context)));
        },
        takeKSTAttendance: (context, takeKSTAttendanceRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          final val = await _iReportService.takeKSTAttendance(
              takeKSTAttendanceRequestModel,
              Utils().nullSafeString(loginModel!.access_token),
              context);
          if (val != null) {
            emit(KSTDataUpdateState.takeKSTAttendance(val, LoadingStatus.Done));
          } else {
            emit(
                KSTDataUpdateState.takeKSTAttendance(val, LoadingStatus.Error));
          }
        },
        saveKSTQuizScore: (context, saveKSTQuizScoreRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          final val = await _iReportService.saveKSTQuizScore(
              saveKSTQuizScoreRequestModel,
              Utils().nullSafeString(loginModel!.access_token),
              context);
          if (val != null) {
            emit(KSTDataUpdateState.saveKSTQuizScore(val, LoadingStatus.Done));
          } else {
            emit(KSTDataUpdateState.saveKSTQuizScore(val, LoadingStatus.Error));
          }
        },
      );
    });
  }
}
