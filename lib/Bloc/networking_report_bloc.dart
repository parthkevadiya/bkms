import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/networking_report_request_model.dart';
import '../presentation/reports_page/networking_report_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'networking_report_bloc.freezed.dart';

@freezed
class NetworkingReportState with _$NetworkingReportState {
  const factory NetworkingReportState.empty(LoadingStatus loadingStatus) = _NetworkingReportEmpty;
  const factory NetworkingReportState.loadNetworkingReports(
      NetworkingReportModel? networkingReportModel, LoadingStatus loadingStatus) = _ReportStateLoadNetworkingReports;
}

@freezed
class NetworkingReportEvent with _$NetworkingReportEvent {
  const factory NetworkingReportEvent.loadNetworkingReports(
    BuildContext context,
    int page,
    int limit,
    String strNWRKSelectedRegion,
    String strNWRKSelectedCenter,
    String strSelectedReportingYear,
    String generic_search,
  ) = _loadNetworkingReports;
}

@Singleton()
class NetworkingReportBloc extends Bloc<NetworkingReportEvent, NetworkingReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  NetworkingReportModel? networkingReportModel;

  NetworkingReportBloc(this._iReportService)
      : super(const NetworkingReportState.loadNetworkingReports(null, LoadingStatus.Initialized)) {
    on<NetworkingReportEvent>((event, emit) async {
      await event.when(
        loadNetworkingReports: (
          context,
          page,
          limit,
          strNWRKSelectedRegion,
          strNWRKSelectedCenter,
          strSelectedReportingYear,
          generic_search,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(NetworkingReportState.empty(LoadingStatus.InProgress));
          if (page == 1) {
            networkingReportModel = null;
          }
          var networkingReportRequestModel = NetworkingReportRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              strNWRKSelectedRegion,
              strNWRKSelectedCenter,
              strSelectedReportingYear,
              page,
              limit,
              generic_search);

          final val = await _iReportService.loadNetworkingReports(
              networkingReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);

          if (networkingReportModel == null) {
            networkingReportModel = val;
          } else {
            if (val != null) {
              networkingReportModel!.network_list!.data!.addAll(val.network_list!.data!);
            }
          }
          if (networkingReportModel == null) {
            emit(NetworkingReportState.loadNetworkingReports(networkingReportModel, LoadingStatus.Error));
          } else {
            emit(NetworkingReportState.loadNetworkingReports(networkingReportModel, LoadingStatus.Done));
          }
        },
      );
    });
  }
}
