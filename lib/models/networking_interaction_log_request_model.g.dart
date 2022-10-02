// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networking_interaction_log_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkingInteractionLogRequestModel
    _$NetworkingInteractionLogRequestModelFromJson(Map<String, dynamic> json) =>
        NetworkingInteractionLogRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['interect_center_record_id'] as String,
          json['interect_user_id'] as String,
          json['page'] as String,
          json['limit'] as String,
        );

Map<String, dynamic> _$NetworkingInteractionLogRequestModelToJson(
        NetworkingInteractionLogRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'interect_center_record_id': instance.interect_center_record_id,
      'interect_user_id': instance.interect_user_id,
      'page': instance.page,
      'limit': instance.limit,
    };
