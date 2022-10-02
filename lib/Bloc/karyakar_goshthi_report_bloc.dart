import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/goshthi_report_request_model.dart';
import '../presentation/reports_page/goshthi_report_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'karyakar_goshthi_report_bloc.freezed.dart';

@freezed
class KaryakarGoshthiReportState with _$KaryakarGoshthiReportState {
  const factory KaryakarGoshthiReportState.empty(LoadingStatus loadingStatus) = _KaryakarGoshthiReportEmpty;
  const factory KaryakarGoshthiReportState.loadGoshthiReports(
      GoshthiReportModel? goshthiReportModel, LoadingStatus loadingStatus) = _ReportStateLoadGoshthiReports;
}

@freezed
class KaryakarGoshthiReportEvent with _$KaryakarGoshthiReportEvent {
  const factory KaryakarGoshthiReportEvent.loadGoshthiReports(
    BuildContext context,
    int page,
    int limit,
    String selected_center,
    String selected_region,
    String sabha_month,
    String sabha_year,
    String sabha_gender,
    String generic_search,
  ) = _loadGoshthiReports;
}

@Singleton()
class KaryakarGoshthiReportBloc extends Bloc<KaryakarGoshthiReportEvent, KaryakarGoshthiReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  GoshthiReportModel? goshthiModel;

  KaryakarGoshthiReportBloc(this._iReportService)
      : super(const KaryakarGoshthiReportState.loadGoshthiReports(null, LoadingStatus.Initialized)) {
    on<KaryakarGoshthiReportEvent>((event, emit) async {
      await event.when(
        loadGoshthiReports: (
          context,
          page,
          limit,
          selected_center,
          selected_region,
          sabha_month,
          sabha_year,
          sabha_gender,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(KaryakarGoshthiReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            goshthiModel = null;
          }
          var goshthiReportRequestModel = GoshthiReportRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              selected_center,
              selected_region,
              sabha_month,
              sabha_year,
              sabha_gender,
              page,
              limit,
              generic_search);

          final val = await _iReportService.loadGoshthiReports(
              goshthiReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (goshthiModel == null) {
            goshthiModel = val;
          } else {
            if (val != null) {
              goshthiModel!.goshthi_result!.data!.addAll(val.goshthi_result!.data!);
            }
          }
          if (goshthiModel == null) {
            emit(KaryakarGoshthiReportState.loadGoshthiReports(goshthiModel, LoadingStatus.Error));
          } else {
            emit(KaryakarGoshthiReportState.loadGoshthiReports(goshthiModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
