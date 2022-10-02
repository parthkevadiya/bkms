import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campus_wise_hangout_types_model.g.dart';

@JsonSerializable()
class CampusWiseHangoutTypesModel /*extends Equatable*/ {
  final bool? has_error;
  final List<HangoutTypesModel>? hangout_types;

  CampusWiseHangoutTypesModel(this.has_error, this.hangout_types);

  factory CampusWiseHangoutTypesModel.fromJson(Map<String, dynamic> json) =>
      _$CampusWiseHangoutTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusWiseHangoutTypesModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class HangoutTypesModel {
  final int? id;
  final String? wingName;

  HangoutTypesModel(
    this.id,
    this.wingName,
  );

  factory HangoutTypesModel.fromJson(Map<String, dynamic> json) =>
      _$HangoutTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$HangoutTypesModelToJson(this);
}
