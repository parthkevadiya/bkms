import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_model.g.dart';

@JsonSerializable()
class ResetPasswordRequestModel /*extends Equatable*/ {
  final String password;
  final String confirm_password;
  final String token;
  final int bkms_id;
  final bool is_child;

  ResetPasswordRequestModel(
    this.password,
    this.confirm_password,
    this.token,
    this.bkms_id,
    this.is_child,
  );

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestModelToJson(this);

  /*@override
  List<Object> get props => [token];*/
}
