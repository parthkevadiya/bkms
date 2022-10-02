import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'center_wise_interaction_model.g.dart';

@JsonSerializable()
class CenterWiseInteractionTypesModel /*extends Equatable*/ {
  final bool? has_error;
  final int? type_count;
  final List<String?>? type;

  CenterWiseInteractionTypesModel(this.has_error, this.type_count, this.type);

  factory CenterWiseInteractionTypesModel.fromJson(Map<String, dynamic> json) => _$CenterWiseInteractionTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CenterWiseInteractionTypesModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}