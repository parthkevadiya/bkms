import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deactivate_user_model.g.dart';

@JsonSerializable()
class DeactivateUserModel /*extends Equatable*/ {

  DeactivateUserModel();

  factory DeactivateUserModel.fromJson(Map<String, dynamic> json) =>
      _$DeactivateUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeactivateUserModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}