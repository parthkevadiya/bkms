// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goshthi_report_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoshthiReportAttendanceRequestModel
    _$GoshthiReportAttendanceRequestModelFromJson(Map<String, dynamic> json) =>
        GoshthiReportAttendanceRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['karyakar_goshti_sabha_id'] as String,
          json['page'] as String,
          json['limit'] as String,
          json['search_name'] as String,
          json['wing_id'] as String,
          json['selected_center'] as String,
          json['selected_region'] as String,
          json['checkfilter'] as String,
          json['gender'] as String,
        );

Map<String, dynamic> _$GoshthiReportAttendanceRequestModelToJson(
        GoshthiReportAttendanceRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'karyakar_goshti_sabha_id': instance.karyakar_goshti_sabha_id,
      'page': instance.page,
      'limit': instance.limit,
      'search_name': instance.search_name,
      'wing_id': instance.wing_id,
      'selected_center': instance.selected_center,
      'selected_region': instance.selected_region,
      'checkfilter': instance.checkfilter,
      'gender': instance.gender,
    };
