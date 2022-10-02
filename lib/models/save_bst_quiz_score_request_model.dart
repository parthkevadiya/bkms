import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_bst_quiz_score_request_model.g.dart';

@JsonSerializable()
class SaveBSTQuizScoreRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String bst_fallspring_report_id;
  final String user_id;
  final String user_group_name;
  final String user_wing_name;
  final String user_school_year_name;
  final String quiz_1_score;
  final String quiz_2_score;
  final String quiz_3_score;
  final String quiz_4_score;
  final String quiz_5_score;
  final String quiz_6_score;
  final String final_quiz_score;

  SaveBSTQuizScoreRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.bst_fallspring_report_id,
      this.user_id,
      this.user_group_name,
      this.user_wing_name,
      this.user_school_year_name,
      this.quiz_1_score,
      this.quiz_2_score,
      this.quiz_3_score,
      this.quiz_4_score,
      this.quiz_5_score,
      this.quiz_6_score,
      this.final_quiz_score);

  factory SaveBSTQuizScoreRequestModel.fromJson(Map<String, dynamic> json) => _$SaveBSTQuizScoreRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveBSTQuizScoreRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}