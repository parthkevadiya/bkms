import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'liability_form_request_model.g.dart';

@JsonSerializable()
class LiabilityFormRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String bkms_id;
  final String event_id;
  final String userevent_id;
  final String event_user_type;

  LiabilityFormRequestModel(
      this.login_user_type,
      this.login_parent_type,
    this.bkms_id,
    this.event_id,
    this.userevent_id,
    this.event_user_type,
  );

  factory LiabilityFormRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LiabilityFormRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiabilityFormRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
