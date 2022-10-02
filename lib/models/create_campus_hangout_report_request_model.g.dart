// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_campus_hangout_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCampusHangoutReportRequestModel
    _$CreateCampusHangoutReportRequestModelFromJson(
            Map<String, dynamic> json) =>
        CreateCampusHangoutReportRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['report_region'] as String,
          json['report_campus'] as String,
          json['report_wing'] as String,
        );

Map<String, dynamic> _$CreateCampusHangoutReportRequestModelToJson(
        CreateCampusHangoutReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'report_region': instance.report_region,
      'report_campus': instance.report_campus,
      'report_wing': instance.report_wing,
    };
