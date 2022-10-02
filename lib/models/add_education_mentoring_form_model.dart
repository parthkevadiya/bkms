import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_education_mentoring_form_model.g.dart';

@JsonSerializable()
class AddEducationMentoringFormModel /*extends Equatable*/ {
  final bool? has_error;

  AddEducationMentoringFormModel(this.has_error);

  factory AddEducationMentoringFormModel.fromJson(Map<String, dynamic> json) => _$AddEducationMentoringFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddEducationMentoringFormModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}