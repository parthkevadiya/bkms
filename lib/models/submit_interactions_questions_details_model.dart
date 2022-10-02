import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_interactions_questions_details_model.g.dart';

@JsonSerializable()
class SubmitInteractionsQuestionsDetailsModel /*extends Equatable*/ {
  final bool? has_error;

  SubmitInteractionsQuestionsDetailsModel(this.has_error);

  factory SubmitInteractionsQuestionsDetailsModel.fromJson(Map<String, dynamic> json) => _$SubmitInteractionsQuestionsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitInteractionsQuestionsDetailsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}