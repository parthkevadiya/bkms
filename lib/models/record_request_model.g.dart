// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordRequestModel _$RecordRequestModelFromJson(Map<String, dynamic> json) =>
    RecordRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['name'] as String,
      json['gender'] as String,
      json['wing'] as String,
      json['school_year'] as String,
      json['center'] as String,
      json['region'] as String,
      json['user_group'] as String,
      json['fname'] as String,
      json['mname'] as String,
      json['lname'] as String,
      json['user_id'] as String,
      json['email'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['is_export'] as bool,
    );

Map<String, dynamic> _$RecordRequestModelToJson(RecordRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'name': instance.name,
      'gender': instance.gender,
      'wing': instance.wing,
      'school_year': instance.school_year,
      'center': instance.center,
      'region': instance.region,
      'user_group': instance.user_group,
      'fname': instance.fname,
      'mname': instance.mname,
      'lname': instance.lname,
      'user_id': instance.user_id,
      'email': instance.email,
      'page': instance.page,
      'limit': instance.limit,
      'is_export': instance.is_export,
    };
