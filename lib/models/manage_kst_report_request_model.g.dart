// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_kst_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageKSTReportRequestModel _$ManageKSTReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['kst_report_id'] as String,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$ManageKSTReportRequestModelToJson(
        ManageKSTReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'page': instance.page,
      'limit': instance.limit,
      'kst_report_id': instance.kst_report_id,
      'generic_search': instance.generic_search,
    };
