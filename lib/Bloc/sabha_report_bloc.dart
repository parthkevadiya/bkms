import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/report_request_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'sabha_report_bloc.freezed.dart';

@freezed
class SabhaReportState with _$SabhaReportState {
  const factory SabhaReportState.empty(LoadingStatus loadingStatus) = _SabhaReportEmpty;
  const factory SabhaReportState.loadSabhaReports(ReportModel? reportModel, LoadingStatus loadingStatus) =
      _ReportStateLoadSabhaReports;
}

@freezed
class SabhaReportEvent with _$SabhaReportEvent {
  const factory SabhaReportEvent.loadSabhaReports(
    BuildContext context,
    int page,
    int limit,
    int is_filter,
    String selected_region,
    String selected_center,
    String selected_wing,
    String sabha_year,
    String sabha_week,
    String report_status,
    String generic_search,
  ) = _loadSabhaReports;
}

@Singleton()
class SabhaReportBloc extends Bloc<SabhaReportEvent, SabhaReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;

  SabhaReportBloc(this._iReportService)
      : super(const SabhaReportState.loadSabhaReports(null, LoadingStatus.Initialized)) {
    on<SabhaReportEvent>((event, emit) async {
      await event.when(
        loadSabhaReports: (context, page, limit, is_filter, selected_region, selected_center, selected_wing, sabha_year,
            sabha_week, report_status, generic_search) async {
          emit(SabhaReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            reportModel = null;
          }
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          var reportSabhaRequestModel = ReportRequestModel(
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
              generic_search);
          final val = await _iReportService.loadSabhaReports(
              reportSabhaRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (reportModel == null) {
            reportModel = val;
          } else {
            if (val != null) {
              reportModel!.sabha_result!.data!.addAll(val.sabha_result!.data!);
            }
          }
          if (reportModel == null) {
            emit(SabhaReportState.loadSabhaReports(reportModel, LoadingStatus.Error));
          } else {
            emit(SabhaReportState.loadSabhaReports(reportModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
