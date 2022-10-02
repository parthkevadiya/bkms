// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      json['login_user_type'] as int,
      json['login_parent_type'] as String,
      json['access_token'] as String,
      json['refresh_token'],
      json['token_type'] as String,
      json['bkms_id'] as int,
      json['password'] as String,
      json['f_name'] as String,
      json['m_name'] as String,
      json['l_name'] as String,
      json['email'] as String?,
      json['mobile_number'] as String?,
      json['greeting_title'] as String,
      json['role'] as String,
      json['is_biomatric_login_enbabled'] as String,
      json['is_profile'],
      json['is_report'],
      json['is_record'],
      json['is_notification'],
      json['fcm_token'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'token_type': instance.token_type,
      'bkms_id': instance.bkms_id,
      'password': instance.password,
      'f_name': instance.f_name,
      'm_name': instance.m_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'mobile_number': instance.mobile_number,
      'greeting_title': instance.greeting_title,
      'role': instance.role,
      'is_biomatric_login_enbabled': instance.is_biomatric_login_enbabled,
      'is_profile': instance.is_profile,
      'is_report': instance.is_report,
      'is_record': instance.is_record,
      'is_notification': instance.is_notification,
      'fcm_token': instance.fcm_token,
    };
