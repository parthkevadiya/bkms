import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'record_model.g.dart';

@JsonSerializable()
class RecordModel /*extends Equatable*/ {
  final dynamic file_url;
  final dynamic total_reocrds;
  final List<RecordsItem?>? records;
  final RecordsFilters? filter;

  RecordModel(this.file_url, this.total_reocrds, this.records, this.filter);

  factory RecordModel.fromJson(Map<String, dynamic> json) => _$RecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecordModelToJson(this);

  /*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class RecordsFilters /*extends Equatable*/ {
  final SelectedFilters selected_filter;
  final String gender;
  final List<WingF?>? wing;
  final List<SchoolYear?>? school_year;
  final List<Region?>? region;
  final List<CenterF?>? center;
  @JsonKey(defaultValue: [])
  final List<UserGroup?> user_group;

  RecordsFilters(
    this.selected_filter,
    this.gender,
    this.wing,
    this.school_year,
    this.region,
    this.center,
    this.user_group,
  );

  factory RecordsFilters.fromJson(Map<String, dynamic> json) => _$RecordsFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$RecordsFiltersToJson(this);

/*@override
  List<Object> get props => [gender];*/
}

@JsonSerializable()
class SelectedFilters /*extends Equatable*/ {
  final dynamic gender;
  final String wing;
  final String school_year;
  final String region;
  final String center;
  final String user_group;

  SelectedFilters(
    this.gender,
    this.wing,
    this.school_year,
    this.region,
    this.center,
    this.user_group,
  );

  factory SelectedFilters.fromJson(Map<String, dynamic> json) => _$SelectedFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedFiltersToJson(this);

/*@override
  List<Object> get props => [gender];*/
}

@JsonSerializable()
class CenterF /*extends Equatable*/ {
  final int id;
  final String CenterName;
  final String RegionId;

  CenterF(this.id, this.CenterName, this.RegionId);

  factory CenterF.fromJson(Map<String, dynamic> json) => _$CenterFFromJson(json);

  Map<String, dynamic> toJson() => _$CenterFToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class UserGroup /*extends Equatable*/ {
  final String group_name;

  UserGroup(this.group_name);

  factory UserGroup.fromJson(Map<String, dynamic> json) => _$UserGroupFromJson(json);

  Map<String, dynamic> toJson() => _$UserGroupToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class Region /*extends Equatable*/ {
  final int id;
  final String RegionName;
  final String RegionShortName;

  Region(this.id, this.RegionName, this.RegionShortName);

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class SchoolYear /*extends Equatable*/ {
  final int id;
  final String school_display_name;
  final String school_value;

  SchoolYear(this.id, this.school_display_name, this.school_value);

  factory SchoolYear.fromJson(Map<String, dynamic> json) => _$SchoolYearFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolYearToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class WingF /*extends Equatable*/ {
  final int id;
  final String wingName;
  final String gender;

  WingF(this.id, this.wingName, this.gender);

  factory WingF.fromJson(Map<String, dynamic> json) => _$WingFFromJson(json);

  Map<String, dynamic> toJson() => _$WingFToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class RecordsItem /*extends Equatable*/ {
  final int id;
  final String? name;
  final String? image;
  final String? region;
  final String? region_id;
  final String? current_wing;
  final String? current_wing_name;
  final String? gender;
  final String? school_year;
  final String? center;
  final String? center_id;
  final String? email;
  final String? phone_cell;

  RecordsItem(this.id, this.name, this.image, this.region, this.region_id, this.current_wing, this.current_wing_name,
      this.gender, this.school_year, this.center, this.center_id, this.email, this.phone_cell);

  RecordsItem copy() => RecordsItem.fromJson(jsonDecode(jsonEncode(this)));

  factory RecordsItem.fromJson(Map<String, dynamic> json) => _$RecordsItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecordsItemToJson(this);

  /*@override
  List<Object> get props => [id];*/
}
