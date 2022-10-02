// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'k1On1_mentoring_interaction_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

K1On1MentoringInteractionDetailsRequestModel
    _$K1On1MentoringInteractionDetailsRequestModelFromJson(
            Map<String, dynamic> json) =>
        K1On1MentoringInteractionDetailsRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['kst_manage_report_id'] as String,
          json['is_view_mode'] as String,
          json['kst_1on1_mentoring_id'] as String,
        );

Map<String, dynamic> _$K1On1MentoringInteractionDetailsRequestModelToJson(
        K1On1MentoringInteractionDetailsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'kst_manage_report_id': instance.kst_manage_report_id,
      'is_view_mode': instance.is_view_mode,
      'kst_1on1_mentoring_id': instance.kst_1on1_mentoring_id,
    };
