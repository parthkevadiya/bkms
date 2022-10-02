// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_wont_be_attend_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventWontBeAttendRequestModel _$EventWontBeAttendRequestModelFromJson(
        Map<String, dynamic> json) =>
    EventWontBeAttendRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['event_id'] as String,
    );

Map<String, dynamic> _$EventWontBeAttendRequestModelToJson(
        EventWontBeAttendRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'event_id': instance.event_id,
    };
