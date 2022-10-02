// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_wise_interaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterWiseInteractionTypesModel _$CenterWiseInteractionTypesModelFromJson(
        Map<String, dynamic> json) =>
    CenterWiseInteractionTypesModel(
      json['has_error'] as bool?,
      json['type_count'] as int?,
      (json['type'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$CenterWiseInteractionTypesModelToJson(
        CenterWiseInteractionTypesModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'type_count': instance.type_count,
      'type': instance.type,
    };
