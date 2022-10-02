import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/save_bst_quiz_score_request_model.dart';
import 'package:flutter_app/models/take_bst_attendance_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/get_bst_wing_name_model.dart';
import '../models/get_bst_wing_name_request_model.dart';
import '../models/save_bst_quiz_score_model.dart';
import '../models/take_bst_attendance_request_model.dart';
import '../models/update_bst_niyam_assesment_score_model.dart';
import '../models/update_bst_niyam_assesment_score_request_model.dart';
import '../services/report_all_service.dart';
part 'bst_data_update_bloc.freezed.dart';

@freezed
class BSTDataUpdateState with _$BSTDataUpdateState {
  const factory BSTDataUpdateState.empty(LoadingStatus loadingStatus) =
      _BSTDataUpdateEmpty;
  const factory BSTDataUpdateState.getBSTWingName(
      GetBSTWingNameModel? getBSTWingNameModel) = _ReportStateGetBSTWingName;
  const factory BSTDataUpdateState.takeBSTAttendance(
      TakeBSTAttendanceModel? takeBSTAttendanceModel,
      LoadingStatus loadingStatus) = _ReportStateTakeBSTAttendance;
  const factory BSTDataUpdateState.updateBSTNiyamAssesmentScore(
      UpdateBSTNiyamAssesmentScoreModel? updateBSTNiyamAssesmentScoreModel,
      LoadingStatus loadingStatus) = _ReportStateUpdateBSTNiyamAssesmentScore;
  const factory BSTDataUpdateState.saveBSTQuizScore(
    SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
    LoadingStatus loadingStatus,
  ) = _ReportStateSaveBSTQuizScore;
}

@freezed
class BSTDataUpdateEvent with _$BSTDataUpdateEvent {
  const factory BSTDataUpdateEvent.getBSTWingName(
    BuildContext context,
    String center_id,
    String wing_name,
  ) = _getBSTWingName;
  const factory BSTDataUpdateEvent.takeBSTAttendance(BuildContext context,
          TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel) =
      _takeBSTAttendance;
  const factory BSTDataUpdateEvent.updateBSTNiyamAssesmentScore(
          BuildContext context,
          UpdateBSTNiyamAssesmentScoreRequestModel
              updateBSTNiyamAssesmentScoreRequestModel) =
      _updateBSTNiyamAssesmentScore;
  const factory BSTDataUpdateEvent.saveBSTQuizScore(BuildContext context,
          SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel) =
      _saveBSTQuizScore;
}

@Singleton()
class BSTDataUpdateBloc extends Bloc<BSTDataUpdateEvent, BSTDataUpdateState> {
  IReportService _iReportService;

  BSTDataUpdateBloc(this._iReportService)
      : super(const BSTDataUpdateState.getBSTWingName(
          null, /*LoadingStatus.Initialized*/
        )) {
    on<BSTDataUpdateEvent>((event, emit) async {
      await event.when(
        getBSTWingName: (
          context,
          center_id,
          wing_name,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var getBSTWingNameRequestModel = GetBSTWingNameRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            center_id,
            wing_name,
          );

          emit(BSTDataUpdateState.getBSTWingName(
              await _iReportService.getBSTWingName(getBSTWingNameRequestModel,
                  Utils().nullSafeString(loginModel.access_token), context)));
        },
        takeBSTAttendance: (context, takeBSTAttendanceRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          final val = await _iReportService.takeBSTAttendance(
              takeBSTAttendanceRequestModel,
              Utils().nullSafeString(loginModel!.access_token),
              context);
          if (val != null) {
            emit(BSTDataUpdateState.takeBSTAttendance(val, LoadingStatus.Done));
          } else {
            emit(
                BSTDataUpdateState.takeBSTAttendance(val, LoadingStatus.Error));
          }
        },
        updateBSTNiyamAssesmentScore: (
          context,
          updateBSTNiyamAssesmentScoreRequestModel,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(BSTDataUpdateState.empty(LoadingStatus.Initialized));
          final val = await _iReportService.updateBSTNiyamAssesmentScore(
              updateBSTNiyamAssesmentScoreRequestModel,
              Utils().nullSafeString(loginModel!.access_token),
              context);
          if (val != null) {
            emit(BSTDataUpdateState.updateBSTNiyamAssesmentScore(
                val, LoadingStatus.Done));
          } else {
            emit(BSTDataUpdateState.updateBSTNiyamAssesmentScore(
                val, LoadingStatus.Error));
          }
        },
        saveBSTQuizScore: (context, saveBSTQuizScoreRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(BSTDataUpdateState.empty(LoadingStatus.Done));
          final val = await _iReportService.saveBSTQuizScore(
              saveBSTQuizScoreRequestModel,
              Utils().nullSafeString(loginModel!.access_token),
              context);
          if (val != null) {
            emit(BSTDataUpdateState.saveBSTQuizScore(val, LoadingStatus.Done));
          } else {
            emit(BSTDataUpdateState.saveBSTQuizScore(val, LoadingStatus.Error));
          }
        },
      );
    });
  }
}
