// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_goshthi_report_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitGoshthiReportAttendanceRequestModel
    _$SubmitGoshthiReportAttendanceRequestModelFromJson(
            Map<String, dynamic> json) =>
        SubmitGoshthiReportAttendanceRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['sabha_id'] as String,
          json['user_id'] as String,
          json['status'] as String,
        );

Map<String, dynamic> _$SubmitGoshthiReportAttendanceRequestModelToJson(
        SubmitGoshthiReportAttendanceRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'sabha_id': instance.sabha_id,
      'user_id': instance.user_id,
      'status': instance.status,
    };
