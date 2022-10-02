// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_campus_hangout_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitCampusHangoutAttendanceModel _$SubmitCampusHangoutAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    SubmitCampusHangoutAttendanceModel(
      json['has_error'] as bool?,
      json['campus_sabha_id'] as String?,
      (json['school_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SCHSchoolListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['attendance_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SCHAttendanceListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmitCampusHangoutAttendanceModelToJson(
        SubmitCampusHangoutAttendanceModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'campus_sabha_id': instance.campus_sabha_id,
      'school_list': instance.school_list,
      'attendance_list': instance.attendance_list,
    };

SCHSchoolListModel _$SCHSchoolListModelFromJson(Map<String, dynamic> json) =>
    SCHSchoolListModel(
      json['id'],
      json['school_display_name'] as String?,
      json['school_value'] as String?,
    );

Map<String, dynamic> _$SCHSchoolListModelToJson(SCHSchoolListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

SCHAttendanceListModel _$SCHAttendanceListModelFromJson(
        Map<String, dynamic> json) =>
    SCHAttendanceListModel(
      json['user_id'] as String?,
      json['FirstName'] as String?,
      json['MiddleName'] as String?,
      json['LastName'] as String?,
      json['email'] as String?,
      json['PrimarySevaWing'] as String?,
      json['personalWing'] as String?,
      json['CenterName'] as String?,
      json['campus_name'] as String?,
      json['RegionName'] as String?,
      json['group_name'] as String?,
      json['grade'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$SCHAttendanceListModelToJson(
        SCHAttendanceListModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'FirstName': instance.FirstName,
      'MiddleName': instance.MiddleName,
      'LastName': instance.LastName,
      'email': instance.email,
      'PrimarySevaWing': instance.PrimarySevaWing,
      'personalWing': instance.personalWing,
      'CenterName': instance.CenterName,
      'campus_name': instance.campus_name,
      'RegionName': instance.RegionName,
      'group_name': instance.group_name,
      'grade': instance.grade,
      'status': instance.status,
    };
