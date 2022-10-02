// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'take_kst_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TakeKSTAttendanceRequestModel _$TakeKSTAttendanceRequestModelFromJson(
        Map<String, dynamic> json) =>
    TakeKSTAttendanceRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['kst_manage_report_id'] as String,
      json['list_user_id'] as String,
      json['list_user_group_name'] as String,
      json['list_user_wing_name'] as String,
      json['list_user_school_year_name'] as String,
      json['session_1_attendance_status'] as String,
      json['session_2_attendance_status'] as String,
      json['session_3_attendance_status'] as String,
      json['session_4_attendance_status'] as String,
      json['session_5_attendance_status'] as String,
      json['session_6_attendance_status'] as String,
    );

Map<String, dynamic> _$TakeKSTAttendanceRequestModelToJson(
        TakeKSTAttendanceRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'kst_manage_report_id': instance.kst_manage_report_id,
      'list_user_id': instance.list_user_id,
      'list_user_group_name': instance.list_user_group_name,
      'list_user_wing_name': instance.list_user_wing_name,
      'list_user_school_year_name': instance.list_user_school_year_name,
      'session_1_attendance_status': instance.session_1_attendance_status,
      'session_2_attendance_status': instance.session_2_attendance_status,
      'session_3_attendance_status': instance.session_3_attendance_status,
      'session_4_attendance_status': instance.session_4_attendance_status,
      'session_5_attendance_status': instance.session_5_attendance_status,
      'session_6_attendance_status': instance.session_6_attendance_status,
    };
