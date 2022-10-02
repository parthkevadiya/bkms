// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transportation_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportationRequestModel _$TransportationRequestModelFromJson(
        Map<String, dynamic> json) =>
    TransportationRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['event_id'] as String,
      json['userevent_id'] as String,
    );

Map<String, dynamic> _$TransportationRequestModelToJson(
        TransportationRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'event_id': instance.event_id,
      'userevent_id': instance.userevent_id,
    };
