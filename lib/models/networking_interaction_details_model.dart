import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'networking_interaction_details_model.g.dart';

@JsonSerializable()
class NetworkingInteractionDetailsModel /*extends Equatable*/ {
  final bool? has_error;
  final NetworkQuestionModel? network_question;

  NetworkingInteractionDetailsModel(this.has_error, this.network_question);

  factory NetworkingInteractionDetailsModel.fromJson(Map<String, dynamic> json) => _$NetworkingInteractionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingInteractionDetailsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class NetworkQuestionModel {
  final List<InteractionsFormAFieldsModel?>? form_fields;

  NetworkQuestionModel(
      this.form_fields,
      );

  factory NetworkQuestionModel.fromJson(Map<String, dynamic> json) => _$NetworkQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkQuestionModelToJson(this);
}

@JsonSerializable()
class InteractionsFormAFieldsModel {
  final String? label;
  final List<InteractionsFieldsModel?>? fields;

  InteractionsFormAFieldsModel(
      this.label,
      this.fields,
      );

  factory InteractionsFormAFieldsModel.fromJson(Map<String, dynamic> json) => _$InteractionsFormAFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionsFormAFieldsModelToJson(this);
}

@JsonSerializable()
class InteractionsFieldsModel {
  final String? label;
  final String? type;
  final String? name;
  final String? placeholder;
  final String? validation_message;
  String? value;
  String? help_text;
  String? selected;
  final bool? is_required;
  final bool? is_readonly;
  final List<InteractionsOptions?>? options;

  InteractionsFieldsModel(
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

  factory InteractionsFieldsModel.fromJson(Map<String, dynamic> json) => _$InteractionsFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionsFieldsModelToJson(this);
}

@JsonSerializable()
class InteractionsOptions {
  final dynamic id;
  final String? value;
  final dynamic header;
  bool? isSelected = false;

  InteractionsOptions(
      this.id, this.value, this.header
      );

  factory InteractionsOptions.fromJson(Map<String, dynamic> json) => _$InteractionsOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionsOptionsToJson(this);
}