import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_kst_quiz_score_model.g.dart';

@JsonSerializable()
class SaveKSTQuizScoreModel /*extends Equatable*/ {
  final bool? has_error;

  SaveKSTQuizScoreModel(this.has_error);

  factory SaveKSTQuizScoreModel.fromJson(Map<String, dynamic> json) => _$SaveKSTQuizScoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveKSTQuizScoreModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}