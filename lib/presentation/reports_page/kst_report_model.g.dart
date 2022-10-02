// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kst_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KSTReportModel _$KSTReportModelFromJson(Map<String, dynamic> json) =>
    KSTReportModel(
      json['has_error'] as bool?,
      json['kst_result'] == null
          ? null
          : KSTResultModel.fromJson(json['kst_result'] as Map<String, dynamic>),
      json['kst_filter'] == null
          ? null
          : KSTFilterModel.fromJson(json['kst_filter'] as Map<String, dynamic>),
    )..roleType = json['roleType'] as String?;

Map<String, dynamic> _$KSTReportModelToJson(KSTReportModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'kst_result': instance.kst_result,
      'kst_filter': instance.kst_filter,
      'roleType': instance.roleType,
    };

KSTResultModel _$KSTResultModelFromJson(Map<String, dynamic> json) =>
    KSTResultModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : KSTReportListDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$KSTResultModelToJson(KSTResultModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

KSTReportListDataModel _$KSTReportListDataModelFromJson(
        Map<String, dynamic> json) =>
    KSTReportListDataModel(
      json['id'],
      json['participant_center_id'] as String?,
      json['average'] as String?,
      json['fall_year'] as String?,
      json['spring_year'] as String?,
      json['region_id'] as String?,
      json['host_center_id'] as String?,
      json['wing_id'] as String?,
      json['kst_year'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$KSTReportListDataModelToJson(
        KSTReportListDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participant_center_id': instance.participant_center_id,
      'average': instance.average,
      'fall_year': instance.fall_year,
      'spring_year': instance.spring_year,
      'region_id': instance.region_id,
      'host_center_id': instance.host_center_id,
      'wing_id': instance.wing_id,
      'kst_year': instance.kst_year,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingName': instance.wingName,
    };

KSTFilterModel _$KSTFilterModelFromJson(Map<String, dynamic> json) =>
    KSTFilterModel(
      json['user_wings'] as int?,
      json['date'] as String?,
      json['user_region_id'] as String?,
      json['user_center_id'] as String?,
      (json['wings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : KSTWingsItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : KSTRegionItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : KSTCentersItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['kst_centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : KSTCentersItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['years'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$KSTFilterModelToJson(KSTFilterModel instance) =>
    <String, dynamic>{
      'user_wings': instance.user_wings,
      'date': instance.date,
      'user_region_id': instance.user_region_id,
      'user_center_id': instance.user_center_id,
      'wings': instance.wings,
      'regions': instance.regions,
      'centers': instance.centers,
      'kst_centers': instance.kst_centers,
      'years': instance.years,
    };

KSTWingsItems _$KSTWingsItemsFromJson(Map<String, dynamic> json) =>
    KSTWingsItems(
      json['id'],
      json['wingName'] as String?,
    );

Map<String, dynamic> _$KSTWingsItemsToJson(KSTWingsItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

KSTRegionItems _$KSTRegionItemsFromJson(Map<String, dynamic> json) =>
    KSTRegionItems(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$KSTRegionItemsToJson(KSTRegionItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

KSTCentersItems _$KSTCentersItemsFromJson(Map<String, dynamic> json) =>
    KSTCentersItems(
      json['id'],
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$KSTCentersItemsToJson(KSTCentersItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };
