// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_bst_quiz_score_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveBSTQuizScoreRequestModel _$SaveBSTQuizScoreRequestModelFromJson(
        Map<String, dynamic> json) =>
    SaveBSTQuizScoreRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['bst_fallspring_report_id'] as String,
      json['user_id'] as String,
      json['user_group_name'] as String,
      json['user_wing_name'] as String,
      json['user_school_year_name'] as String,
      json['quiz_1_score'] as String,
      json['quiz_2_score'] as String,
      json['quiz_3_score'] as String,
      json['quiz_4_score'] as String,
      json['quiz_5_score'] as String,
      json['quiz_6_score'] as String,
      json['final_quiz_score'] as String,
    );

Map<String, dynamic> _$SaveBSTQuizScoreRequestModelToJson(
        SaveBSTQuizScoreRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'bst_fallspring_report_id': instance.bst_fallspring_report_id,
      'user_id': instance.user_id,
      'user_group_name': instance.user_group_name,
      'user_wing_name': instance.user_wing_name,
      'user_school_year_name': instance.user_school_year_name,
      'quiz_1_score': instance.quiz_1_score,
      'quiz_2_score': instance.quiz_2_score,
      'quiz_3_score': instance.quiz_3_score,
      'quiz_4_score': instance.quiz_4_score,
      'quiz_5_score': instance.quiz_5_score,
      'quiz_6_score': instance.quiz_6_score,
      'final_quiz_score': instance.final_quiz_score,
    };
