// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'k1On1_mentoring_interaction_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

K1On1MentoringInteractionDetailsModel
    _$K1On1MentoringInteractionDetailsModelFromJson(
            Map<String, dynamic> json) =>
        K1On1MentoringInteractionDetailsModel(
          json['has_error'] as bool?,
          (json['form_fields'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : K1On1MIDFormAFieldsModel.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$K1On1MentoringInteractionDetailsModelToJson(
        K1On1MentoringInteractionDetailsModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'form_fields': instance.form_fields,
    };

K1On1MIDFormAFieldsModel _$K1On1MIDFormAFieldsModelFromJson(
        Map<String, dynamic> json) =>
    K1On1MIDFormAFieldsModel(
      json['label'] as String?,
      json['sub_label'] as String?,
      (json['fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : K1On1MIDIFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$K1On1MIDFormAFieldsModelToJson(
        K1On1MIDFormAFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'sub_label': instance.sub_label,
      'fields': instance.fields,
    };

K1On1MIDIFieldsModel _$K1On1MIDIFieldsModelFromJson(
        Map<String, dynamic> json) =>
    K1On1MIDIFieldsModel(
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
              : K1On1MIDOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['is_required'] as bool?,
      json['is_readonly'] as bool?,
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : K1On1MIDOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$K1On1MIDIFieldsModelToJson(
        K1On1MIDIFieldsModel instance) =>
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

K1On1MIDOptions _$K1On1MIDOptionsFromJson(Map<String, dynamic> json) =>
    K1On1MIDOptions(
      json['id'],
      json['value'] as String?,
      json['header'],
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$K1On1MIDOptionsToJson(K1On1MIDOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'header': instance.header,
      'isSelected': instance.isSelected,
    };
