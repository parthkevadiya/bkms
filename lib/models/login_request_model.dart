import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel /*extends Equatable*/ {
  final int bkms_id;
  final String email_address;
  final String password;
  final String fcm_token;

  LoginRequestModel(
    this.bkms_id,
    this.email_address,
    this.password,
    this.fcm_token,
  );

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
