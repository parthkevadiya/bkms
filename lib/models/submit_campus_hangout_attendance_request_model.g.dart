// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_campus_hangout_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitCampusHangoutAttendanceRequestModel
    _$SubmitCampusHangoutAttendanceRequestModelFromJson(
            Map<String, dynamic> json) =>
        SubmitCampusHangoutAttendanceRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['campus_hangout_date'] as String,
          json['wing_id'] as String,
          json['campus_id'] as String,
          json['region_id'] as String,
          json['edit_mode'] as String,
          json['schoolyear'] as String,
          json['first_name'] as String,
          json['middle_name'] as String,
          json['last_name'] as String,
          json['user_id'] as String,
        );

Map<String, dynamic> _$SubmitCampusHangoutAttendanceRequestModelToJson(
        SubmitCampusHangoutAttendanceRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'campus_hangout_date': instance.campus_hangout_date,
      'wing_id': instance.wing_id,
      'campus_id': instance.campus_id,
      'region_id': instance.region_id,
      'edit_mode': instance.edit_mode,
      'schoolyear': instance.schoolyear,
      'first_name': instance.first_name,
      'middle_name': instance.middle_name,
      'last_name': instance.last_name,
      'user_id': instance.user_id,
    };
