// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_hangout_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusHangoutReportDetailsRequestModel
    _$CampusHangoutReportDetailsRequestModelFromJson(
            Map<String, dynamic> json) =>
        CampusHangoutReportDetailsRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['campus_report_id'] as String,
          json['campus_hangout_report_id'] as String,
          json['user_id'] as String,
          json['first_name'] as String,
          json['middle_name'] as String,
          json['last_name'] as String,
          json['schoolyear'] as String,
        );

Map<String, dynamic> _$CampusHangoutReportDetailsRequestModelToJson(
        CampusHangoutReportDetailsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'campus_report_id': instance.campus_report_id,
      'campus_hangout_report_id': instance.campus_hangout_report_id,
      'user_id': instance.user_id,
      'first_name': instance.first_name,
      'middle_name': instance.middle_name,
      'last_name': instance.last_name,
      'schoolyear': instance.schoolyear,
    };
