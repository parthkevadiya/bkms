// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_wise_campus_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionWiseCampusRequestModel _$RegionWiseCampusRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegionWiseCampusRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['region_id'] as String,
    );

Map<String, dynamic> _$RegionWiseCampusRequestModelToJson(
        RegionWiseCampusRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'region_id': instance.region_id,
    };
