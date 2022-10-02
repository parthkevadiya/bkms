import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/export_record_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/record_request_model.dart';
import 'package:flutter_app/presentation/records_page/record_model.dart';
import 'package:flutter_app/services/record_service.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../preferences.dart';
part 'record_bloc.freezed.dart';

@freezed
class RecordState with _$RecordState {
  const factory RecordState.loadRecord(RecordModel? recordModel, LoadingStatus loadingStatus) = _RecordState;
}

@freezed
class ExportState with _$ExportState {
  const factory ExportState.complete(RecordModel? recordModel, LoadingStatus loadingStatus) = _ExportCompleteState;
  const factory ExportState.error(LoadingStatus loadingStatus) = _ExportErrorState;
}

@freezed
class RecordEvent with _$RecordEvent {
  const factory RecordEvent.load(
      BuildContext context,
      String name,
      String gender,
      String wing,
      String schoolYear,
      String center,
      String region,
      String userGroup,
      String fname,
      String mname,
      String lname,
      String user_id,
      String email,
      int page,
      int limit,
      bool is_export) = _load;
}

@freezed
class ExportEvent with _$ExportEvent {
  const factory ExportEvent.export(
      BuildContext context,
      String name,
      String gender,
      String wing,
      String schoolYear,
      String center,
      String region,
      String user_group,
      String fname,
      String mname,
      String lname,
      String user_id,
      String email,
      int page,
      int limit,
      bool is_export) = _export;
}

@Singleton()
class RecordBloc extends Bloc<RecordEvent, RecordState> {
  IRecordService _iRecordService;
  RecordModel? recordModel;

  RecordBloc(this._iRecordService) : super(const RecordState.loadRecord(null, LoadingStatus.Initialized)) {
    on<RecordEvent>((event, emit) async {
      await event.when(
        load: (context, name, gender, wing, schoolYear, center, region, userGroup, fname, mname, lname, user_id, email,
            page, limit, is_export) async {
          emit(RecordState.loadRecord(null, LoadingStatus.InProgress));
          if (page == 1) {
            recordModel = null;
          }
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var recordRequestModel = RecordRequestModel(
            Utils().nullSafeString(loginModel!.login_user_type.toString()),
            Utils().nullSafeString(loginModel.login_parent_type),
            Utils().nullSafeInt(loginModel.bkms_id).toString(),
            name,
            gender,
            wing,
            schoolYear,
            center,
            region,
            userGroup,
            fname,
            mname,
            lname,
            user_id,
            email,
            page,
            limit,
            is_export,
          );

          final val =
              await _iRecordService.load(recordRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (recordModel == null) {
            recordModel = val;
          } else {
            if (val != null && val!.records != null) {
              if (recordModel!.records != null) {
                recordModel!.records!.addAll(val.records!);
              }
            }
          }
          if (recordModel == null) {
            emit(RecordState.loadRecord(recordModel, LoadingStatus.Error));
          } else {
            emit(RecordState.loadRecord(recordModel, LoadingStatus.Done));
          }
        },
      );
    });
  }

  // @override
  // Stream<RecordState> mapEventToState(RecordEvent event) async {
  //
  // }
}

@Singleton()
class ExportBloc extends Bloc<ExportEvent, ExportState> {
  IRecordService _iRecordService;

  ExportBloc(this._iRecordService) : super(const ExportState.complete(null, LoadingStatus.Initialized)) {
    on<ExportEvent>((event, emit) async {
      await event.when(
        export: (context, name, gender, wing, schoolYear, center, region, user_group, fname, mname, lname, user_id,
            email, page, limit, is_export) async {
          emit(ExportState.error(LoadingStatus.InProgress));

          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var recordRequestModel = RecordRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              name,
              gender,
              wing,
              schoolYear,
              center,
              region,
              user_group,
              fname,
              mname,
              lname,
              user_id,
              email,
              page,
              limit,
              is_export);
          final val = await _iRecordService.export(
              recordRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(ExportState.complete(val, LoadingStatus.Done));
          } else {
            emit(ExportState.error(LoadingStatus.Error));
          }
        },
      );
    });
  }

  // @override
  // Stream<ExportState> mapEventToState(ExportEvent event) async {
  //
  // }
}
