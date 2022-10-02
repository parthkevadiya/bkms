import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

/*part 'collect_filters_model.g.dart';*/

/*
@JsonSerializable()
class CollectFiltersModel */
/*extends Equatable*//*
 {
  final String gender;
  final List<WingF?>? wing;
  final List<SchoolYear?>? school_year;
  final List<Region?>? region;
  final List<CenterF?>? center;


  CollectFiltersModel(
      this.gender, this.wing, this.school_year, this.region, this.center);

  factory CollectFiltersModel.fromJson(Map<String, dynamic> json) =>
      _$CollectFiltersModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectFiltersModelToJson(this);

  */
/*@override
  List<Object> get props => [gender];*//*

}

@JsonSerializable()
class CenterF */
/*extends Equatable*//*
 {
  final int id;
  final String CenterName;
  final String RegionId;


  CenterF(this.id, this.CenterName, this.RegionId);

  factory CenterF.fromJson(Map<String, dynamic> json) => _$CenterFFromJson(json);

  Map<String, dynamic> toJson() => _$CenterFToJson(this);

  */
/*@override
  List<Object> get props => [id];*//*

}

@JsonSerializable()
class Region */
/*extends Equatable*//*
 {
  final int id;
  final String RegionName;
  final String RegionShortName;


  Region(this.id, this.RegionName, this.RegionShortName);

  factory Region.fromJson(Map<String, dynamic> json) =>
      _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);

  */
/*@override
  List<Object> get props => [id];*//*

}

@JsonSerializable()
class SchoolYear */
/*extends Equatable*//*
 {
  final int id;
  final String school_display_name;
  final String school_value;


  SchoolYear(this.id, this.school_display_name, this.school_value);

  factory SchoolYear.fromJson(Map<String, dynamic> json) =>
      _$SchoolYearFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolYearToJson(this);

  */
/*@override
  List<Object> get props => [id];*//*

}

@JsonSerializable()
class WingF */
/*extends Equatable*//*
 {
  final int id;
  final String wingName;
  final String gender;

  WingF(this.id, this.wingName, this.gender);

  factory WingF.fromJson(Map<String, dynamic> json) =>
      _$WingFFromJson(json);

  Map<String, dynamic> toJson() => _$WingFToJson(this);

  */
/*@override
  List<Object> get props => [id];*//*

}*/
