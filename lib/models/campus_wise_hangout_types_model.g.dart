// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_wise_hangout_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusWiseHangoutTypesModel _$CampusWiseHangoutTypesModelFromJson(
        Map<String, dynamic> json) =>
    CampusWiseHangoutTypesModel(
      json['has_error'] as bool?,
      (json['hangout_types'] as List<dynamic>?)
          ?.map((e) => HangoutTypesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CampusWiseHangoutTypesModelToJson(
        CampusWiseHangoutTypesModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'hangout_types': instance.hangout_types,
    };

HangoutTypesModel _$HangoutTypesModelFromJson(Map<String, dynamic> json) =>
    HangoutTypesModel(
      json['id'] as int?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$HangoutTypesModelToJson(HangoutTypesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };
