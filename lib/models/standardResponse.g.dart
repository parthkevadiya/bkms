// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standardResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardResponse _$StandardResponseFromJson(Map<String, dynamic> json) =>
    StandardResponse(
      json['status'] as int,
      json['message'] as String,
      json['data'],
    );

Map<String, dynamic> _$StandardResponseToJson(StandardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
