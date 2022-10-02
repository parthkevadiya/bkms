// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networking_interaction_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkingInteractionDetailsRequestModel
    _$NetworkingInteractionDetailsRequestModelFromJson(
            Map<String, dynamic> json) =>
        NetworkingInteractionDetailsRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['interect_center_record_id'] as String,
          json['interect_user_id'] as String,
          json['interaction_id'] as String,
        );

Map<String, dynamic> _$NetworkingInteractionDetailsRequestModelToJson(
        NetworkingInteractionDetailsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'interect_center_record_id': instance.interect_center_record_id,
      'interect_user_id': instance.interect_user_id,
      'interaction_id': instance.interaction_id,
    };
