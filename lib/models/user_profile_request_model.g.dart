// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileRequestModel _$UserProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['record_id'] as String,
    );

Map<String, dynamic> _$UserProfileRequestModelToJson(
        UserProfileRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'record_id': instance.record_id,
    };
