// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kst_education_mentoring_list_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KSTEducationMentoringListRequestModel
    _$KSTEducationMentoringListRequestModelFromJson(
            Map<String, dynamic> json) =>
        KSTEducationMentoringListRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['kst_manage_report_id'] as String,
          json['search_record'] as String,
          json['page'] as int,
          json['limit'] as int,
        );

Map<String, dynamic> _$KSTEducationMentoringListRequestModelToJson(
        KSTEducationMentoringListRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'kst_manage_report_id': instance.kst_manage_report_id,
      'search_record': instance.search_record,
      'page': instance.page,
      'limit': instance.limit,
    };
