// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_wise_interaction_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterWiseInteractionRequestModel _$CenterWiseInteractionRequestModelFromJson(
        Map<String, dynamic> json) =>
    CenterWiseInteractionRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['center_id'] as String,
    );

Map<String, dynamic> _$CenterWiseInteractionRequestModelToJson(
        CenterWiseInteractionRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'center_id': instance.center_id,
    };
