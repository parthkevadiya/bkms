import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_register_details_request_model.g.dart';

@JsonSerializable()
class EventRegisterDetailsRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;
  final String event_id;
  final String record_id;

  EventRegisterDetailsRequestModel(
      this.login_user_type,
      this.login_parent_type,
    this.bkms_id,
    this.event_id,
    this.record_id,
  );

  factory EventRegisterDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EventRegisterDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventRegisterDetailsRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
