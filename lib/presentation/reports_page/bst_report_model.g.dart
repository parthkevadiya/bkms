// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bst_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BSTReportModel _$BSTReportModelFromJson(Map<String, dynamic> json) =>
    BSTReportModel(
      json['has_error'] as bool?,
      json['bst_report_list'] == null
          ? null
          : BSTReportListModel.fromJson(
              json['bst_report_list'] as Map<String, dynamic>),
      json['search_filter'] == null
          ? null
          : BSSTSearchFilterModel.fromJson(
              json['search_filter'] as Map<String, dynamic>),
    )..roleType = json['roleType'] as String?;

Map<String, dynamic> _$BSTReportModelToJson(BSTReportModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'bst_report_list': instance.bst_report_list,
      'search_filter': instance.search_filter,
      'roleType': instance.roleType,
    };

BSTReportListModel _$BSTReportListModelFromJson(Map<String, dynamic> json) =>
    BSTReportListModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BSTReportListDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$BSTReportListModelToJson(BSTReportListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

BSTReportListDataModel _$BSTReportListDataModelFromJson(
        Map<String, dynamic> json) =>
    BSTReportListDataModel(
      json['id'] as String?,
      json['region_id'] as String?,
      json['host_center_id'] as String?,
      json['year'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingName'] as String?,
      json['average'] as String?,
      json['wing_id'] as String?,
    );

Map<String, dynamic> _$BSTReportListDataModelToJson(
        BSTReportListDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region_id': instance.region_id,
      'host_center_id': instance.host_center_id,
      'year': instance.year,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingName': instance.wingName,
      'average': instance.average,
      'wing_id': instance.wing_id,
    };

BSSTSearchFilterModel _$BSSTSearchFilterModelFromJson(
        Map<String, dynamic> json) =>
    BSSTSearchFilterModel(
      json['user_wing_set'] as int?,
      json['user_wings'] as int?,
      json['user_role_type'] as String?,
      json['last_sunday'] as String?,
      json['user_region_id'] as String?,
      json['user_center_id'] as String?,
      (json['wings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BSTWingsItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BSTRegionItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BSTCentersItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['bst_centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BSTCentersItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['years'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$BSSTSearchFilterModelToJson(
        BSSTSearchFilterModel instance) =>
    <String, dynamic>{
      'user_wing_set': instance.user_wing_set,
      'user_wings': instance.user_wings,
      'user_role_type': instance.user_role_type,
      'last_sunday': instance.last_sunday,
      'user_region_id': instance.user_region_id,
      'user_center_id': instance.user_center_id,
      'wings': instance.wings,
      'regions': instance.regions,
      'centers': instance.centers,
      'bst_centers': instance.bst_centers,
      'years': instance.years,
    };

BSTWingsItems _$BSTWingsItemsFromJson(Map<String, dynamic> json) =>
    BSTWingsItems(
      json['id'],
      json['wingName'] as String?,
    );

Map<String, dynamic> _$BSTWingsItemsToJson(BSTWingsItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

BSTRegionItems _$BSTRegionItemsFromJson(Map<String, dynamic> json) =>
    BSTRegionItems(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$BSTRegionItemsToJson(BSTRegionItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

BSTCentersItems _$BSTCentersItemsFromJson(Map<String, dynamic> json) =>
    BSTCentersItems(
      json['id'],
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$BSTCentersItemsToJson(BSTCentersItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };
