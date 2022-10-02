// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sabha_report_questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SabhaReportQuestionsModel _$SabhaReportQuestionsModelFromJson(
        Map<String, dynamic> json) =>
    SabhaReportQuestionsModel(
      json['has_error'] as bool?,
      (json['sabha_questions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SabhaQuestionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['sabha_update_time'] as String?,
    );

Map<String, dynamic> _$SabhaReportQuestionsModelToJson(
        SabhaReportQuestionsModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'sabha_questions': instance.sabha_questions,
      'sabha_update_time': instance.sabha_update_time,
    };

SabhaQuestionsModel _$SabhaQuestionsModelFromJson(Map<String, dynamic> json) =>
    SabhaQuestionsModel(
      json['label'] as String?,
      json['is_hidden'] as int?,
      (json['fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : QuestionFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SabhaQuestionsModelToJson(
        SabhaQuestionsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'is_hidden': instance.is_hidden,
      'fields': instance.fields,
    };

QuestionFieldsModel _$QuestionFieldsModelFromJson(Map<String, dynamic> json) =>
    QuestionFieldsModel(
      json['label'] as String?,
      json['type'] as String?,
      json['name'] as String?,
      json['value'] as String?,
      json['selected'] as String?,
      json['validation_message'] as String?,
      json['is_required'] as bool?,
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : QuestionOptionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionFieldsModelToJson(
        QuestionFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'type': instance.type,
      'name': instance.name,
      'value': instance.value,
      'selected': instance.selected,
      'validation_message': instance.validation_message,
      'is_required': instance.is_required,
      'options': instance.options,
    };

QuestionOptionsModel _$QuestionOptionsModelFromJson(
        Map<String, dynamic> json) =>
    QuestionOptionsModel(
      json['id'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$QuestionOptionsModelToJson(
        QuestionOptionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
