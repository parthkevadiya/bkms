// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_interaction_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInteractionDetailsRequestModel
    _$CreateInteractionDetailsRequestModelFromJson(Map<String, dynamic> json) =>
        CreateInteractionDetailsRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
        );

Map<String, dynamic> _$CreateInteractionDetailsRequestModelToJson(
        CreateInteractionDetailsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
    };
