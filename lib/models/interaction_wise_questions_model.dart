import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interaction_wise_questions_model.g.dart';

@JsonSerializable()
class InteractionWiseQuestionsModel /*extends Equatable*/ {
  final bool? has_error;
  final IWNetworkQuestionModel? network_question;

  InteractionWiseQuestionsModel(this.has_error, this.network_question);

  factory InteractionWiseQuestionsModel.fromJson(Map<String, dynamic> json) => _$InteractionWiseQuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionWiseQuestionsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class IWNetworkQuestionModel /*extends Equatable*/ {
  final List<IWFormFieldsModel?>? form_fields;

  IWNetworkQuestionModel(this.form_fields);

  factory IWNetworkQuestionModel.fromJson(Map<String, dynamic> json) => _$IWNetworkQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$IWNetworkQuestionModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class IWFormFieldsModel /*extends Equatable*/ {
  final String? label;
  final List<IWFieldsModel?>? fields;

  IWFormFieldsModel(this.label, this.fields);

  factory IWFormFieldsModel.fromJson(Map<String, dynamic> json) => _$IWFormFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$IWFormFieldsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class IWFieldsModel /*extends Equatable*/ {
  final String? label;
  final String? type;
  final String? name;
  final String? placeholder;
  final String? validation_message;
  String? value;
  String? help_text;
  String? selected;
  final bool? is_required;
  final bool? is_readonly;
  final List<IWOptionsItems?>? options;

  IWFieldsModel(
      this.label,
      this.type,
      this.name,
      this.placeholder,
      this.validation_message,
      this.value,
      this.help_text,
      this.selected,
      this.is_required,
      this.is_readonly,
      this.options);

  factory IWFieldsModel.fromJson(Map<String, dynamic> json) => _$IWFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$IWFieldsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class IWOptionsItems /*extends Equatable*/ {
  final dynamic id;
  final String? value;
  final dynamic header;
  bool? isSelected = false;

  IWOptionsItems(
      this.id, this.value, this.header
      );

  factory IWOptionsItems.fromJson(Map<String, dynamic> json) => _$IWOptionsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$IWOptionsItemsToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}