// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_filters_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectFiltersRequestModel _$CollectFiltersRequestModelFromJson(
        Map<String, dynamic> json) =>
    CollectFiltersRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
    );

Map<String, dynamic> _$CollectFiltersRequestModelToJson(
        CollectFiltersRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
    };
