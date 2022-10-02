import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sabha_report_questions_model.g.dart';

@JsonSerializable()
class SabhaReportQuestionsModel /*extends Equatable*/ {
  final bool? has_error;
  final List<SabhaQuestionsModel?>? sabha_questions;
  final String? sabha_update_time;

  SabhaReportQuestionsModel(this.has_error, this.sabha_questions, this.sabha_update_time);

  factory SabhaReportQuestionsModel.fromJson(Map<String, dynamic> json) => _$SabhaReportQuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SabhaReportQuestionsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class SabhaQuestionsModel {
  final String? label;
  final int? is_hidden;
  final List<QuestionFieldsModel?>? fields;

  SabhaQuestionsModel(this.label, this.is_hidden, this.fields);

  factory SabhaQuestionsModel.fromJson(Map<String, dynamic> json) => _$SabhaQuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SabhaQuestionsModelToJson(this);
}

@JsonSerializable()
class QuestionFieldsModel {
  final String? label;
  final String? type;
  final String? name;
  String? value;
  String? selected;
  final String? validation_message;
  final bool? is_required;
  final List<QuestionOptionsModel?>? options;

  QuestionFieldsModel(this.label, this.type, this.name, this.value, this.selected, this.validation_message,
      this.is_required, this.options);

  factory QuestionFieldsModel.fromJson(Map<String, dynamic> json) => _$QuestionFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionFieldsModelToJson(this);
}

@JsonSerializable()
class QuestionOptionsModel {
  final String? id;
  final String? value;

  QuestionOptionsModel(this.id, this.value);

  factory QuestionOptionsModel.fromJson(Map<String, dynamic> json) => _$QuestionOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionOptionsModelToJson(this);
}
