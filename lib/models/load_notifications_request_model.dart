import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'load_notifications_request_model.g.dart';

@JsonSerializable()
class LoadNotificationsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;

  LoadNotificationsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
  );

  factory LoadNotificationsRequestModel.fromJson(Map<String, dynamic> json) => _$LoadNotificationsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoadNotificationsRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}