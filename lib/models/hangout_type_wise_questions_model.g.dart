// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hangout_type_wise_questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HangoutTypeWiseQuestionsModel _$HangoutTypeWiseQuestionsModelFromJson(
        Map<String, dynamic> json) =>
    HangoutTypeWiseQuestionsModel(
      json['has_error'] as bool?,
      (json['form_fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HTWFormFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HangoutTypeWiseQuestionsModelToJson(
        HangoutTypeWiseQuestionsModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'form_fields': instance.form_fields,
    };

HTWFormFieldsModel _$HTWFormFieldsModelFromJson(Map<String, dynamic> json) =>
    HTWFormFieldsModel(
      json['label'] as String?,
      (json['fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HTWFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HTWFormFieldsModelToJson(HTWFormFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'fields': instance.fields,
    };

HTWFieldsModel _$HTWFieldsModelFromJson(Map<String, dynamic> json) =>
    HTWFieldsModel(
      json['label'] as String?,
      json['type'] as String?,
      json['name'] as String?,
      json['placeholder'] as String?,
      json['validation_message'] as String?,
      json['value'] as String?,
      json['help_text'] as String?,
      json['selected'] as String?,
      json['is_required'] as bool?,
      json['is_readonly'] as bool?,
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HTWOptionsItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HTWFieldsModelToJson(HTWFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'type': instance.type,
      'name': instance.name,
      'placeholder': instance.placeholder,
      'validation_message': instance.validation_message,
      'value': instance.value,
      'help_text': instance.help_text,
      'selected': instance.selected,
      'is_required': instance.is_required,
      'is_readonly': instance.is_readonly,
      'options': instance.options,
    };

HTWOptionsItems _$HTWOptionsItemsFromJson(Map<String, dynamic> json) =>
    HTWOptionsItems(
      json['id'],
      json['value'] as String?,
      json['header'],
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$HTWOptionsItemsToJson(HTWOptionsItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'header': instance.header,
      'isSelected': instance.isSelected,
    };
