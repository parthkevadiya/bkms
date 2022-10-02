import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/submit_goshthi_report_attendance_model.dart';
import '../models/submit_goshthi_report_attendance_request_model.dart';
import '../models/update_goshthi_held_status_model.dart';
import '../models/update_goshthi_held_status_request_model.dart';
import '../services/report_all_service.dart';
part 'goshthi_data_update_bloc.freezed.dart';

@freezed
class GoshthiDataUpdateState with _$GoshthiDataUpdateState {
  const factory GoshthiDataUpdateState.empty(LoadingStatus loadingStatus) =
      _GoshthiDataUpdateEmpty;
  const factory GoshthiDataUpdateState.submitGoshthiReportAttendance(
      SubmitGoshthiReportAttendanceModel? submitGoshthiReportAttendanceModel,
      LoadingStatus loadingStatus) = _ReportStateSubmitGoshthiReportAttendance;
  const factory GoshthiDataUpdateState.updateGoshthiHeldStatus(
          UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel) =
      _ReportStateUpdateGoshthiHeldStatus;
}

@freezed
class GoshthiDataUpdateEvent with _$GoshthiDataUpdateEvent {
  const factory GoshthiDataUpdateEvent.submitGoshthiReportAttendance(
    BuildContext context,
    String sabha_id,
    String user_id,
    String status,
  ) = _submitGoshthiReportAttendance;
  const factory GoshthiDataUpdateEvent.updateGoshthiHeldStatus(
      BuildContext context,
      UpdateGoshthiHeldStatusRequestModel
          updateGoshthiHeldStatusRequestModel) = _updateGoshthiHeldStatus;
}

@Singleton()
class GoshthiDataUpdateBloc
    extends Bloc<GoshthiDataUpdateEvent, GoshthiDataUpdateState> {
  IReportService _iReportService;

  GoshthiDataUpdateBloc(this._iReportService)
      : super(const GoshthiDataUpdateState.submitGoshthiReportAttendance(
            null, LoadingStatus.Initialized)) {
    on<GoshthiDataUpdateEvent>((event, emit) async {
      await event.when(
        submitGoshthiReportAttendance:
            (context, sabha_id, user_id, status) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var submitGoshthiReportAttendanceRequestModel =
              SubmitGoshthiReportAttendanceRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            sabha_id,
            user_id,
            status,
          );
          final val = await _iReportService.submitGoshthiReportAttendance(
              submitGoshthiReportAttendanceRequestModel,
              Utils().nullSafeString(loginModel.access_token),
              context);
          if (val != null) {
            emit(GoshthiDataUpdateState.submitGoshthiReportAttendance(
                val, LoadingStatus.Done));
          } else {
            emit(GoshthiDataUpdateState.submitGoshthiReportAttendance(
                val, LoadingStatus.Error));
          }
        },
        updateGoshthiHeldStatus:
            (context, updateGoshthiHeldStatusRequestModel) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(GoshthiDataUpdateState.updateGoshthiHeldStatus(
              await _iReportService.updateGoshthiHeldStatus(
                  updateGoshthiHeldStatusRequestModel,
                  Utils().nullSafeString(loginModel!.access_token),
                  context)));
        },
      );
    });
  }
}
