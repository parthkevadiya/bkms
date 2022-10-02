// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sabha_report_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SabhaReportAttendanceRequestModel _$SabhaReportAttendanceRequestModelFromJson(
        Map<String, dynamic> json) =>
    SabhaReportAttendanceRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['sabha_id'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['search_name'] as String,
      json['selected_wing'] as String,
      json['selected_center'] as String,
      json['selected_region'] as String,
      json['edit_mode'] as String,
    );

Map<String, dynamic> _$SabhaReportAttendanceRequestModelToJson(
        SabhaReportAttendanceRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'sabha_id': instance.sabha_id,
      'page': instance.page,
      'limit': instance.limit,
      'search_name': instance.search_name,
      'selected_wing': instance.selected_wing,
      'selected_center': instance.selected_center,
      'selected_region': instance.selected_region,
      'edit_mode': instance.edit_mode,
    };
