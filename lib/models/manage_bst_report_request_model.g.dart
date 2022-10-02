// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_bst_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageBSTReportRequestModel _$ManageBSTReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['bst_center_report_id'] as String,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$ManageBSTReportRequestModelToJson(
        ManageBSTReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'page': instance.page,
      'limit': instance.limit,
      'bst_center_report_id': instance.bst_center_report_id,
      'generic_search': instance.generic_search,
    };
