import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'h_region_wise_campus_model.g.dart';

@JsonSerializable()
class HRegionWiseCampusModel /*extends Equatable*/ {
  final bool? has_error;
  final List<HCampusModel>? campus;
  final int? campus_count;

  HRegionWiseCampusModel(this.has_error, this.campus, this.campus_count);

  factory HRegionWiseCampusModel.fromJson(Map<String, dynamic> json) => _$HRegionWiseCampusModelFromJson(json);

  Map<String, dynamic> toJson() => _$HRegionWiseCampusModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class HCampusModel /*extends Equatable*/ {
  final String? id;
  final String? campus_name;
  final String? region_id;

  HCampusModel(this.id, this.campus_name, this.region_id);

  factory HCampusModel.fromJson(Map<String, dynamic> json) => _$HCampusModelFromJson(json);

  Map<String, dynamic> toJson() => _$HCampusModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}