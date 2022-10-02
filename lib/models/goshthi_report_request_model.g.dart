// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goshthi_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoshthiReportRequestModel _$GoshthiReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    GoshthiReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['selected_center'] as String,
      json['selected_region'] as String,
      json['sabha_month'] as String,
      json['sabha_year'] as String,
      json['sabha_gender'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$GoshthiReportRequestModelToJson(
        GoshthiReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'selected_center': instance.selected_center,
      'selected_region': instance.selected_region,
      'sabha_month': instance.sabha_month,
      'sabha_year': instance.sabha_year,
      'sabha_gender': instance.sabha_gender,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
