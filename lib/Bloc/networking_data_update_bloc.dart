import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/bst_report_request_model.dart';
import '../models/networking_interaction_details_model.dart';
import '../models/networking_interaction_details_request_model.dart';
import '../presentation/reports_page/bst_report_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'networking_data_update_bloc.freezed.dart';

@freezed
class NetWorkingDataUpdateState with _$NetWorkingDataUpdateState {
  const factory NetWorkingDataUpdateState.empty(LoadingStatus loadingStatus) =
      _NetWorkingDataUpdateEmpty;
  const factory NetWorkingDataUpdateState.networkingInteractionDetails(
          NetworkingInteractionDetailsModel?
              networkingInteractionDetailsModel) =
      _ReportStateNetworkingInteractionDetails;
}

@freezed
class NetWorkingDataUpdateEvent with _$NetWorkingDataUpdateEvent {
  const factory NetWorkingDataUpdateEvent.networkingInteractionDetails(
    BuildContext context,
    String interect_center_record_id,
    String interect_user_id,
    String interaction_id,
  ) = _networkingInteractionDetails;
}

@Singleton()
class NetWorkingDataUpdateBloc
    extends Bloc<NetWorkingDataUpdateEvent, NetWorkingDataUpdateState> {
  IReportService _iReportService;

  NetWorkingDataUpdateBloc(this._iReportService)
      : super(const NetWorkingDataUpdateState.networkingInteractionDetails(
          null,
        )) {
    on<NetWorkingDataUpdateEvent>((event, emit) async {
      await event.when(
        networkingInteractionDetails: (
          context,
          interect_center_record_id,
          interect_user_id,
          interaction_id,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var networkingInteractionDetailsRequestModel =
              NetworkingInteractionDetailsRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            interect_center_record_id,
            interect_user_id,
            interaction_id,
          );
          emit(NetWorkingDataUpdateState.networkingInteractionDetails(
              await _iReportService.networkingInteractionDetails(
                  networkingInteractionDetailsRequestModel,
                  Utils().nullSafeString(loginModel.access_token),
                  context)));
        },
      );
    });
  }
}
