// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goshthi_report_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoshthiReportAttendanceModel _$GoshthiReportAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    GoshthiReportAttendanceModel(
      json['has_error'] as bool?,
      json['attendance_result'] == null
          ? null
          : AttendanceResultModel.fromJson(
              json['attendance_result'] as Map<String, dynamic>),
      json['filter_data'] == null
          ? null
          : GoshthiFiltersDataModel.fromJson(
              json['filter_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoshthiReportAttendanceModelToJson(
        GoshthiReportAttendanceModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'attendance_result': instance.attendance_result,
      'filter_data': instance.filter_data,
    };

GoshthiFiltersDataModel _$GoshthiFiltersDataModelFromJson(
        Map<String, dynamic> json) =>
    GoshthiFiltersDataModel(
      json['karyakar_goshti_sabha_id'] as String?,
      json['date'] as String?,
      json['myregion'] as String?,
      json['mycenter'] as String?,
      json['Gender'] as String?,
      json['goshthi_month'] as String?,
      json['is_adminuser'] as int?,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GoshthiRegionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GoshthiCentersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['goshthi_wing'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GoshthiGoshthiWingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoshthiFiltersDataModelToJson(
        GoshthiFiltersDataModel instance) =>
    <String, dynamic>{
      'karyakar_goshti_sabha_id': instance.karyakar_goshti_sabha_id,
      'date': instance.date,
      'myregion': instance.myregion,
      'mycenter': instance.mycenter,
      'Gender': instance.Gender,
      'goshthi_month': instance.goshthi_month,
      'is_adminuser': instance.is_adminuser,
      'regions': instance.regions,
      'centers': instance.centers,
      'goshthi_wing': instance.goshthi_wing,
    };

GoshthiRegionsModel _$GoshthiRegionsModelFromJson(Map<String, dynamic> json) =>
    GoshthiRegionsModel(
      json['id'] as String?,
      json['RegionName'] as String?,
      json['country_id'] as String?,
    );

Map<String, dynamic> _$GoshthiRegionsModelToJson(
        GoshthiRegionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
      'country_id': instance.country_id,
    };

GoshthiCentersModel _$GoshthiCentersModelFromJson(Map<String, dynamic> json) =>
    GoshthiCentersModel(
      json['id'] as String?,
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$GoshthiCentersModelToJson(
        GoshthiCentersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

GoshthiGoshthiWingModel _$GoshthiGoshthiWingModelFromJson(
        Map<String, dynamic> json) =>
    GoshthiGoshthiWingModel(
      json['id'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$GoshthiGoshthiWingModelToJson(
        GoshthiGoshthiWingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

AttendanceResultModel _$AttendanceResultModelFromJson(
        Map<String, dynamic> json) =>
    AttendanceResultModel(
      json['current_page'] as int?,
      json['from'] as int?,
      json['to'] as int?,
      json['last_page'] as int?,
      json['total'] as int?,
      json['per_page'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GoshthiAttendanceDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceResultModelToJson(
        AttendanceResultModel instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'from': instance.from,
      'to': instance.to,
      'last_page': instance.last_page,
      'total': instance.total,
      'per_page': instance.per_page,
      'data': instance.data,
    };

GoshthiAttendanceDataModel _$GoshthiAttendanceDataModelFromJson(
        Map<String, dynamic> json) =>
    GoshthiAttendanceDataModel(
      json['id'] as String,
      json['FirstName'] as String?,
      json['MiddleName'] as String?,
      json['LastName'] as String?,
      json['email'] as String?,
      json['Gender'] as String?,
      json['region_id'] as String?,
      json['State'] as String?,
      json['center_id'] as String?,
      json['RegionName'] as String?,
      json['CenterName'] as String?,
      json['state_name'] as String?,
      json['Primarysevawing'] as String?,
      json['Primaryseva'] as String?,
      json['Secondarysevawing'] as String?,
      json['Secondaryseva'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$GoshthiAttendanceDataModelToJson(
        GoshthiAttendanceDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'FirstName': instance.FirstName,
      'MiddleName': instance.MiddleName,
      'LastName': instance.LastName,
      'email': instance.email,
      'Gender': instance.Gender,
      'region_id': instance.region_id,
      'State': instance.State,
      'center_id': instance.center_id,
      'RegionName': instance.RegionName,
      'CenterName': instance.CenterName,
      'state_name': instance.state_name,
      'Primarysevawing': instance.Primarysevawing,
      'Primaryseva': instance.Primaryseva,
      'Secondarysevawing': instance.Secondarysevawing,
      'Secondaryseva': instance.Secondaryseva,
      'status': instance.status,
    };
