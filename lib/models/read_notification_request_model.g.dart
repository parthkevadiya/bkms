// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_notification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadNotificationRequestModel _$ReadNotificationRequestModelFromJson(
        Map<String, dynamic> json) =>
    ReadNotificationRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['notification_id'] as String,
    );

Map<String, dynamic> _$ReadNotificationRequestModelToJson(
        ReadNotificationRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'notification_id': instance.notification_id,
    };
