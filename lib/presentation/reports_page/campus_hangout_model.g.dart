// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_hangout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusHangoutModel _$CampusHangoutModelFromJson(Map<String, dynamic> json) =>
    CampusHangoutModel(
      json['has_error'] as bool?,
      json['campus_hangout_list'] == null
          ? null
          : CampusHangoutListModel.fromJson(
              json['campus_hangout_list'] as Map<String, dynamic>),
      json['search_filter'] == null
          ? null
          : CampusHangoutSearchFilterModel.fromJson(
              json['search_filter'] as Map<String, dynamic>),
    )..roleType = json['roleType'] as String?;

Map<String, dynamic> _$CampusHangoutModelToJson(CampusHangoutModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'campus_hangout_list': instance.campus_hangout_list,
      'search_filter': instance.search_filter,
      'roleType': instance.roleType,
    };

CampusHangoutListModel _$CampusHangoutListModelFromJson(
        Map<String, dynamic> json) =>
    CampusHangoutListModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CampusHangoutDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$CampusHangoutListModelToJson(
        CampusHangoutListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

CampusHangoutDataModel _$CampusHangoutDataModelFromJson(
        Map<String, dynamic> json) =>
    CampusHangoutDataModel(
      json['id'] as String?,
      json['wing_id'] as String?,
      json['region_id'] as String?,
      json['campus_id'] as String?,
      json['year'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingName'] as String?,
      json['average'] as String?,
      json['campus_name'] as String?,
    );

Map<String, dynamic> _$CampusHangoutDataModelToJson(
        CampusHangoutDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wing_id': instance.wing_id,
      'region_id': instance.region_id,
      'campus_id': instance.campus_id,
      'year': instance.year,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingName': instance.wingName,
      'average': instance.average,
      'campus_name': instance.campus_name,
    };

CampusHangoutSearchFilterModel _$CampusHangoutSearchFilterModelFromJson(
        Map<String, dynamic> json) =>
    CampusHangoutSearchFilterModel(
      json['user_wings'] as int?,
      json['user_role_type'] as String?,
      json['user_region_id'] as String?,
      json['user_center_id'] as String?,
      (json['wings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CHWingsItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CHRegionItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['campus_region'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CampusRegionItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CHCentersItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['years'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$CampusHangoutSearchFilterModelToJson(
        CampusHangoutSearchFilterModel instance) =>
    <String, dynamic>{
      'user_wings': instance.user_wings,
      'user_role_type': instance.user_role_type,
      'user_region_id': instance.user_region_id,
      'user_center_id': instance.user_center_id,
      'wings': instance.wings,
      'regions': instance.regions,
      'campus_region': instance.campus_region,
      'centers': instance.centers,
      'years': instance.years,
    };

CHWingsItems _$CHWingsItemsFromJson(Map<String, dynamic> json) => CHWingsItems(
      json['id'],
      json['wingName'] as String?,
    );

Map<String, dynamic> _$CHWingsItemsToJson(CHWingsItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

CHRegionItems _$CHRegionItemsFromJson(Map<String, dynamic> json) =>
    CHRegionItems(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$CHRegionItemsToJson(CHRegionItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

CampusRegionItems _$CampusRegionItemsFromJson(Map<String, dynamic> json) =>
    CampusRegionItems(
      json['region_id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$CampusRegionItemsToJson(CampusRegionItems instance) =>
    <String, dynamic>{
      'region_id': instance.region_id,
      'RegionName': instance.RegionName,
    };

CHCentersItems _$CHCentersItemsFromJson(Map<String, dynamic> json) =>
    CHCentersItems(
      json['id'],
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$CHCentersItemsToJson(CHCentersItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };
