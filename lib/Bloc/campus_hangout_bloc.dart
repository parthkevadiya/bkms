import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/campus_hangout_request_model.dart';
import '../presentation/reports_page/campus_hangout_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'campus_hangout_bloc.freezed.dart';

@freezed
class CampusHangoutReportState with _$CampusHangoutReportState {
  const factory CampusHangoutReportState.empty(LoadingStatus loadingStatus) = _CampusHangoutReportEmpty;
  const factory CampusHangoutReportState.campusHangout(
      CampusHangoutModel? campusHangoutModel, LoadingStatus loadingStatus) = _ReportStateCampusHangout;
}

@freezed
class CampusHangoutReportEvent with _$CampusHangoutReportEvent {
  const factory CampusHangoutReportEvent.campusHangout(
    BuildContext context,
    int page,
    int limit,
    String selected_wing,
    String selected_campus,
    String selected_region,
    String sabha_year,
    String generic_search,
  ) = _campusHangout;
}

@Singleton()
class CampusHangoutReportBloc extends Bloc<CampusHangoutReportEvent, CampusHangoutReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  CampusHangoutModel? campusHangoutModel;

  CampusHangoutReportBloc(this._iReportService)
      : super(const CampusHangoutReportState.campusHangout(null, LoadingStatus.Initialized)) {
    on<CampusHangoutReportEvent>((event, emit) async {
      await event.when(
        campusHangout: (
          context,
          page,
          limit,
          selected_wing,
          selected_campus,
          selected_region,
          sabha_year,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(CampusHangoutReportState.empty(LoadingStatus.Initialized));
          if (page == 1) {
            campusHangoutModel = null;
          }
          var campusHangoutRequestModel = CampusHangoutRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              selected_wing,
              selected_campus,
              selected_region,
              sabha_year,
              page,
              limit,
              generic_search);
          final val = await _iReportService.campusHangout(
              campusHangoutRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (campusHangoutModel == null) {
            campusHangoutModel = val;
          } else {
            if (val != null) {
              campusHangoutModel!.campus_hangout_list!.data!.addAll(val.campus_hangout_list!.data!);
            }
          }
          if (campusHangoutModel == null) {
            emit(CampusHangoutReportState.campusHangout(campusHangoutModel, LoadingStatus.Error));
          } else {
            emit(CampusHangoutReportState.campusHangout(campusHangoutModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
