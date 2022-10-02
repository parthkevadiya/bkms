// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bst_niyam_assesment_score_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBSTNiyamAssesmentScoreRequestModel
    _$UpdateBSTNiyamAssesmentScoreRequestModelFromJson(
            Map<String, dynamic> json) =>
        UpdateBSTNiyamAssesmentScoreRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['bst_center_report_id'] as String,
          json['user_id'] as String,
          json['user_group_name'] as String,
          json['user_wing_name'] as String,
          json['user_school_year_name'] as String,
          json['begin_score'] as String,
          json['final_score'] as String,
        );

Map<String, dynamic> _$UpdateBSTNiyamAssesmentScoreRequestModelToJson(
        UpdateBSTNiyamAssesmentScoreRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'bst_center_report_id': instance.bst_center_report_id,
      'user_id': instance.user_id,
      'user_group_name': instance.user_group_name,
      'user_wing_name': instance.user_wing_name,
      'user_school_year_name': instance.user_school_year_name,
      'begin_score': instance.begin_score,
      'final_score': instance.final_score,
    };
