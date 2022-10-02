// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_wise_campus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionWiseCampusModel _$RegionWiseCampusModelFromJson(
        Map<String, dynamic> json) =>
    RegionWiseCampusModel(
      json['has_error'] as bool?,
      (json['campus'] as List<dynamic>?)
          ?.map((e) => RWCCampusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['campus_count'] as int?,
    );

Map<String, dynamic> _$RegionWiseCampusModelToJson(
        RegionWiseCampusModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'campus': instance.campus,
      'campus_count': instance.campus_count,
    };

RWCCampusModel _$RWCCampusModelFromJson(Map<String, dynamic> json) =>
    RWCCampusModel(
      json['id'] as String?,
      json['campus_name'] as String?,
      json['region_id'] as String?,
    );

Map<String, dynamic> _$RWCCampusModelToJson(RWCCampusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'campus_name': instance.campus_name,
      'region_id': instance.region_id,
    };
