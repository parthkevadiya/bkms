import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stripe_info_request_model.g.dart';

@JsonSerializable()
class StripeInfoRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String bkms_id;
  final String event_id;

  StripeInfoRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.bkms_id,
    this.event_id,
  );

  factory StripeInfoRequestModel.fromJson(Map<String, dynamic> json) => _$StripeInfoRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$StripeInfoRequestModelToJson(this);

/*@override
  List<Object> get props => [bkms_id];*/
}