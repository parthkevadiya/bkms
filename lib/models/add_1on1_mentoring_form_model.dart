import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_1on1_mentoring_form_model.g.dart';

@JsonSerializable()
class Add1On1MentoringFormModel /*extends Equatable*/ {
  final bool? has_error;

  Add1On1MentoringFormModel(this.has_error);

  factory Add1On1MentoringFormModel.fromJson(Map<String, dynamic> json) => _$Add1On1MentoringFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$Add1On1MentoringFormModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}