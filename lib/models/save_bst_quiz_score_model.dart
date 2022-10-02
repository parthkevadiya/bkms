import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_bst_quiz_score_model.g.dart';

@JsonSerializable()
class SaveBSTQuizScoreModel /*extends Equatable*/ {
  final bool? has_error;

  SaveBSTQuizScoreModel(this.has_error);

  factory SaveBSTQuizScoreModel.fromJson(Map<String, dynamic> json) => _$SaveBSTQuizScoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveBSTQuizScoreModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
