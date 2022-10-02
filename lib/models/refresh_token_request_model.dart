import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request_model.g.dart';

@JsonSerializable()
class RefreshTokenRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;
  final String refresh_token;

  RefreshTokenRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.bkms_id,
    this.refresh_token,
  );

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestModelToJson(this);

/*@override
  List<Object> get props => [bkms_id];*/
}
