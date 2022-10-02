import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_kst_quiz_score_request_model.g.dart';

@JsonSerializable()
class SaveKSTQuizScoreRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String kst_manage_report_id;
  final String list_user_id;
  final String list_user_group_name;
  final String list_user_wing_name;
  final String list_user_school_year_name;
  final String quiz_1;
  final String quiz_2;
  final String quiz_3;
  final String quiz_4;
  final String quiz_5;
  final String quiz_6;
  final String final_quiz_score;

  SaveKSTQuizScoreRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.kst_manage_report_id,
      this.list_user_id,
      this.list_user_group_name,
      this.list_user_wing_name,
      this.list_user_school_year_name,
      this.quiz_1,
      this.quiz_2,
      this.quiz_3,
      this.quiz_4,
      this.quiz_5,
      this.quiz_6,
      this.final_quiz_score);

  factory SaveKSTQuizScoreRequestModel.fromJson(Map<String, dynamic> json) => _$SaveKSTQuizScoreRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveKSTQuizScoreRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}