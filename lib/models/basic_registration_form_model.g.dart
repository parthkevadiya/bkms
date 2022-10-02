// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_registration_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicRegistrationsFormModel _$BasicRegistrationsFormModelFromJson(
        Map<String, dynamic> json) =>
    BasicRegistrationsFormModel(
      json['form_type'] as String?,
      EventForm.fromJson(json['event_form'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BasicRegistrationsFormModelToJson(
        BasicRegistrationsFormModel instance) =>
    <String, dynamic>{
      'form_type': instance.form_type,
      'event_form': instance.event_form,
    };

EventForm _$EventFormFromJson(Map<String, dynamic> json) => EventForm(
      (json['form_fields'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FormFields.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventFormToJson(EventForm instance) => <String, dynamic>{
      'form_fields': instance.form_fields,
    };

FormFields _$FormFieldsFromJson(Map<String, dynamic> json) => FormFields(
      (json['fields'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Fields.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['label'] as String,
    );

Map<String, dynamic> _$FormFieldsToJson(FormFields instance) =>
    <String, dynamic>{
      'fields': instance.fields,
      'label': instance.label,
    };

Fields _$FieldsFromJson(Map<String, dynamic> json) => Fields(
      json['label'] as String,
      json['type'] as String,
      json['name'] as String,
      json['placeholder'] as String,
      json['validation_message'] as String?,
      json['value'] as String?,
      json['help_text'] as String?,
      json['is_required'] as bool,
      json['is_readonly'] as bool,
      (json['selected'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Options.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['options'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Options.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'label': instance.label,
      'type': instance.type,
      'name': instance.name,
      'placeholder': instance.placeholder,
      'validation_message': instance.validation_message,
      'value': instance.value,
      'help_text': instance.help_text,
      'is_required': instance.is_required,
      'is_readonly': instance.is_readonly,
      'selected': instance.selected,
      'options': instance.options,
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      json['id'] as String,
      json['value'] as String?,
      json['header'] as String?,
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'header': instance.header,
      'isSelected': instance.isSelected,
    };

Selected _$SelectedFromJson(Map<String, dynamic> json) => Selected(
      json['id'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$SelectedToJson(Selected instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
