// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_mentoring_interaction_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationMentoringInteractionDetailsModel
    _$EducationMentoringInteractionDetailsModelFromJson(
            Map<String, dynamic> json) =>
        EducationMentoringInteractionDetailsModel(
          json['has_error'] as bool?,
          (json['form_fields'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : EMIDFormAFieldsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$EducationMentoringInteractionDetailsModelToJson(
        EducationMentoringInteractionDetailsModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'form_fields': instance.form_fields,
    };

EMIDFormAFieldsModel _$EMIDFormAFieldsModelFromJson(
        Map<String, dynamic> json) =>
    EMIDFormAFieldsModel(
      json['label'] as String?,
      json['sub_label'] as String?,
      (json['fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EMIDIFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EMIDFormAFieldsModelToJson(
        EMIDFormAFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'sub_label': instance.sub_label,
      'fields': instance.fields,
    };

EMIDIFieldsModel _$EMIDIFieldsModelFromJson(Map<String, dynamic> json) =>
    EMIDIFieldsModel(
      json['label'] as String?,
      json['type'] as String?,
      json['name'] as String?,
      json['placeholder'] as String?,
      json['validation_message'] as String?,
      json['value'] as String?,
      json['help_text'] as String?,
      (json['selected'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EMIDOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['is_required'] as bool?,
      json['is_readonly'] as bool?,
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EMIDOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EMIDIFieldsModelToJson(EMIDIFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'type': instance.type,
      'name': instance.name,
      'placeholder': instance.placeholder,
      'validation_message': instance.validation_message,
      'value': instance.value,
      'help_text': instance.help_text,
      'is_required': instance.is_required,
      'is_readonly': instance.is_readonly,
      'options': instance.options,
      'selected': instance.selected,
    };

EMIDOptions _$EMIDOptionsFromJson(Map<String, dynamic> json) => EMIDOptions(
      json['id'],
      json['value'] as String?,
      json['header'],
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$EMIDOptionsToJson(EMIDOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'header': instance.header,
      'isSelected': instance.isSelected,
    };
