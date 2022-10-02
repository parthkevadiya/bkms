// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRequestModel _$HomeRequestModelFromJson(Map<String, dynamic> json) =>
    HomeRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['role'] as String,
    );

Map<String, dynamic> _$HomeRequestModelToJson(HomeRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'role': instance.role,
    };
