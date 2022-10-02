import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_model.g.dart';

@JsonSerializable()
class ResetPasswordModel /*extends Equatable*/ {


  ResetPasswordModel(
      );

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);

  /*@override
  List<Object> get props => [];*/
}