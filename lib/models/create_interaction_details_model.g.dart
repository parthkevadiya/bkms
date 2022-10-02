// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_interaction_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInteractionDetailsModel _$CreateInteractionDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CreateInteractionDetailsModel(
      json['has_error'] as bool?,
      json['networking_data'] == null
          ? null
          : NetworkingDataModel.fromJson(
              json['networking_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateInteractionDetailsModelToJson(
        CreateInteractionDetailsModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'networking_data': instance.networking_data,
    };

NetworkingDataModel _$NetworkingDataModelFromJson(Map<String, dynamic> json) =>
    NetworkingDataModel(
      json['user_role_type'] as String?,
      json['user_region_id'] as String?,
      json['user_center_id'] as String?,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CNERegionItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CNECentersItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkingDataModelToJson(
        NetworkingDataModel instance) =>
    <String, dynamic>{
      'user_role_type': instance.user_role_type,
      'user_region_id': instance.user_region_id,
      'user_center_id': instance.user_center_id,
      'regions': instance.regions,
      'centers': instance.centers,
    };

CNERegionItems _$CNERegionItemsFromJson(Map<String, dynamic> json) =>
    CNERegionItems(
      json['id'] as int?,
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$CNERegionItemsToJson(CNERegionItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

CNECentersItems _$CNECentersItemsFromJson(Map<String, dynamic> json) =>
    CNECentersItems(
      json['id'] as int?,
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$CNECentersItemsToJson(CNECentersItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };
