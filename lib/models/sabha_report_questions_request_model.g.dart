// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sabha_report_questions_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SabhaReportQuestionsRequestModel _$SabhaReportQuestionsRequestModelFromJson(
        Map<String, dynamic> json) =>
    SabhaReportQuestionsRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['sabha_id'] as String,
    );

Map<String, dynamic> _$SabhaReportQuestionsRequestModelToJson(
        SabhaReportQuestionsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'sabha_id': instance.sabha_id,
    };
