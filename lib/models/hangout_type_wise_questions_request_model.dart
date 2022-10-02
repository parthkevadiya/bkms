import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hangout_type_wise_questions_request_model.g.dart';

@JsonSerializable()
class HangoutTypeWiseQuestionsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String hangout_type;

  HangoutTypeWiseQuestionsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.hangout_type,
      );

  factory HangoutTypeWiseQuestionsRequestModel.fromJson(Map<String, dynamic> json) => _$HangoutTypeWiseQuestionsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$HangoutTypeWiseQuestionsRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}