// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_region_wise_campus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HRegionWiseCampusModel _$HRegionWiseCampusModelFromJson(
        Map<String, dynamic> json) =>
    HRegionWiseCampusModel(
      json['has_error'] as bool?,
      (json['campus'] as List<dynamic>?)
          ?.map((e) => HCampusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['campus_count'] as int?,
    );

Map<String, dynamic> _$HRegionWiseCampusModelToJson(
        HRegionWiseCampusModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'campus': instance.campus,
      'campus_count': instance.campus_count,
    };

HCampusModel _$HCampusModelFromJson(Map<String, dynamic> json) => HCampusModel(
      json['id'] as String?,
      json['campus_name'] as String?,
      json['region_id'] as String?,
    );

Map<String, dynamic> _$HCampusModelToJson(HCampusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'campus_name': instance.campus_name,
      'region_id': instance.region_id,
    };
