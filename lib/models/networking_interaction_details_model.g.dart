// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networking_interaction_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkingInteractionDetailsModel _$NetworkingInteractionDetailsModelFromJson(
        Map<String, dynamic> json) =>
    NetworkingInteractionDetailsModel(
      json['has_error'] as bool?,
      json['network_question'] == null
          ? null
          : NetworkQuestionModel.fromJson(
              json['network_question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkingInteractionDetailsModelToJson(
        NetworkingInteractionDetailsModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'network_question': instance.network_question,
    };

NetworkQuestionModel _$NetworkQuestionModelFromJson(
        Map<String, dynamic> json) =>
    NetworkQuestionModel(
      (json['form_fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : InteractionsFormAFieldsModel.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkQuestionModelToJson(
        NetworkQuestionModel instance) =>
    <String, dynamic>{
      'form_fields': instance.form_fields,
    };

InteractionsFormAFieldsModel _$InteractionsFormAFieldsModelFromJson(
        Map<String, dynamic> json) =>
    InteractionsFormAFieldsModel(
      json['label'] as String?,
      (json['fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : InteractionsFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InteractionsFormAFieldsModelToJson(
        InteractionsFormAFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'fields': instance.fields,
    };

InteractionsFieldsModel _$InteractionsFieldsModelFromJson(
        Map<String, dynamic> json) =>
    InteractionsFieldsModel(
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
              : InteractionsOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InteractionsFieldsModelToJson(
        InteractionsFieldsModel instance) =>
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

InteractionsOptions _$InteractionsOptionsFromJson(Map<String, dynamic> json) =>
    InteractionsOptions(
      json['id'],
      json['value'] as String?,
      json['header'],
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$InteractionsOptionsToJson(
        InteractionsOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'header': instance.header,
      'isSelected': instance.isSelected,
    };
