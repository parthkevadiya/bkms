import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_in_request_model.g.dart';

@JsonSerializable()
class CheckInRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String bkms_id;
  final String event_id;
  final String userevent_id;
  final String qr_code_result;

  CheckInRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.bkms_id,
    this.event_id,
    this.userevent_id,
    this.qr_code_result,
  );

  factory CheckInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
