import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campus_hangout_region_model.g.dart';

@JsonSerializable()
class CampusHangoutRegionModel /*extends Equatable*/ {
  final bool? has_error;
  final List<CHRegionModel>? regions;
  final String? user_role_type;
  final String? user_region_id;
  final String? user_center_id;

  CampusHangoutRegionModel(this.has_error, this.regions, this.user_role_type,
      this.user_region_id, this.user_center_id);

  factory CampusHangoutRegionModel.fromJson(Map<String, dynamic> json) =>
      _$CampusHangoutRegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutRegionModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class CHRegionModel /*extends Equatable*/ {
  final dynamic id;
  final String? RegionName;

  CHRegionModel(this.id, this.RegionName);

  factory CHRegionModel.fromJson(Map<String, dynamic> json) =>
      _$CHRegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CHRegionModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
