// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_register_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventRegisterDetailsRequestModel _$EventRegisterDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    EventRegisterDetailsRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['event_id'] as String,
      json['record_id'] as String,
    );

Map<String, dynamic> _$EventRegisterDetailsRequestModelToJson(
        EventRegisterDetailsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'event_id': instance.event_id,
      'record_id': instance.record_id,
    };
