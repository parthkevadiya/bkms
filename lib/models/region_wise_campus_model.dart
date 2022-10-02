import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region_wise_campus_model.g.dart';

@JsonSerializable()
class RegionWiseCampusModel /*extends Equatable*/ {
  final bool? has_error;
  final List<RWCCampusModel>? campus;
  final int? campus_count;

  RegionWiseCampusModel(this.has_error, this.campus, this.campus_count);

  factory RegionWiseCampusModel.fromJson(Map<String, dynamic> json) => _$RegionWiseCampusModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionWiseCampusModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class RWCCampusModel /*extends Equatable*/ {
  final String? id;
  final String? campus_name;
  final String? region_id;

  RWCCampusModel(this.id, this.campus_name, this.region_id);

  factory RWCCampusModel.fromJson(Map<String, dynamic> json) => _$RWCCampusModelFromJson(json);

  Map<String, dynamic> toJson() => _$RWCCampusModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}