// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordRequestModel _$ForgotPasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordRequestModel(
      json['bkms_id'] as int,
      json['email_address'] as String,
    );

Map<String, dynamic> _$ForgotPasswordRequestModelToJson(
        ForgotPasswordRequestModel instance) =>
    <String, dynamic>{
      'bkms_id': instance.bkms_id,
      'email_address': instance.email_address,
    };
