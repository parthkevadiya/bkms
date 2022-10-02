// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bst_wing_name_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBSTWingNameRequestModel _$GetBSTWingNameRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetBSTWingNameRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['center_id'] as String,
      json['wing_name'] as String,
    );

Map<String, dynamic> _$GetBSTWingNameRequestModelToJson(
        GetBSTWingNameRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'center_id': instance.center_id,
      'wing_name': instance.wing_name,
    };
