import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/bst_report_request_model.dart';
import '../models/goshthi_report_request_model.dart';
import '../presentation/reports_page/bst_report_model.dart';
import '../presentation/reports_page/goshthi_report_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'bst_report_bloc.freezed.dart';

@freezed
class BSTReportState with _$BSTReportState {
  const factory BSTReportState.empty(LoadingStatus loadingStatus) = _BSTReportEmpty;
  const factory BSTReportState.loadBSTReports(BSTReportModel? bstReportModel, LoadingStatus loadingStatus) =
      _ReportStateLoadBSTReports;
}

@freezed
class BSTReportEvent with _$BSTReportEvent {
  const factory BSTReportEvent.loadBSTReports(
    BuildContext context,
    String strBSTSelectedWing,
    String strBSTSelectedCenter,
    String strBSTSelectedRegion,
    String strBSTSabhaYear,
    int page,
    int limit,
    String generic_search,
  ) = _loadBSTReports;
}

@Singleton()
class BSTReportBloc extends Bloc<BSTReportEvent, BSTReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  BSTReportModel? bstModel;

  BSTReportBloc(this._iReportService) : super(const BSTReportState.loadBSTReports(null, LoadingStatus.Initialized)) {
    on<BSTReportEvent>((event, emit) async {
      await event.when(
        loadBSTReports: (
          context,
          strBSTSelectedWing,
          strBSTSelectedCenter,
          strBSTSelectedRegion,
          strBSTSabhaYear,
          page,
          limit,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(BSTReportState.empty(LoadingStatus.Initialized));
          if (page == 1) {
            bstModel = null;
          }
          var bstReportRequestModel = BSTReportRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              strBSTSelectedWing,
              strBSTSelectedCenter,
              strBSTSelectedRegion,
              strBSTSabhaYear,
              page,
              limit,
              generic_search);
          final val = await _iReportService.loadBSTReports(
              bstReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (bstModel == null) {
            bstModel = val;
          } else {
            if (val != null) {
              bstModel!.bst_report_list!.data!.addAll(val.bst_report_list!.data!);
            }
          }
          if (bstModel == null) {
            emit(BSTReportState.loadBSTReports(bstModel, LoadingStatus.Error));
          } else {
            emit(BSTReportState.loadBSTReports(bstModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
