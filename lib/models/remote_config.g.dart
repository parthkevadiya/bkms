// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigModel _$RemoteConfigModelFromJson(Map<String, dynamic> json) =>
    RemoteConfigModel(
      json['base_url'] as String,
      json['publish_key'] as String,
    );

Map<String, dynamic> _$RemoteConfigModelToJson(RemoteConfigModel instance) =>
    <String, dynamic>{
      'base_url': instance.base_url,
      'publish_key': instance.publish_key,
    };
