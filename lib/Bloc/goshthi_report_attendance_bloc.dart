import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/goshthi_report_attendance_model.dart';
import '../models/goshthi_report_attendance_request_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'goshthi_report_attendance_bloc.freezed.dart';

@freezed
class GoshthiReportAttendanceState with _$GoshthiReportAttendanceState {
  const factory GoshthiReportAttendanceState.empty(LoadingStatus loadingStatus) = _GoshthiReportAttendanceEmpty;
  const factory GoshthiReportAttendanceState.goshthiReportAttendance(
          GoshthiReportAttendanceModel? goshthiReportAttendanceModel, LoadingStatus loadingStatus) =
      _ReportStateGoshthiReportAttendance;
}

@freezed
class GoshthiReportAttendanceEvent with _$GoshthiReportAttendanceEvent {
  const factory GoshthiReportAttendanceEvent.goshthiReportAttendance(
    BuildContext context,
    String karyakar_goshti_sabha_id,
    String page,
    String limit,
    String search_name,
    String wing_id,
    String selected_center,
    String selected_region,
    String checkfilter,
    String gender,
  ) = _goshthiReportAttendance;
}

@Singleton()
class GoshthiReportAttendanceBloc extends Bloc<GoshthiReportAttendanceEvent, GoshthiReportAttendanceState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  GoshthiReportAttendanceModel? goshthiReportAttendanceModel;

  GoshthiReportAttendanceBloc(this._iReportService)
      : super(const GoshthiReportAttendanceState.goshthiReportAttendance(null, LoadingStatus.Initialized)) {
    on<GoshthiReportAttendanceEvent>((event, emit) async {
      await event.when(
        goshthiReportAttendance: (
          context,
          karyakar_goshti_sabha_id,
          page,
          limit,
          search_name,
          wing_id,
          selected_center,
          selected_region,
          checkfilter,
          gender,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(GoshthiReportAttendanceState.empty(LoadingStatus.Initialized));
          if (page == "1") {
            goshthiReportAttendanceModel = null;
          }
          var goshthiReportAttendanceRequestModel = GoshthiReportAttendanceRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            karyakar_goshti_sabha_id,
            page,
            limit,
            search_name,
            wing_id,
            selected_center,
            selected_region,
            checkfilter,
            gender,
          );

          final val = await _iReportService.goshthiReportAttendance(
              goshthiReportAttendanceRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (goshthiReportAttendanceModel == null) {
            goshthiReportAttendanceModel = val;
          } else {
            if (val != null) {
              goshthiReportAttendanceModel!.attendance_result!.data!.addAll(val.attendance_result!.data!);
            }
          }
          if (goshthiReportAttendanceModel == null) {
            emit(GoshthiReportAttendanceState.goshthiReportAttendance(
                goshthiReportAttendanceModel, LoadingStatus.Error));
          } else {
            emit(
                GoshthiReportAttendanceState.goshthiReportAttendance(goshthiReportAttendanceModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
