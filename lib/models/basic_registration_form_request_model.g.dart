// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_registration_form_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicRegistrationFormRequestModel _$BasicRegistrationFormRequestModelFromJson(
        Map<String, dynamic> json) =>
    BasicRegistrationFormRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['record_id'] as String,
      json['event_id'] as String,
      json['is_view_mode'] as bool,
    );

Map<String, dynamic> _$BasicRegistrationFormRequestModelToJson(
        BasicRegistrationFormRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'record_id': instance.record_id,
      'event_id': instance.event_id,
      'is_view_mode': instance.is_view_mode,
    };
