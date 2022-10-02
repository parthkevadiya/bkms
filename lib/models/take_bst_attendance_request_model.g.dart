// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'take_bst_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TakeBSTAttendanceRequestModel _$TakeBSTAttendanceRequestModelFromJson(
        Map<String, dynamic> json) =>
    TakeBSTAttendanceRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['bst_fallspring_report_id'] as String,
      json['user_id'] as String,
      json['user_group_name'] as String,
      json['user_wing_name'] as String,
      json['user_school_year_name'] as String,
      json['session_1_attendance_status'] as String,
      json['session_2_attendance_status'] as String,
      json['session_3_attendance_status'] as String,
      json['session_4_attendance_status'] as String,
      json['session_5_attendance_status'] as String,
      json['session_6_attendance_status'] as String,
    );

Map<String, dynamic> _$TakeBSTAttendanceRequestModelToJson(
        TakeBSTAttendanceRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'bst_fallspring_report_id': instance.bst_fallspring_report_id,
      'user_id': instance.user_id,
      'user_group_name': instance.user_group_name,
      'user_wing_name': instance.user_wing_name,
      'user_school_year_name': instance.user_school_year_name,
      'session_1_attendance_status': instance.session_1_attendance_status,
      'session_2_attendance_status': instance.session_2_attendance_status,
      'session_3_attendance_status': instance.session_3_attendance_status,
      'session_4_attendance_status': instance.session_4_attendance_status,
      'session_5_attendance_status': instance.session_5_attendance_status,
      'session_6_attendance_status': instance.session_6_attendance_status,
    };
