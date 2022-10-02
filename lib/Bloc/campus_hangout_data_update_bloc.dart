import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../preferences.dart';
import '../models/campus_hangout_details_request_model.dart';
import '../models/campus_hangout_region_model.dart';
import '../models/campus_hangout_region_request_model.dart';
import '../models/campus_hangout_report_details_model.dart';
import '../models/campus_wise_hangout_types_model.dart';
import '../models/campus_wise_hangout_types_request_model.dart';
import '../models/h_region_wise_campus_model.dart';
import '../models/h_region_wise_campus_request_model.dart';
import '../models/hangout_type_wise_questions_model.dart';
import '../models/hangout_type_wise_questions_request_model.dart';
import '../models/k1On1_mentoring_interaction_details_model.dart';
import '../models/k1On1_mentoring_interaction_details_request_model.dart';
import '../models/region_wise_campus_model.dart';
import '../models/region_wise_campus_request_model.dart';
import '../models/submit_campus_hangout_attendance_model.dart';
import '../models/submit_campus_hangout_attendance_request_model.dart';
import '../models/take_campus_hangout_attendance_model.dart';
import '../models/take_campus_hangout_attendance_request_model.dart';
import '../services/report_all_service.dart';
part 'campus_hangout_data_update_bloc.freezed.dart';

@freezed
class CampusHangOutDataUpdateState with _$CampusHangOutDataUpdateState {
  const factory CampusHangOutDataUpdateState.empty(LoadingStatus loadingStatus) = _CampusHangOutDataUpdateEmpty;
  const factory CampusHangOutDataUpdateState.regionWiseCampus(RegionWiseCampusModel? regionWiseCampusModel) =
      _ReportStateRegionWiseCampus;
  const factory CampusHangOutDataUpdateState.campusHangoutRegion(CampusHangoutRegionModel? campusHangoutRegionModel) =
      _ReportStateCampusHangoutRegion;
  const factory CampusHangOutDataUpdateState.hRegionWiseCampus(HRegionWiseCampusModel? hRegionWiseCampusModel) =
      _ReportStateHRegionWiseCampus;
  const factory CampusHangOutDataUpdateState.campusWiseHangoutTypes(
      CampusWiseHangoutTypesModel? campusWiseHangoutTypesModel) = _ReportStateCampusWiseHangoutTypes;
  const factory CampusHangOutDataUpdateState.hangoutTypeWiseQuestions(
      HangoutTypeWiseQuestionsModel? hangoutTypeWiseQuestionsModel) = _ReportStateHangoutTypeWiseQuestions;
  const factory CampusHangOutDataUpdateState.submitCampusHangoutAttendance(
          SubmitCampusHangoutAttendanceModel? submitCampusHangoutAttendanceModel) =
      _ReportStateSubmitCampusHangoutAttendance;
  const factory CampusHangOutDataUpdateState.takeCampusHangoutAttendance(
      TakeCampusHangoutAttendanceModel? takeCampusHangoutAttendanceModel) = _ReportStateTakeCampusHangoutAttendance;
  const factory CampusHangOutDataUpdateState.campusHangoutReportDetails(
          CampusHangoutReportDetailsModel? campusHangoutReportDetailsModel, LoadingStatus loadingStatus) =
      _ReportStateCampusHangoutReportDetails;
}

@freezed
class CampusHangOutDataUpdateEvent with _$CampusHangOutDataUpdateEvent {
  const factory CampusHangOutDataUpdateEvent.regionWiseCampus(
    BuildContext context,
    String region_id,
  ) = _regionWiseCampus;

  const factory CampusHangOutDataUpdateEvent.campusWiseHangoutTypes(
    BuildContext context,
    String campus_id,
  ) = _campusWiseHangoutTypes;
  const factory CampusHangOutDataUpdateEvent.hRegionWiseCampus(
    BuildContext context,
    String region_id,
  ) = _hRegionWiseCampus;
  const factory CampusHangOutDataUpdateEvent.campusHangoutRegion(
    BuildContext context,
  ) = _campusHangoutRegion;
  const factory CampusHangOutDataUpdateEvent.hangoutTypeWiseQuestions(
    BuildContext context,
    String hangout_type,
  ) = _hangoutTypeWiseQuestions;

  const factory CampusHangOutDataUpdateEvent.submitCampusHangoutAttendance(
    BuildContext context,
    SubmitCampusHangoutAttendanceRequestModel submitCampusHangoutAttendanceRequestModel,
  ) = _submitCampusHangoutAttendance;

  const factory CampusHangOutDataUpdateEvent.takeCampusHangoutAttendance(
    BuildContext context,
    TakeCampusHangoutAttendanceRequestModel takeCampusHangoutAttendanceRequestModel,
  ) = _takeCampusHangoutAttendance;

  const factory CampusHangOutDataUpdateEvent.campusHangoutReportDetails(
    BuildContext context,
    String campus_report_id,
    String campus_hangout_report_id,
    String user_id,
    String first_name,
    String middle_name,
    String last_name,
    String schoolyear,
  ) = _campusHangoutReportDetails;
}

@Singleton()
class CampusHangOutDataUpdateBloc extends Bloc<CampusHangOutDataUpdateEvent, CampusHangOutDataUpdateState> {
  IReportService _iReportService;

  CampusHangOutDataUpdateBloc(this._iReportService)
      : super(const CampusHangOutDataUpdateState.campusHangoutRegion(
          null, /*LoadingStatus.Initialized*/
        )) {
    on<CampusHangOutDataUpdateEvent>((event, emit) async {
      await event.when(
        regionWiseCampus: (
          context,
          region_id,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var regionWiseCampusRequestModel = RegionWiseCampusRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            region_id,
          );

          emit(CampusHangOutDataUpdateState.regionWiseCampus(await _iReportService.regionWiseCampus(
              regionWiseCampusRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
        campusHangoutRegion: (
          context,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var campusHangoutRegionRequestModel = CampusHangoutRegionRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
          );

          emit(CampusHangOutDataUpdateState.campusHangoutRegion(await _iReportService.campusHangoutRegion(
              campusHangoutRegionRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
        hRegionWiseCampus: (
          context,
          region_id,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var hRegionWiseCampusRequestModel = HRegionWiseCampusRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            region_id,
          );

          emit(CampusHangOutDataUpdateState.hRegionWiseCampus(await _iReportService.hRegionWiseCampus(
              hRegionWiseCampusRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
        campusWiseHangoutTypes: (
          context,
          campus_id,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var campusWiseHangoutTypesRequestModel = CampusWiseHangoutTypesRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            campus_id,
          );

          emit(CampusHangOutDataUpdateState.campusWiseHangoutTypes(await _iReportService.campusWiseHangoutTypes(
              campusWiseHangoutTypesRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
        hangoutTypeWiseQuestions: (
          context,
          hangout_type,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var hangoutTypeWiseQuestionsRequestModel = HangoutTypeWiseQuestionsRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            hangout_type,
          );

          emit(CampusHangOutDataUpdateState.hangoutTypeWiseQuestions(await _iReportService.hangoutTypeWiseQuestions(
              hangoutTypeWiseQuestionsRequestModel, Utils().nullSafeString(loginModel.access_token), context)));
        },
        submitCampusHangoutAttendance: (
          context,
          submitCampusHangoutAttendanceRequestModel,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          emit(CampusHangOutDataUpdateState.submitCampusHangoutAttendance(
              await _iReportService.submitCampusHangoutAttendance(submitCampusHangoutAttendanceRequestModel,
                  Utils().nullSafeString(loginModel!.access_token), context)));
        },
        takeCampusHangoutAttendance: (
          context,
          takeCampusHangoutAttendanceRequestModel,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();

          emit(CampusHangOutDataUpdateState.takeCampusHangoutAttendance(
              await _iReportService.takeCampusHangoutAttendance(
                  takeCampusHangoutAttendanceRequestModel, Utils().nullSafeString(loginModel!.access_token), context)));
        },
        campusHangoutReportDetails: (
          context,
          campus_report_id,
          campus_hangout_report_id,
          user_id,
          first_name,
          middle_name,
          last_name,
          schoolyear,
        ) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(
            CampusHangOutDataUpdateState.empty(LoadingStatus.InProgress),
          );
          var campusHangoutReportDetailsRequestModel = CampusHangoutReportDetailsRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeString(loginModel.role),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            campus_report_id,
            campus_hangout_report_id,
            user_id,
            first_name,
            middle_name,
            last_name,
            schoolyear,
          );
          final val = await _iReportService.campusHangoutReportDetails(
              campusHangoutReportDetailsRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(CampusHangOutDataUpdateState.campusHangoutReportDetails(val, LoadingStatus.Done));
          } else {
            emit(CampusHangOutDataUpdateState.campusHangoutReportDetails(val, LoadingStatus.Error));
          }
        },
      );
    });
  }
}
