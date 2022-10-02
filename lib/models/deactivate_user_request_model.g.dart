// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deactivate_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeactivateUserRequestModel _$DeactivateUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    DeactivateUserRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as int,
      json['record_id'] as String,
    );

Map<String, dynamic> _$DeactivateUserRequestModelToJson(
        DeactivateUserRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'record_id': instance.record_id,
    };
