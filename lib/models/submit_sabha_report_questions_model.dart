import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_sabha_report_questions_model.g.dart';

@JsonSerializable()
class SubmitSabhaReportQuestionsModel /*extends Equatable*/ {
  final bool? has_error;

  SubmitSabhaReportQuestionsModel(this.has_error);

  factory SubmitSabhaReportQuestionsModel.fromJson(Map<String, dynamic> json) => _$SubmitSabhaReportQuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSabhaReportQuestionsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}