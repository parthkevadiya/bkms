// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_bst_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageBSTReportModel _$ManageBSTReportModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTReportModel(
      json['has_error'] as bool?,
      json['manage_bst_report_list'] == null
          ? null
          : ManageBSTReportListModel.fromJson(
              json['manage_bst_report_list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageBSTReportModelToJson(
        ManageBSTReportModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'manage_bst_report_list': instance.manage_bst_report_list,
    };

ManageBSTReportListModel _$ManageBSTReportListModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTReportListModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ManageBSTReportListDataModel.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$ManageBSTReportListModelToJson(
        ManageBSTReportListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

ManageBSTReportListDataModel _$ManageBSTReportListDataModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTReportListDataModel(
      json['id'] as String?,
      json['name'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingName'] as String?,
      json['fall_year'] as String?,
      json['spring_year'] as String?,
      json['bst_report_status'] as String?,
      json['wing_id'] as String?,
      json['region_id'] as String?,
      json['center_id'] as String?,
    );

Map<String, dynamic> _$ManageBSTReportListDataModelToJson(
        ManageBSTReportListDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingName': instance.wingName,
      'fall_year': instance.fall_year,
      'spring_year': instance.spring_year,
      'bst_report_status': instance.bst_report_status,
      'wing_id': instance.wing_id,
      'region_id': instance.region_id,
      'center_id': instance.center_id,
    };
