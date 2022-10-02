import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interaction_wise_questions_request_model.g.dart';

@JsonSerializable()
class InteractionsWiseQuestionsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String center_id;
  final String interaction_type;

  InteractionsWiseQuestionsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.center_id,
      this.interaction_type,
      );

  factory InteractionsWiseQuestionsRequestModel.fromJson(Map<String, dynamic> json) => _$InteractionsWiseQuestionsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionsWiseQuestionsRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}