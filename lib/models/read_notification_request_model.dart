import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'read_notification_request_model.g.dart';

@JsonSerializable()
class ReadNotificationRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String notification_id;

  ReadNotificationRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.notification_id,
  );

  factory ReadNotificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReadNotificationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReadNotificationRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
