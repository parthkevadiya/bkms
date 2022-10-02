// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liability_form_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiabilityFormRequestModel _$LiabilityFormRequestModelFromJson(
        Map<String, dynamic> json) =>
    LiabilityFormRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['event_id'] as String,
      json['userevent_id'] as String,
      json['event_user_type'] as String,
    );

Map<String, dynamic> _$LiabilityFormRequestModelToJson(
        LiabilityFormRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'event_id': instance.event_id,
      'userevent_id': instance.userevent_id,
      'event_user_type': instance.event_user_type,
    };
