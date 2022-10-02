import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_request_model.g.dart';

@JsonSerializable()
class UserProfileRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;
  final String record_id;

  UserProfileRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.bkms_id,
    this.record_id,
  );

  factory UserProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileRequestModelToJson(this);

/*@override
  List<Object> get props => [bkms_id];*/
}
