import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_wont_be_attend_request_model.g.dart';

@JsonSerializable()
class EventWontBeAttendRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;
  final String event_id;

  EventWontBeAttendRequestModel(
      this.login_user_type,
      this.login_parent_type,
    this.bkms_id,
    this.event_id,
  );

  factory EventWontBeAttendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EventWontBeAttendRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventWontBeAttendRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
