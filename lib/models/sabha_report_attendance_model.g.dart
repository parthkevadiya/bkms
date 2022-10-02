// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sabha_report_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SabhaReportAttendanceModel _$SabhaReportAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    SabhaReportAttendanceModel(
      json['has_error'] as bool?,
      json['attendance_result'] == null
          ? null
          : AttendanceResultModel.fromJson(
              json['attendance_result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SabhaReportAttendanceModelToJson(
        SabhaReportAttendanceModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'attendance_result': instance.attendance_result,
    };

AttendanceResultModel _$AttendanceResultModelFromJson(
        Map<String, dynamic> json) =>
    AttendanceResultModel(
      json['current_page'] as int?,
      json['from'] as int?,
      json['to'] as int?,
      json['last_page'] as int?,
      json['total'] as int?,
      json['per_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : DataModel.fromJson(e as Map<String, dynamic>))
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

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      json['user_id'] as String,
      json['name'] as String?,
      json['email'] as String?,
      json['personalWing'] as String?,
      json['wing_name'] as String?,
      json['group_name'] as String?,
      json['status'] as String?,
      json['sabha_user_status'] as String?,
      json['user_group_name'] as String?,
      json['school_display_name'] as String?,
      json['user_school_year_name'] as String?,
      json['is_present'] as String?,
      json['row_num'] as String?,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'name': instance.name,
      'email': instance.email,
      'personalWing': instance.personalWing,
      'wing_name': instance.wing_name,
      'group_name': instance.group_name,
      'status': instance.status,
      'sabha_user_status': instance.sabha_user_status,
      'user_group_name': instance.user_group_name,
      'school_display_name': instance.school_display_name,
      'user_school_year_name': instance.user_school_year_name,
      'is_present': instance.is_present,
      'row_num': instance.row_num,
    };
