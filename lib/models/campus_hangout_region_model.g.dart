// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_hangout_region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusHangoutRegionModel _$CampusHangoutRegionModelFromJson(
        Map<String, dynamic> json) =>
    CampusHangoutRegionModel(
      json['has_error'] as bool?,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => CHRegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['user_role_type'] as String?,
      json['user_region_id'] as String?,
      json['user_center_id'] as String?,
    );

Map<String, dynamic> _$CampusHangoutRegionModelToJson(
        CampusHangoutRegionModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'regions': instance.regions,
      'user_role_type': instance.user_role_type,
      'user_region_id': instance.user_region_id,
      'user_center_id': instance.user_center_id,
    };

CHRegionModel _$CHRegionModelFromJson(Map<String, dynamic> json) =>
    CHRegionModel(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$CHRegionModelToJson(CHRegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };
