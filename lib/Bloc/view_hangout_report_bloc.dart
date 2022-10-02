import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_report_request_model.dart';
import 'package:flutter_app/models/view_hangout_report_model.dart';
import 'package:flutter_app/models/view_hangout_report_request_model.dart';
import 'package:flutter_app/preferences.dart';
import 'package:flutter_app/services/report_all_service.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../models/create_campus_hangout_report_model.dart';
import '../models/create_campus_hangout_report_request_model.dart';
import '../models/submit_campus_hangout_report_model.dart';

part 'view_hangout_report_bloc.freezed.dart';

@freezed
class CampusHangoutState with _$CampusHangoutState {
  const factory CampusHangoutState.empty(LoadingStatus loadingStatus) = _CampusHangoutStateEmpty;

  const factory CampusHangoutState.viewHangoutReport(
          ViewHangoutReportModel? viewHangoutReportModel, LoadingStatus loadingStatus) =
      _CampusHangoutStateViewHangoutReport;
  const factory CampusHangoutState.submitCampusHangoutReport(
      SubmitCampusHangoutReportModel? submitCampusHangoutReportModel) = _ReportStateSubmitCampusHangoutReport;
  const factory CampusHangoutState.createCampusHangoutReport(
      CreateCampusHangoutReportModel? createCampusHangoutReportModel) = _ReportStateCreateCampusHangoutReport;
}

@freezed
class CampusHangoutEvent with _$CampusHangoutEvent {
  const factory CampusHangoutEvent.viewHangoutReport(
    BuildContext context,
    String bst_center_report_id,
    int page,
    int limit,
    String generic_search,
  ) = _viewHangoutReport;
  const factory CampusHangoutEvent.submitCampusHangoutReport(
    BuildContext context,
    List<SubmitCampusHangoutReportRequestModel> submitCampusHangoutReportRequestModel,
  ) = _submitCampusHangoutReport;

  const factory CampusHangoutEvent.createCampusHangoutReport(
    BuildContext context,
    String report_region,
    String report_campus,
    String report_wing,
  ) = _createCampusHangoutReport;
}

@injectable
class CampusHangoutBloc extends Bloc<CampusHangoutEvent, CampusHangoutState> {
  IReportService _iReportService;
  ViewHangoutReportModel? viewHangoutReportModel;

  CampusHangoutBloc(this._iReportService)
      : super(
          CampusHangoutState.viewHangoutReport(null, LoadingStatus.Initialized),
        ) {
    on<CampusHangoutEvent>(
      (event, emit) async {
        await event.when(
          viewHangoutReport: (
            context,
            bst_center_report_id,
            page,
            limit,
            generic_search,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();
            emit(CampusHangoutState.empty(LoadingStatus.Initialized));
            if (page == 1) {
              viewHangoutReportModel = null;
            }
            var viewHangoutReportRequestModel = ViewHangoutReportRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              bst_center_report_id,
              page,
              limit,
              generic_search,
            );
            final val = await _iReportService.viewHangoutReport(
                viewHangoutReportRequestModel, Utils().nullSafeString(loginModel.access_token), context);

            if (viewHangoutReportModel == null) {
              viewHangoutReportModel = val;
            } else {
              if (val != null) {
                viewHangoutReportModel!.hangout_result!.data!.addAll(val.hangout_result!.data!);
              }
            }
            if (viewHangoutReportModel == null) {
              emit(CampusHangoutState.viewHangoutReport(viewHangoutReportModel, LoadingStatus.Error));
            } else {
              emit(CampusHangoutState.viewHangoutReport(viewHangoutReportModel, LoadingStatus.Done));
            }
          },
          submitCampusHangoutReport: (
            context,
            submitCampusHangoutReportRequestModel,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();

            emit(CampusHangoutState.submitCampusHangoutReport(await _iReportService.submitCampusHangoutReport(
                submitCampusHangoutReportRequestModel, Utils().nullSafeString(loginModel!.access_token), context)));
          },
          createCampusHangoutReport: (
            context,
            report_region,
            report_campus,
            report_wing,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();
            var createCampusHangoutReportRequestModel = CreateCampusHangoutReportRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              report_region,
              report_campus,
              report_wing,
            );

            emit(CampusHangoutState.createCampusHangoutReport(await _iReportService.createCampusHangoutReport(
                createCampusHangoutReportRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
          },
        );
      },
    );
  }
}
