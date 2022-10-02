import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sabha_report_questions_request_model.g.dart';

@JsonSerializable()
class SabhaReportQuestionsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String sabha_id;

  SabhaReportQuestionsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.sabha_id,);

  factory SabhaReportQuestionsRequestModel.fromJson(Map<String, dynamic> json) => _$SabhaReportQuestionsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SabhaReportQuestionsRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}