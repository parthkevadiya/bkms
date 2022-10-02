// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kst_1on1_mentoring_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KST1On1MentoringListModel _$KST1On1MentoringListModelFromJson(
        Map<String, dynamic> json) =>
    KST1On1MentoringListModel(
      json['has_error'] as bool?,
      json['result'] == null
          ? null
          : K1On1MResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KST1On1MentoringListModelToJson(
        KST1On1MentoringListModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'result': instance.result,
    };

K1On1MResultModel _$K1On1MResultModelFromJson(Map<String, dynamic> json) =>
    K1On1MResultModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : K1On1MDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$K1On1MResultModelToJson(K1On1MResultModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

K1On1MDataModel _$K1On1MDataModelFromJson(Map<String, dynamic> json) =>
    K1On1MDataModel(
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

Map<String, dynamic> _$K1On1MDataModelToJson(K1On1MDataModel instance) =>
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
