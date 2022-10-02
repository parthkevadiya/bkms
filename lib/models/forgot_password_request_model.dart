import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request_model.g.dart';

@JsonSerializable()
class ForgotPasswordRequestModel /*extends Equatable*/ {
  final int bkms_id;
  final String email_address;

  ForgotPasswordRequestModel(
    this.bkms_id,
    this.email_address,
  );

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
