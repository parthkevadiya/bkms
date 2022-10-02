// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      json['has_error'] as bool?,
      json['sabha_result'] == null
          ? null
          : SabhaResultModel.fromJson(
              json['sabha_result'] as Map<String, dynamic>),
      json['sabha_filter'] == null
          ? null
          : SabhaFilterModel.fromJson(
              json['sabha_filter'] as Map<String, dynamic>),
    )..roleType = json['roleType'] as String?;

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'sabha_result': instance.sabha_result,
      'sabha_filter': instance.sabha_filter,
      'roleType': instance.roleType,
    };

SabhaResultModel _$SabhaResultModelFromJson(Map<String, dynamic> json) =>
    SabhaResultModel(
      json['current_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ReportsListDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['links'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : LinksModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String?,
      json['last_page_url'] as String?,
      json['next_page_url'] as String?,
      json['prev_page_url'] as String?,
      json['path'] as String?,
      json['from'] as int?,
      json['to'] as int?,
      json['last_page'] as int?,
      json['per_page'] as int?,
      json['total'] as int?,
    );

Map<String, dynamic> _$SabhaResultModelToJson(SabhaResultModel instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'links': instance.links,
      'first_page_url': instance.first_page_url,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'prev_page_url': instance.prev_page_url,
      'path': instance.path,
      'from': instance.from,
      'to': instance.to,
      'last_page': instance.last_page,
      'per_page': instance.per_page,
      'total': instance.total,
    };

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
      json['url'] as String?,
      json['label'] as String?,
      json['active'] as bool,
    );

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };

ReportsListDataModel _$ReportsListDataModelFromJson(
        Map<String, dynamic> json) =>
    ReportsListDataModel(
      json['id'] as int,
      json['sabha_label'] as String?,
      json['center_id'] as String?,
      json['region_id'] as String?,
      json['wing_id'] as String?,
      json['sabha_date'] as String?,
      json['sabha_week_date'] as String?,
      json['sabha_status'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingName'] as String?,
      json['total_ratio'] as String?,
    );

Map<String, dynamic> _$ReportsListDataModelToJson(
        ReportsListDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sabha_label': instance.sabha_label,
      'center_id': instance.center_id,
      'region_id': instance.region_id,
      'wing_id': instance.wing_id,
      'sabha_date': instance.sabha_date,
      'sabha_week_date': instance.sabha_week_date,
      'sabha_status': instance.sabha_status,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingName': instance.wingName,
      'total_ratio': instance.total_ratio,
    };

SabhaFilterModel _$SabhaFilterModelFromJson(Map<String, dynamic> json) =>
    SabhaFilterModel(
      json['has_error'] as bool,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : RegionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['wings'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : WingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CentersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['years'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['report_status'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ReportStatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sabha_week'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['user_wings'] as int?,
      json['last_sunday'] as String?,
      json['user_region_id'] as String?,
      json['user_center_id'] as String?,
      json['selected_week'] as String?,
    );

Map<String, dynamic> _$SabhaFilterModelToJson(SabhaFilterModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'regions': instance.regions,
      'wings': instance.wings,
      'centers': instance.centers,
      'years': instance.years,
      'report_status': instance.report_status,
      'sabha_week': instance.sabha_week,
      'user_wings': instance.user_wings,
      'last_sunday': instance.last_sunday,
      'user_region_id': instance.user_region_id,
      'user_center_id': instance.user_center_id,
      'selected_week': instance.selected_week,
    };

RegionsModel _$RegionsModelFromJson(Map<String, dynamic> json) => RegionsModel(
      json['id'] as int,
      json['RegionName'] as String,
    );

Map<String, dynamic> _$RegionsModelToJson(RegionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

WingsModel _$WingsModelFromJson(Map<String, dynamic> json) => WingsModel(
      json['id'] as int,
      json['wingName'] as String,
    );

Map<String, dynamic> _$WingsModelToJson(WingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

CentersModel _$CentersModelFromJson(Map<String, dynamic> json) => CentersModel(
      json['id'] as int,
      json['CenterName'] as String,
      json['RegionId'] as String,
    );

Map<String, dynamic> _$CentersModelToJson(CentersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

ReportStatusModel _$ReportStatusModelFromJson(Map<String, dynamic> json) =>
    ReportStatusModel(
      json['id'] as int,
      json['value'] as String,
    );

Map<String, dynamic> _$ReportStatusModelToJson(ReportStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
