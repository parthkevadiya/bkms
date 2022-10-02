import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_bst_niyam_assesment_score_model.g.dart';

@JsonSerializable()
class UpdateBSTNiyamAssesmentScoreModel /*extends Equatable*/ {
  final bool? has_error;

  UpdateBSTNiyamAssesmentScoreModel(this.has_error);

  factory UpdateBSTNiyamAssesmentScoreModel.fromJson(Map<String, dynamic> json) => _$UpdateBSTNiyamAssesmentScoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBSTNiyamAssesmentScoreModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
