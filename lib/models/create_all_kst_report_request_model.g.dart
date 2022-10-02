// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_all_kst_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAllKSTReportRequestModel _$CreateAllKSTReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateAllKSTReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['report_center'] as String,
      json['report_wing'] as String,
      json['all_center_report'] as bool,
    );

Map<String, dynamic> _$CreateAllKSTReportRequestModelToJson(
        CreateAllKSTReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'report_center': instance.report_center,
      'report_wing': instance.report_wing,
      'all_center_report': instance.all_center_report,
    };
