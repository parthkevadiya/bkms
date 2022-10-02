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
import '../models/kst_report_request_model.dart';
import '../presentation/reports_page/kst_report_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'kst_report_bloc.freezed.dart';

@freezed
class KstReportState with _$KstReportState {
  const factory KstReportState.empty(LoadingStatus loadingStatus) = _KstReportEmpty;
  const factory KstReportState.loadKSTReports(KSTReportModel? kstReportModel, LoadingStatus loadingStatus) =
      _ReportStateLoadKSTReports;
}

@freezed
class KstReportEvent with _$KstReportEvent {
  const factory KstReportEvent.loadKSTReports(
    BuildContext context,
    int page,
    int limit,
    int is_filter,
    String selected_wing,
    String selected_center,
    String selected_region,
    String selected_year,
    String generic_search,
  ) = _loadKSTReports;
}

@Singleton()
class KstReportBloc extends Bloc<KstReportEvent, KstReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  KSTReportModel? kstReportModel;

  // KstReportModel? goshthiReportAttendanceModel;

  KstReportBloc(this._iReportService) : super(const KstReportState.loadKSTReports(null, LoadingStatus.Initialized)) {
    on<KstReportEvent>((event, emit) async {
      await event.when(
        loadKSTReports: (
          context,
          page,
          limit,
          is_filter,
          selected_wing,
          selected_center,
          selected_region,
          selected_year,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(KstReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            kstReportModel = null;
          }
          var kstReportRequestModel = KSTReportRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            is_filter,
            selected_wing,
            selected_center,
            selected_region,
            selected_year,
            page,
            limit,
            generic_search,
          );

          final val = await _iReportService.loadKSTReports(
              kstReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (kstReportModel == null) {
            kstReportModel = val;
          } else {
            if (val != null) {
              kstReportModel!.kst_result!.data!.addAll(val.kst_result!.data!);
            }
          }
          if (kstReportModel == null) {
            emit(KstReportState.loadKSTReports(kstReportModel, LoadingStatus.Error));
          } else {
            emit(KstReportState.loadKSTReports(kstReportModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
