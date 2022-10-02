// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networking_report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkingReportRequestModel _$NetworkingReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    NetworkingReportRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['selected_region'] as String,
      json['selected_center'] as String,
      json['reporting_year'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$NetworkingReportRequestModelToJson(
        NetworkingReportRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'selected_region': instance.selected_region,
      'selected_center': instance.selected_center,
      'reporting_year': instance.reporting_year,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
