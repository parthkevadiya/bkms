// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetailRequestModel _$EventDetailRequestModelFromJson(
        Map<String, dynamic> json) =>
    EventDetailRequestModel(
      json['bkms_id'] as String,
      json['event_id'] as String,
    );

Map<String, dynamic> _$EventDetailRequestModelToJson(
        EventDetailRequestModel instance) =>
    <String, dynamic>{
      'bkms_id': instance.bkms_id,
      'event_id': instance.event_id,
    };
