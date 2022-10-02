// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequestModel _$ResetPasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequestModel(
      json['password'] as String,
      json['confirm_password'] as String,
      json['token'] as String,
      json['bkms_id'] as int,
      json['is_child'] as bool,
    );

Map<String, dynamic> _$ResetPasswordRequestModelToJson(
        ResetPasswordRequestModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'confirm_password': instance.confirm_password,
      'token': instance.token,
      'bkms_id': instance.bkms_id,
      'is_child': instance.is_child,
    };
