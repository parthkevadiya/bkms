// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_wise_sub_group_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupWiseSubGroupRequestModel _$UserGroupWiseSubGroupRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserGroupWiseSubGroupRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['center_id'] as String,
      json['personal_wing_name'] as String,
      json['group_name'] as String,
    );

Map<String, dynamic> _$UserGroupWiseSubGroupRequestModelToJson(
        UserGroupWiseSubGroupRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'center_id': instance.center_id,
      'personal_wing_name': instance.personal_wing_name,
      'group_name': instance.group_name,
    };
