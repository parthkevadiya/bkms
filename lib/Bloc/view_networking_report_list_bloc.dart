import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/center_wise_interaction_model.dart';
import 'package:flutter_app/models/center_wise_interaction_request_model.dart';
import 'package:flutter_app/models/create_interaction_details_model.dart';
import 'package:flutter_app/models/create_interaction_details_request_model.dart';
import 'package:flutter_app/models/interaction_wise_questions_model.dart';
import 'package:flutter_app/models/interaction_wise_questions_request_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/networking_interaction_log_request_model.dart';
import 'package:flutter_app/models/submit_interaction_questions_request_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/networking_interaction_log_model.dart';
import '../models/submit_interactions_questions_details_model.dart';
import '../models/view_network_report_list_model.dart';
import '../models/view_networking_report_list_request_model.dart';
import '../presentation/reports_page/report_model.dart';
import '../services/report_all_service.dart';
part 'view_networking_report_list_bloc.freezed.dart';

@freezed
class ViewNetworkingReportState with _$ViewNetworkingReportState {
  const factory ViewNetworkingReportState.empty(LoadingStatus loadingStatus) = _SabhaReportQuestionEmpty;
  const factory ViewNetworkingReportState.viewNetworkingReportList(
          ViewNetworkingReportListModel? viewNetworkingReportListModel, LoadingStatus loadingStatus) =
      _ReportStateViewNetworkingReportList;
  const factory ViewNetworkingReportState.networkingInteractionLog(
          NetworkingInteractionLogModel? networkingInteractionLogModel, LoadingStatus loadingStatus) =
      _ReportStateNetworkingInteractionLog;
  const factory ViewNetworkingReportState.submitInteractionsQuestionsDetails(
          SubmitInteractionsQuestionsDetailsModel? submitInteractionsQuestionsDetailsModel) =
      _ReportSubmitInteractionsQuestionsDetails;
  const factory ViewNetworkingReportState.createInteractionDetails(
      CreateInteractionDetailsModel? createInteractionDetailsModel) = _ReportStateCreateInteractionDetails;
  const factory ViewNetworkingReportState.centerWiseInteractionTypes(
      CenterWiseInteractionTypesModel? centerWiseInteractionTypesModel) = _ReportStateCenterWiseInteractionTypesModel;
  const factory ViewNetworkingReportState.interactionWiseQuestions(
      InteractionWiseQuestionsModel? interactionWiseQuestionsModel) = _ReportStateInteractionWiseQuestions;
}

@freezed
class ViewNetworkingReportEvent with _$ViewNetworkingReportEvent {
  const factory ViewNetworkingReportEvent.viewNetworkingReportList(
    BuildContext context,
    String reporting_record_id,
    String page,
    String limit,
  ) = _viewNetworkingReportList;

  const factory ViewNetworkingReportEvent.networkingInteractionLog(
    BuildContext context,
    String interect_center_record_id,
    String interect_user_id,
    String page,
    String limit,
  ) = _networkingInteractionLog;
  const factory ViewNetworkingReportEvent.submitInteractionsQuestionsDetails(
          BuildContext context, List<SubmitInteractionsQuestionsRequestModel> submitInteractionsQuestionsRequestModel) =
      _submitInteractionsQuestionsDetails;
  const factory ViewNetworkingReportEvent.createInteractionDetails(
    BuildContext context,
  ) = _createInteractionDetails;
  const factory ViewNetworkingReportEvent.centerWiseInteractionTypes(
    BuildContext context,
    String center_id,
  ) = _centerWiseInteractionTypes;
  const factory ViewNetworkingReportEvent.interactionWiseQuestions(
    BuildContext context,
    String center_id,
    String interaction_type,
  ) = _interactionWiseQuestions;
}

@Singleton()
class ViewNetworkingReportBloc extends Bloc<ViewNetworkingReportEvent, ViewNetworkingReportState> {
  IReportService _iReportService;
  ReportModel? reportModel;
  ViewNetworkingReportListModel? viewNetworkingReportListModel;
  NetworkingInteractionLogModel? networkingInteractionLogModel;

  ViewNetworkingReportBloc(this._iReportService)
      : super(const ViewNetworkingReportState.viewNetworkingReportList(null, LoadingStatus.Initialized)) {
    on<ViewNetworkingReportEvent>(
      (event, emit) async {
        await event.when(
          viewNetworkingReportList: (
            context,
            reporting_record_id,
            page,
            limit,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();
            emit(ViewNetworkingReportState.empty(LoadingStatus.InProgress));
            if (page == "1") {
              viewNetworkingReportListModel = null;
            }
            var viewNetworkingReportListRequestModel = ViewNetworkingReportListRequestModel(
                Utils().nullSafeString(loginModel!.login_user_type.toString()),
                Utils().nullSafeString(loginModel.login_parent_type),
                Utils().nullSafeString(loginModel.role),
                Utils().nullSafeInt(loginModel.bkms_id).toString(),
                reporting_record_id,
                page,
                limit);

            final val = await _iReportService.viewNetworkingReportList(
                viewNetworkingReportListRequestModel, Utils().nullSafeString(loginModel.access_token), context);

            if (viewNetworkingReportListModel == null) {
              viewNetworkingReportListModel = val;
            } else {
              if (val != null && val.networking_list.data != null) {
                viewNetworkingReportListModel!.networking_list!.data!.addAll(val.networking_list!.data!);
              }
            }
            if (viewNetworkingReportListModel == null) {
              emit(ViewNetworkingReportState.viewNetworkingReportList(
                  viewNetworkingReportListModel, LoadingStatus.Error));
            } else {
              emit(ViewNetworkingReportState.viewNetworkingReportList(
                  viewNetworkingReportListModel, LoadingStatus.Done));
            }
          },
          networkingInteractionLog: (
            context,
            interect_center_record_id,
            interect_user_id,
            page,
            limit,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();
            emit(ViewNetworkingReportState.empty(LoadingStatus.InProgress));
            if (page == 1) {
              networkingInteractionLogModel = null;
            }
            var networkingInteractionLogRequestModel = NetworkingInteractionLogRequestModel(
                Utils().nullSafeString(loginModel!.login_user_type.toString()),
                Utils().nullSafeString(loginModel.login_parent_type),
                Utils().nullSafeString(loginModel.role),
                Utils().nullSafeInt(loginModel.bkms_id).toString(),
                interect_center_record_id,
                interect_user_id,
                page,
                limit);
            final val = await _iReportService.networkingInteractionLog(
                networkingInteractionLogRequestModel, Utils().nullSafeString(loginModel.access_token), context);
            if (networkingInteractionLogModel == null) {
              networkingInteractionLogModel = val;
            } else {
              if (val != null) {
                networkingInteractionLogModel!.interaction_log_list!.data!.addAll(val.interaction_log_list!.data!);
              }
            }
            if (networkingInteractionLogModel == null) {
              emit(ViewNetworkingReportState.networkingInteractionLog(val, LoadingStatus.Error));
            } else {
              emit(ViewNetworkingReportState.networkingInteractionLog(val, LoadingStatus.Done));
            }
          },
          submitInteractionsQuestionsDetails: (
            context,
            submitInteractionsQuestionsRequestModel,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();
            emit(ViewNetworkingReportState.submitInteractionsQuestionsDetails(
                await _iReportService.submitInteractionsQuestionsDetails(submitInteractionsQuestionsRequestModel,
                    Utils().nullSafeString(loginModel!.access_token), context)));
          },
          createInteractionDetails: (
            context,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();
            var createInteractionDetailsRequestModel = CreateInteractionDetailsRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
            );
            emit(ViewNetworkingReportState.createInteractionDetails(await _iReportService.createInteractionDetails(
                createInteractionDetailsRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
          },
          centerWiseInteractionTypes: (
            context,
            center_id,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();
            var centerWiseInteractionRequestModel = CenterWiseInteractionRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              center_id,
            );
            emit(ViewNetworkingReportState.centerWiseInteractionTypes(await _iReportService.centerWiseInteractionTypes(
                centerWiseInteractionRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
          },
          interactionWiseQuestions: (
            context,
            center_id,
            interaction_type,
          ) async {
            final _pref = await Preferences.getInstance();
            LoginModel? loginModel = await _pref.getToken();
            var interactionsWiseQuestionsRequestModel = InteractionsWiseQuestionsRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeString(loginModel.role),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              center_id,
              interaction_type,
            );
            emit(ViewNetworkingReportState.interactionWiseQuestions(await _iReportService.interactionWiseQuestions(
                interactionsWiseQuestionsRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
          },
        );
      },
    );
  }
}
