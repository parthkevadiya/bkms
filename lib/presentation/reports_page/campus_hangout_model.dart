import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campus_hangout_model.g.dart';

@JsonSerializable()
class CampusHangoutModel /*extends Equatable*/ {
  final bool? has_error;
  final CampusHangoutListModel? campus_hangout_list;
  final CampusHangoutSearchFilterModel? search_filter;
  String? roleType;

  CampusHangoutModel(this.has_error, this.campus_hangout_list, this.search_filter);

  factory CampusHangoutModel.fromJson(Map<String, dynamic> json) => _$CampusHangoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class CampusHangoutListModel {
  final List<CampusHangoutDataModel?>? data;
  final int? total;

  CampusHangoutListModel(
    this.data,
    this.total,
  );

  factory CampusHangoutListModel.fromJson(Map<String, dynamic> json) => _$CampusHangoutListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutListModelToJson(this);
}

@JsonSerializable()
class CampusHangoutDataModel {
  final String? id;
  final String? wing_id;
  final String? region_id;
  final String? campus_id;
  final String? year;
  final String? CenterName;
  final String? RegionName;
  final String? wingName;
  final String? average;
  final String? campus_name;

  CampusHangoutDataModel(
      this.id,
      this.wing_id,
      this.region_id,
      this.campus_id,
      this.year,
      this.CenterName,
      this.RegionName,
      this.wingName,
      this.average,
      this.campus_name);

  factory CampusHangoutDataModel.fromJson(Map<String, dynamic> json) => _$CampusHangoutDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutDataModelToJson(this);
}

@JsonSerializable()
class CampusHangoutSearchFilterModel {
  final int? user_wings;
  final String? user_role_type;
  final String? user_region_id;
  final String? user_center_id;
  final List<CHWingsItems?>? wings;
  final List<CHRegionItems?>? regions;
  final List<CampusRegionItems?>? campus_region;
  final List<CHCentersItems?>? centers;
  final List<int?>? years;

  CampusHangoutSearchFilterModel(
      this.user_wings,
      this.user_role_type,
      this.user_region_id,
      this.user_center_id,
      this.wings,
      this.regions,
      this.campus_region,
      this.centers,
      this.years);

  factory CampusHangoutSearchFilterModel.fromJson(Map<String, dynamic> json) => _$CampusHangoutSearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutSearchFilterModelToJson(this);
}

@JsonSerializable()
class CHWingsItems {
  final dynamic id;
  final String? wingName;

  CHWingsItems(this.id, this.wingName);

  factory CHWingsItems.fromJson(Map<String, dynamic> json) =>
      _$CHWingsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CHWingsItemsToJson(this);
}

@JsonSerializable()
class CHRegionItems {
  final dynamic id;
  final String? RegionName;

  CHRegionItems(this.id, this.RegionName);

  factory CHRegionItems.fromJson(Map<String, dynamic> json) => _$CHRegionItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CHRegionItemsToJson(this);
}

@JsonSerializable()
class CampusRegionItems {
  final dynamic region_id;
  final String? RegionName;

  CampusRegionItems(this.region_id, this.RegionName);

  factory CampusRegionItems.fromJson(Map<String, dynamic> json) => _$CampusRegionItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CampusRegionItemsToJson(this);
}

@JsonSerializable()
class CHCentersItems {
  final dynamic id;
  final String? CenterName;
  final String? RegionId;

  CHCentersItems(this.id, this.CenterName, this.RegionId);

  factory CHCentersItems.fromJson(Map<String, dynamic> json) => _$CHCentersItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CHCentersItemsToJson(this);
}
