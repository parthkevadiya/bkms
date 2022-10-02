// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenRequestModel _$RefreshTokenRequestModelFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['refresh_token'] as String,
    );

Map<String, dynamic> _$RefreshTokenRequestModelToJson(
        RefreshTokenRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'refresh_token': instance.refresh_token,
    };
