import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hangout_type_wise_questions_model.g.dart';

@JsonSerializable()
class HangoutTypeWiseQuestionsModel /*extends Equatable*/ {
  final bool? has_error;
  final List<HTWFormFieldsModel?>? form_fields;

  HangoutTypeWiseQuestionsModel(this.has_error, this.form_fields);

  factory HangoutTypeWiseQuestionsModel.fromJson(Map<String, dynamic> json) => _$HangoutTypeWiseQuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HangoutTypeWiseQuestionsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class HTWFormFieldsModel /*extends Equatable*/ {
  final String? label;
  final List<HTWFieldsModel?>? fields;

  HTWFormFieldsModel(this.label, this.fields);

  factory HTWFormFieldsModel.fromJson(Map<String, dynamic> json) => _$HTWFormFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HTWFormFieldsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class HTWFieldsModel /*extends Equatable*/ {
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
  final List<HTWOptionsItems?>? options;

  HTWFieldsModel(
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

  factory HTWFieldsModel.fromJson(Map<String, dynamic> json) => _$HTWFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HTWFieldsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class HTWOptionsItems /*extends Equatable*/ {
  final dynamic id;
  final String? value;
  final dynamic header;
  bool? isSelected = false;

  HTWOptionsItems(
      this.id, this.value, this.header
      );

  factory HTWOptionsItems.fromJson(Map<String, dynamic> json) => _$HTWOptionsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$HTWOptionsItemsToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}