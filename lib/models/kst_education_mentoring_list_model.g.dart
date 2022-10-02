// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kst_education_mentoring_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KSTEducationMentoringListModel _$KSTEducationMentoringListModelFromJson(
        Map<String, dynamic> json) =>
    KSTEducationMentoringListModel(
      json['has_error'] as bool?,
      json['screen_title'] as String?,
      json['result'] == null
          ? null
          : KEMResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KSTEducationMentoringListModelToJson(
        KSTEducationMentoringListModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'screen_title': instance.screen_title,
      'result': instance.result,
    };

KEMResultModel _$KEMResultModelFromJson(Map<String, dynamic> json) =>
    KEMResultModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : KEMDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$KEMResultModelToJson(KEMResultModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

KEMDataModel _$KEMDataModelFromJson(Map<String, dynamic> json) => KEMDataModel(
      json['id'] as String?,
      json['region_id'] as String?,
      json['center_id'] as String?,
      json['kst_center_report_id'] as String?,
      json['kst_fallspring_report_id'] as String?,
      json['kst_report_type'] as String?,
      json['interaction_type'] as String?,
      json['interaction_date'] as String?,
      json['interaction_session'] as String?,
      json['submitted_for_name'] as String?,
      json['reported_by'] as String?,
    );

Map<String, dynamic> _$KEMDataModelToJson(KEMDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region_id': instance.region_id,
      'center_id': instance.center_id,
      'kst_center_report_id': instance.kst_center_report_id,
      'kst_fallspring_report_id': instance.kst_fallspring_report_id,
      'kst_report_type': instance.kst_report_type,
      'interaction_type': instance.interaction_type,
      'interaction_date': instance.interaction_date,
      'interaction_session': instance.interaction_session,
      'submitted_for_name': instance.submitted_for_name,
      'reported_by': instance.reported_by,
    };
