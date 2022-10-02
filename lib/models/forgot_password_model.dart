import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_model.g.dart';

@JsonSerializable()
class ForgotPasswordModel /*extends Equatable*/ {
  final String reset_token;

  ForgotPasswordModel(
      this.reset_token);

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordModelToJson(this);

  /*@override
  List<Object> get props => [reset_token];*/
}