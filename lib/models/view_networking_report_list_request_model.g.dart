// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_networking_report_list_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewNetworkingReportListRequestModel
    _$ViewNetworkingReportListRequestModelFromJson(Map<String, dynamic> json) =>
        ViewNetworkingReportListRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['reporting_record_id'] as String,
          json['page'] as String,
          json['limit'] as String,
        );

Map<String, dynamic> _$ViewNetworkingReportListRequestModelToJson(
        ViewNetworkingReportListRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'reporting_record_id': instance.reporting_record_id,
      'page': instance.page,
      'limit': instance.limit,
    };
