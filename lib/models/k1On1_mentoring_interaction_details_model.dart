import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'k1On1_mentoring_interaction_details_model.g.dart';

@JsonSerializable()
class K1On1MentoringInteractionDetailsModel /*extends Equatable*/ {
  final bool? has_error;
  final List<K1On1MIDFormAFieldsModel?>? form_fields;

  K1On1MentoringInteractionDetailsModel(this.has_error, this.form_fields);

  factory K1On1MentoringInteractionDetailsModel.fromJson(Map<String, dynamic> json) => _$K1On1MentoringInteractionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$K1On1MentoringInteractionDetailsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class K1On1MIDFormAFieldsModel {
  final String? label;
  final String? sub_label;
  final List<K1On1MIDIFieldsModel?>? fields;

  K1On1MIDFormAFieldsModel(
      this.label,
      this.sub_label,
      this.fields,
      );

  factory K1On1MIDFormAFieldsModel.fromJson(Map<String, dynamic> json) => _$K1On1MIDFormAFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$K1On1MIDFormAFieldsModelToJson(this);
}

@JsonSerializable()
class K1On1MIDIFieldsModel {
  final String? label;
  final String? type;
  final String? name;
  final String? placeholder;
  final String? validation_message;
  String? value;
  String? help_text;
  final bool? is_required;
  final bool? is_readonly;
  final List<K1On1MIDOptions?>? options;
  List<K1On1MIDOptions?>? selected;

  K1On1MIDIFieldsModel(
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

  factory K1On1MIDIFieldsModel.fromJson(Map<String, dynamic> json) => _$K1On1MIDIFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$K1On1MIDIFieldsModelToJson(this);
}

@JsonSerializable()
class K1On1MIDOptions {
  final dynamic id;
  final String? value;
  final dynamic header;
  bool? isSelected = false;

  K1On1MIDOptions(
      this.id, this.value, this.header
      );

  factory K1On1MIDOptions.fromJson(Map<String, dynamic> json) => _$K1On1MIDOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$K1On1MIDOptionsToJson(this);
}