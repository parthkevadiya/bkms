import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'education_mentoring_interaction_details_model.g.dart';

@JsonSerializable()
class EducationMentoringInteractionDetailsModel /*extends Equatable*/ {
  final bool? has_error;
  final List<EMIDFormAFieldsModel?>? form_fields;

  EducationMentoringInteractionDetailsModel(this.has_error, this.form_fields);

  factory EducationMentoringInteractionDetailsModel.fromJson(Map<String, dynamic> json) => _$EducationMentoringInteractionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationMentoringInteractionDetailsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class EMIDFormAFieldsModel {
  final String? label;
  final String? sub_label;
  final List<EMIDIFieldsModel?>? fields;

  EMIDFormAFieldsModel(
      this.label,
      this.sub_label,
      this.fields,
      );

  factory EMIDFormAFieldsModel.fromJson(Map<String, dynamic> json) => _$EMIDFormAFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EMIDFormAFieldsModelToJson(this);
}

@JsonSerializable()
class EMIDIFieldsModel {
  final String? label;
  final String? type;
  final String? name;
  final String? placeholder;
  final String? validation_message;
  String? value;
  String? help_text;
  final bool? is_required;
  final bool? is_readonly;
  final List<EMIDOptions?>? options;
  List<EMIDOptions?>? selected;

  EMIDIFieldsModel(
      this.label,
      this.type,
      this.name,
      this.placeholder,
      this.validation_message,
      this.value,
      this.help_text,
      this.selected,
      this.is_required,
      this.is_readonly,
      this.options);

  factory EMIDIFieldsModel.fromJson(Map<String, dynamic> json) => _$EMIDIFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EMIDIFieldsModelToJson(this);
}

@JsonSerializable()
class EMIDOptions {
  final dynamic id;
  final String? value;
  final dynamic header;
  bool? isSelected = false;

  EMIDOptions(
      this.id, this.value, this.header
      );

  factory EMIDOptions.fromJson(Map<String, dynamic> json) => _$EMIDOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$EMIDOptionsToJson(this);
}