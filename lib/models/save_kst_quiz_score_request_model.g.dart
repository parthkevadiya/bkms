// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_kst_quiz_score_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveKSTQuizScoreRequestModel _$SaveKSTQuizScoreRequestModelFromJson(
        Map<String, dynamic> json) =>
    SaveKSTQuizScoreRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['kst_manage_report_id'] as String,
      json['list_user_id'] as String,
      json['list_user_group_name'] as String,
      json['list_user_wing_name'] as String,
      json['list_user_school_year_name'] as String,
      json['quiz_1'] as String,
      json['quiz_2'] as String,
      json['quiz_3'] as String,
      json['quiz_4'] as String,
      json['quiz_5'] as String,
      json['quiz_6'] as String,
      json['final_quiz_score'] as String,
    );

Map<String, dynamic> _$SaveKSTQuizScoreRequestModelToJson(
        SaveKSTQuizScoreRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'kst_manage_report_id': instance.kst_manage_report_id,
      'list_user_id': instance.list_user_id,
      'list_user_group_name': instance.list_user_group_name,
      'list_user_wing_name': instance.list_user_wing_name,
      'list_user_school_year_name': instance.list_user_school_year_name,
      'quiz_1': instance.quiz_1,
      'quiz_2': instance.quiz_2,
      'quiz_3': instance.quiz_3,
      'quiz_4': instance.quiz_4,
      'quiz_5': instance.quiz_5,
      'quiz_6': instance.quiz_6,
      'final_quiz_score': instance.final_quiz_score,
    };
