// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_bst_quiz_score_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageBSTQuizScoreRequestModel _$ManageBSTQuizScoreRequestModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTQuizScoreRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      json['bkms_id'] as String,
      json['bst_fall_spring_report_data_id'] as String,
      json['edit_mode'] as String,
      json['selected_wing'] as String,
      json['selected_region'] as String,
      json['search_user_id'] as String,
      json['group'] as String,
      json['subgroup'] as String,
      json['schoolyear'] as String,
      json['first_name'] as String,
      json['middle_name'] as String,
      json['last_name'] as String,
      json['page'] as int,
      json['limit'] as int,
      json['generic_search'] as String,
    );

Map<String, dynamic> _$ManageBSTQuizScoreRequestModelToJson(
        ManageBSTQuizScoreRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'bst_fall_spring_report_data_id': instance.bst_fall_spring_report_data_id,
      'edit_mode': instance.edit_mode,
      'selected_wing': instance.selected_wing,
      'selected_region': instance.selected_region,
      'search_user_id': instance.search_user_id,
      'group': instance.group,
      'subgroup': instance.subgroup,
      'schoolyear': instance.schoolyear,
      'first_name': instance.first_name,
      'middle_name': instance.middle_name,
      'last_name': instance.last_name,
      'page': instance.page,
      'limit': instance.limit,
      'generic_search': instance.generic_search,
    };
