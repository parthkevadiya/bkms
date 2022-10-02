// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standardErrorResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardErrorResponse _$StandardErrorResponseFromJson(
        Map<String, dynamic> json) =>
    StandardErrorResponse(
      json['status'] as int,
      json['message'] as String,
    );

Map<String, dynamic> _$StandardErrorResponseToJson(
        StandardErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
