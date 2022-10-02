// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_wise_questions_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionsWiseQuestionsRequestModel
    _$InteractionsWiseQuestionsRequestModelFromJson(
            Map<String, dynamic> json) =>
        InteractionsWiseQuestionsRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['center_id'] as String,
          json['interaction_type'] as String,
        );

Map<String, dynamic> _$InteractionsWiseQuestionsRequestModelToJson(
        InteractionsWiseQuestionsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'center_id': instance.center_id,
      'interaction_type': instance.interaction_type,
    };
