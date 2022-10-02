// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hangout_type_wise_questions_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HangoutTypeWiseQuestionsRequestModel
    _$HangoutTypeWiseQuestionsRequestModelFromJson(Map<String, dynamic> json) =>
        HangoutTypeWiseQuestionsRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['hangout_type'] as String,
        );

Map<String, dynamic> _$HangoutTypeWiseQuestionsRequestModelToJson(
        HangoutTypeWiseQuestionsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'hangout_type': instance.hangout_type,
    };
