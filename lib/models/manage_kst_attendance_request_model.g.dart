// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_kst_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageKSTAttendanceRequestModel _$ManageKSTAttendanceRequestModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTAttendanceRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['kst_manage_report_id'] as String,
      json['edit_mode'] as String,
      json['selected_wing'] as String,
      json['selected_center'] as String,
      json['selected_region'] as String,
      json['search_user_id'] as String,
      json['group'] as String,
      json['subgroup'] as String,
      json['schoolyear'] as String,
      json['first_name'] as String,
      json['middle_name'] as String,
      json['last_name'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$ManageKSTAttendanceRequestModelToJson(
        ManageKSTAttendanceRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'kst_manage_report_id': instance.kst_manage_report_id,
      'edit_mode': instance.edit_mode,
      'selected_wing': instance.selected_wing,
      'selected_center': instance.selected_center,
      'selected_region': instance.selected_region,
      'search_user_id': instance.search_user_id,
      'group': instance.group,
      'subgroup': instance.subgroup,
      'schoolyear': instance.schoolyear,
      'first_name': instance.first_name,
      'middle_name': instance.middle_name,
      'last_name': instance.last_name,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
