import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basic_registration_form_model.g.dart';

@JsonSerializable()
class BasicRegistrationsFormModel /*extends Equatable*/ {
  final String? form_type;
  final EventForm event_form;

  BasicRegistrationsFormModel(this.form_type, this.event_form);

  factory BasicRegistrationsFormModel.fromJson(Map<String, dynamic> json) => _$BasicRegistrationsFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasicRegistrationsFormModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}

@JsonSerializable()
class EventForm {
  final List<FormFields?>? form_fields;

  EventForm(this.form_fields);

  factory EventForm.fromJson(Map<String, dynamic> json) => _$EventFormFromJson(json);

  Map<String, dynamic> toJson() => _$EventFormToJson(this);
}

@JsonSerializable()
class FormFields {
  final List<Fields?>? fields;
  final String label;

  FormFields(this.fields, this.label);

  factory FormFields.fromJson(Map<String, dynamic> json) => _$FormFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$FormFieldsToJson(this);
}

@JsonSerializable()
class Fields {
  final String label;
  final String type;
  final String name;
  final String placeholder;
  final String? validation_message ;
  String? value;
  final String? help_text;
  final bool is_required;
  final bool is_readonly;
  List<Options?>? selected;
  final List<Options?>? options;

  Fields(this.label, this.type, this.name, this.placeholder, this.validation_message, this.value,this.help_text, this.is_required, this.is_readonly, this.selected, this.options);

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);

  Map<String, dynamic> toJson() => _$FieldsToJson(this);
}

@JsonSerializable()
class Options {
  final String id;
  final String? value;
  final String? header;
  bool? isSelected = false;

  Options(this.id, this.value, this.header,);

  factory Options.fromJson(Map<String, dynamic> json) => _$OptionsFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}

@JsonSerializable()
class Selected {
  final String id;
  final String value;

  Selected(this.id, this.value,);

  factory Selected.fromJson(Map<String, dynamic> json) => _$SelectedFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedToJson(this);
}