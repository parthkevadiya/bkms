// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      json['bkms_id'] as int,
      json['email_address'] as String,
      json['password'] as String,
      json['fcm_token'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'bkms_id': instance.bkms_id,
      'email_address': instance.email_address,
      'password': instance.password,
      'fcm_token': instance.fcm_token,
    };
