// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_all_bst_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAllBSTReportRequestModel _$CreateAllBSTReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateAllBSTReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
    );

Map<String, dynamic> _$CreateAllBSTReportRequestModelToJson(
        CreateAllBSTReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
    };
