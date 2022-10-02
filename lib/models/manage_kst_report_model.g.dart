// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_kst_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageKSTReportModel _$ManageKSTReportModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTReportModel(
      json['has_error'] as bool?,
      json['manage_kst_report'] == null
          ? null
          : ManageKSTReportListModel.fromJson(
              json['manage_kst_report'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageKSTReportModelToJson(
        ManageKSTReportModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'manage_kst_report': instance.manage_kst_report,
    };

ManageKSTReportListModel _$ManageKSTReportListModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTReportListModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ManageKSTReportListDataModel.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$ManageKSTReportListModelToJson(
        ManageKSTReportListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

ManageKSTReportListDataModel _$ManageKSTReportListDataModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTReportListDataModel(
      json['id'] as String?,
      json['name'] as String?,
      json['report_year'] as String?,
      json['host_center_id'] as String?,
      json['region_id'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wing_id'] as String?,
      json['wingName'] as String?,
      json['kst_report_status'] as String?,
    );

Map<String, dynamic> _$ManageKSTReportListDataModelToJson(
        ManageKSTReportListDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'report_year': instance.report_year,
      'host_center_id': instance.host_center_id,
      'region_id': instance.region_id,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wing_id': instance.wing_id,
      'wingName': instance.wingName,
      'kst_report_status': instance.kst_report_status,
    };
