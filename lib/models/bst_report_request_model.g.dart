// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bst_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BSTReportRequestModel _$BSTReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    BSTReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['selected_wing'] as String,
      json['selected_center'] as String,
      json['selected_region'] as String,
      json['sabha_year'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$BSTReportRequestModelToJson(
        BSTReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'selected_wing': instance.selected_wing,
      'selected_center': instance.selected_center,
      'selected_region': instance.selected_region,
      'sabha_year': instance.sabha_year,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
