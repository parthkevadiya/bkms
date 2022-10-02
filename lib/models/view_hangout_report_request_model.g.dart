// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_hangout_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewHangoutReportRequestModel _$ViewHangoutReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    ViewHangoutReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['campus_report_id'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$ViewHangoutReportRequestModelToJson(
        ViewHangoutReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'campus_report_id': instance.campus_report_id,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
