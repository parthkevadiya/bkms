// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_wise_hangout_types_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusWiseHangoutTypesRequestModel _$CampusWiseHangoutTypesRequestModelFromJson(
        Map<String, dynamic> json) =>
    CampusWiseHangoutTypesRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['campus_id'] as String,
    );

Map<String, dynamic> _$CampusWiseHangoutTypesRequestModelToJson(
        CampusWiseHangoutTypesRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'campus_id': instance.campus_id,
    };
