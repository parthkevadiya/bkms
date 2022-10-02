// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kst_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KSTReportRequestModel _$KSTReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    KSTReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['is_filter'] as int,
      json['selected_wing'] as String,
      json['selected_center'] as String,
      json['selected_region'] as String,
      json['selected_year'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$KSTReportRequestModelToJson(
        KSTReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'is_filter': instance.is_filter,
      'selected_wing': instance.selected_wing,
      'selected_center': instance.selected_center,
      'selected_region': instance.selected_region,
      'selected_year': instance.selected_year,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
