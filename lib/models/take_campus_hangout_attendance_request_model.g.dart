// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'take_campus_hangout_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TakeCampusHangoutAttendanceRequestModel
    _$TakeCampusHangoutAttendanceRequestModelFromJson(
            Map<String, dynamic> json) =>
        TakeCampusHangoutAttendanceRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['sabha_id'] as String,
          json['user_id'] as String,
          json['status'] as String,
          json['user_group_name'] as String,
          json['user_wing_name'] as String,
          json['user_school_year_name'] as String,
          json['campus_hangout_date'] as String,
          json['wing_id'] as String,
        );

Map<String, dynamic> _$TakeCampusHangoutAttendanceRequestModelToJson(
        TakeCampusHangoutAttendanceRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'sabha_id': instance.sabha_id,
      'user_id': instance.user_id,
      'status': instance.status,
      'user_group_name': instance.user_group_name,
      'user_wing_name': instance.user_wing_name,
      'user_school_year_name': instance.user_school_year_name,
      'campus_hangout_date': instance.campus_hangout_date,
      'wing_id': instance.wing_id,
    };
