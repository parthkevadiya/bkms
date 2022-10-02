import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basic_registration_form_request_model.g.dart';

@JsonSerializable()
class BasicRegistrationFormRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;
  final String record_id;
  final String event_id;
  final bool is_view_mode;

  BasicRegistrationFormRequestModel(
      this.login_user_type,
      this.login_parent_type,
    this.bkms_id,
    this.record_id,
    this.event_id,
    this.is_view_mode,
  );

  factory BasicRegistrationFormRequestModel.fromJson(Map<String, dynamic> json) => _$BasicRegistrationFormRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasicRegistrationFormRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}