import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_liability_form_request_model.g.dart';

@JsonSerializable()
class SubmitLiabilityFormRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String bkms_id;
  final String event_id;
  final String liability_user_type;
  final String signature;
  final String approve_option;
  final String initial_box1;
  final String initial_box2;
  final String initial_box3;
  final String initial_box4;
  final String initial_box5;
  final String initial_box6;
  final String initial_box7;
  final String parents_name;

  SubmitLiabilityFormRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.bkms_id,
      this.event_id,
      this.liability_user_type,
      this.signature,
      this.approve_option,
      this.initial_box1,
      this.initial_box2,
      this.initial_box3,
      this.initial_box4,
      this.initial_box5,
      this.initial_box6,
      this.initial_box7,
      this.parents_name);

  factory SubmitLiabilityFormRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitLiabilityFormRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitLiabilityFormRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
