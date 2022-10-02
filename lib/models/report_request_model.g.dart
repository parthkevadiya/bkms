// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportRequestModel _$ReportRequestModelFromJson(Map<String, dynamic> json) =>
    ReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['is_filter'] as int,
      json['selected_region'] as String,
      json['selected_center'] as String,
      json['selected_wing'] as String,
      json['sabha_year'] as String,
      json['sabha_week'] as String,
      json['report_status'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$ReportRequestModelToJson(ReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'is_filter': instance.is_filter,
      'selected_region': instance.selected_region,
      'selected_center': instance.selected_center,
      'selected_wing': instance.selected_wing,
      'sabha_year': instance.sabha_year,
      'sabha_week': instance.sabha_week,
      'report_status': instance.report_status,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
