import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_basic_registrations_model.g.dart';

@JsonSerializable()
class SubmitBasicRegistrationsModel /*extends Equatable*/ {
  final bool has_error;

  SubmitBasicRegistrationsModel(this.has_error);

  factory SubmitBasicRegistrationsModel.fromJson(Map<String, dynamic> json) => _$SubmitBasicRegistrationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitBasicRegistrationsModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}