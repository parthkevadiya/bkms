// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_hangout_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusHangoutRequestModel _$CampusHangoutRequestModelFromJson(
        Map<String, dynamic> json) =>
    CampusHangoutRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['selected_wing'] as String,
      json['selected_campus'] as String,
      json['selected_region'] as String,
      json['sabha_year'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$CampusHangoutRequestModelToJson(
        CampusHangoutRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'selected_wing': instance.selected_wing,
      'selected_campus': instance.selected_campus,
      'selected_region': instance.selected_region,
      'sabha_year': instance.sabha_year,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
