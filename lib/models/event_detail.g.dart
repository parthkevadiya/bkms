// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetailModel _$EventDetailModelFromJson(Map<String, dynamic> json) =>
    EventDetailModel(
      json['name'] as String,
      json['country'] as String,
      json['date_time'] as String,
      json['image'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$EventDetailModelToJson(EventDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'date_time': instance.date_time,
      'image': instance.image,
      'description': instance.description,
    };
