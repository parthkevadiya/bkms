// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_wise_questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionWiseQuestionsModel _$InteractionWiseQuestionsModelFromJson(
        Map<String, dynamic> json) =>
    InteractionWiseQuestionsModel(
      json['has_error'] as bool?,
      json['network_question'] == null
          ? null
          : IWNetworkQuestionModel.fromJson(
              json['network_question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InteractionWiseQuestionsModelToJson(
        InteractionWiseQuestionsModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'network_question': instance.network_question,
    };

IWNetworkQuestionModel _$IWNetworkQuestionModelFromJson(
        Map<String, dynamic> json) =>
    IWNetworkQuestionModel(
      (json['form_fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : IWFormFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IWNetworkQuestionModelToJson(
        IWNetworkQuestionModel instance) =>
    <String, dynamic>{
      'form_fields': instance.form_fields,
    };

IWFormFieldsModel _$IWFormFieldsModelFromJson(Map<String, dynamic> json) =>
    IWFormFieldsModel(
      json['label'] as String?,
      (json['fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : IWFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IWFormFieldsModelToJson(IWFormFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'fields': instance.fields,
    };

IWFieldsModel _$IWFieldsModelFromJson(Map<String, dynamic> json) =>
    IWFieldsModel(
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
              : IWOptionsItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IWFieldsModelToJson(IWFieldsModel instance) =>
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

IWOptionsItems _$IWOptionsItemsFromJson(Map<String, dynamic> json) =>
    IWOptionsItems(
      json['id'],
      json['value'] as String?,
      json['header'],
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$IWOptionsItemsToJson(IWOptionsItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'header': instance.header,
      'isSelected': instance.isSelected,
    };
