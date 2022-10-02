import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_liability_form_model.g.dart';

@JsonSerializable()
class SubmitLiabilityFormModel /*extends Equatable*/ {
  final bool? has_error;

  SubmitLiabilityFormModel(this.has_error);

  factory SubmitLiabilityFormModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitLiabilityFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitLiabilityFormModelToJson(this);

/*@override
  List<Object> get props => [name];*/
}