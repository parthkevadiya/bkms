// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goshthi_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoshthiReportModel _$GoshthiReportModelFromJson(Map<String, dynamic> json) =>
    GoshthiReportModel(
      json['has_error'] as bool?,
      json['goshthi_result'] == null
          ? null
          : GoshthiResultModel.fromJson(
              json['goshthi_result'] as Map<String, dynamic>),
      json['sabha_goshthi_filter'] == null
          ? null
          : SabhaGoshthiFilterModel.fromJson(
              json['sabha_goshthi_filter'] as Map<String, dynamic>),
    )..roleType = json['roleType'] as String?;

Map<String, dynamic> _$GoshthiReportModelToJson(GoshthiReportModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'goshthi_result': instance.goshthi_result,
      'sabha_goshthi_filter': instance.sabha_goshthi_filter,
      'roleType': instance.roleType,
    };

SabhaGoshthiFilterModel _$SabhaGoshthiFilterModelFromJson(
        Map<String, dynamic> json) =>
    SabhaGoshthiFilterModel(
      json['user_role_type'] as String?,
      json['last_sunday'] as String?,
      json['user_region_id'] as String?,
      json['user_center_id'] as String?,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : RegionItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CentersItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['report_center'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ReportCenterItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['gender'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['months'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GoshthiMonthItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['years'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$SabhaGoshthiFilterModelToJson(
        SabhaGoshthiFilterModel instance) =>
    <String, dynamic>{
      'user_role_type': instance.user_role_type,
      'last_sunday': instance.last_sunday,
      'user_region_id': instance.user_region_id,
      'user_center_id': instance.user_center_id,
      'regions': instance.regions,
      'centers': instance.centers,
      'report_center': instance.report_center,
      'gender': instance.gender,
      'months': instance.months,
      'years': instance.years,
    };

RegionItems _$RegionItemsFromJson(Map<String, dynamic> json) => RegionItems(
      json['id'] as int,
      json['RegionName'] as String,
    );

Map<String, dynamic> _$RegionItemsToJson(RegionItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

CentersItems _$CentersItemsFromJson(Map<String, dynamic> json) => CentersItems(
      json['id'] as int,
      json['CenterName'] as String,
      json['RegionId'] as String,
    );

Map<String, dynamic> _$CentersItemsToJson(CentersItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

ReportCenterItems _$ReportCenterItemsFromJson(Map<String, dynamic> json) =>
    ReportCenterItems(
      json['id'] as int?,
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$ReportCenterItemsToJson(ReportCenterItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

GoshthiResultModel _$GoshthiResultModelFromJson(Map<String, dynamic> json) =>
    GoshthiResultModel(
      json['current_page'] as int?,
      json['from'] as int?,
      json['last_page'] as int?,
      json['per_page'] as int?,
      json['to'] as int?,
      json['total'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GoshthiDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoshthiResultModelToJson(GoshthiResultModel instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'from': instance.from,
      'last_page': instance.last_page,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'data': instance.data,
    };

GoshthiMonthItems _$GoshthiMonthItemsFromJson(Map<String, dynamic> json) =>
    GoshthiMonthItems(
      json['id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$GoshthiMonthItemsToJson(GoshthiMonthItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GoshthiDataModel _$GoshthiDataModelFromJson(Map<String, dynamic> json) =>
    GoshthiDataModel(
      json['id'] as String?,
      json['current_page'] as String?,
      json['sabha_date'] as String?,
      json['sabha_label'] as String?,
      json['attendees'] as String?,
      json['created_by'] as String?,
      json['region_id'] as String?,
      json['center_id'] as String?,
      json['updated_by'] as String?,
      json['sabha_gender'] as String?,
      json['sabha_year'] as String?,
      json['month_number'] as String?,
      json['goshthi_held'] as String?,
      json['report_status'] as String?,
      json['wing_id'] as String?,
      json['RegionName'] as String?,
      json['CenterName'] as String?,
      json['goshthi_report_status'] as String?,
      json['total_ratio'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$GoshthiDataModelToJson(GoshthiDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current_page': instance.current_page,
      'sabha_date': instance.sabha_date,
      'sabha_label': instance.sabha_label,
      'attendees': instance.attendees,
      'created_by': instance.created_by,
      'region_id': instance.region_id,
      'center_id': instance.center_id,
      'updated_by': instance.updated_by,
      'sabha_gender': instance.sabha_gender,
      'sabha_year': instance.sabha_year,
      'month_number': instance.month_number,
      'goshthi_held': instance.goshthi_held,
      'report_status': instance.report_status,
      'wing_id': instance.wing_id,
      'RegionName': instance.RegionName,
      'CenterName': instance.CenterName,
      'goshthi_report_status': instance.goshthi_report_status,
      'total_ratio': instance.total_ratio,
      'wingName': instance.wingName,
    };
