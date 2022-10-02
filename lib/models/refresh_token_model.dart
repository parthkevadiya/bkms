import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_model.g.dart';

@JsonSerializable()
class RefreshTokenModel /*extends Equatable*/ {
  final String access_token;

  RefreshTokenModel(
      this.access_token,);

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => _$RefreshTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenModelToJson(this);

  /*@override
  List<Object> get props => [access_token];*/
}