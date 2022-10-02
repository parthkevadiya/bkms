import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_interaction_details_request_model.g.dart';

@JsonSerializable()
class CreateInteractionDetailsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;

  CreateInteractionDetailsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,);

  factory CreateInteractionDetailsRequestModel.fromJson(Map<String, dynamic> json) => _$CreateInteractionDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInteractionDetailsRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}