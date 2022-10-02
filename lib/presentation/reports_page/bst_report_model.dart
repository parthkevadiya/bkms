import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bst_report_model.g.dart';

@JsonSerializable()
class BSTReportModel /*extends Equatable*/ {
  final bool? has_error;
  final BSTReportListModel? bst_report_list;
  final BSSTSearchFilterModel? search_filter;
  String? roleType;

  BSTReportModel(this.has_error, this.bst_report_list, this.search_filter);

  factory BSTReportModel.fromJson(Map<String, dynamic> json) =>
      _$BSTReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSTReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class BSTReportListModel {
  final List<BSTReportListDataModel?>? data;
  final int? total;

  BSTReportListModel(
    this.data,
    this.total,
  );

  factory BSTReportListModel.fromJson(Map<String, dynamic> json) =>
      _$BSTReportListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSTReportListModelToJson(this);
}

@JsonSerializable()
class BSTReportListDataModel {
  final String? id;
  final String? region_id;
  final String? host_center_id;
  final String? year;
  final String? CenterName;
  final String? RegionName;
  final String? wingName;
  final String? average;
  final String? wing_id;

  BSTReportListDataModel(
      this.id,
      this.region_id,
      this.host_center_id,
      this.year,
      this.CenterName,
      this.RegionName,
      this.wingName,
      this.average,
      this.wing_id,
      );

  factory BSTReportListDataModel.fromJson(Map<String, dynamic> json) => _$BSTReportListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSTReportListDataModelToJson(this);
}

@JsonSerializable()
class BSSTSearchFilterModel {
  final int? user_wing_set;
  final int? user_wings;
  final String? user_role_type;
  final String? last_sunday;
  final String? user_region_id;
  final String? user_center_id;
  final List<BSTWingsItems?>? wings;
  final List<BSTRegionItems?>? regions;
  final List<BSTCentersItems?>? centers;
  final List<BSTCentersItems?>? bst_centers;
  final List<int?>? years;

  BSSTSearchFilterModel(
      this.user_wing_set,
      this.user_wings,
      this.user_role_type,
      this.last_sunday,
      this.user_region_id,
      this.user_center_id,
      this.wings,
      this.regions,
      this.centers,
      this.bst_centers,
      this.years);

  factory BSSTSearchFilterModel.fromJson(Map<String, dynamic> json) => _$BSSTSearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSSTSearchFilterModelToJson(this);
}

@JsonSerializable()
class BSTWingsItems {
  final dynamic id;
  final String? wingName;

  BSTWingsItems(this.id, this.wingName);

  factory BSTWingsItems.fromJson(Map<String, dynamic> json) => _$BSTWingsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$BSTWingsItemsToJson(this);
}

@JsonSerializable()
class BSTRegionItems {
  final dynamic id;
  final String? RegionName;

  BSTRegionItems(this.id, this.RegionName);

  factory BSTRegionItems.fromJson(Map<String, dynamic> json) =>
      _$BSTRegionItemsFromJson(json);

  Map<String, dynamic> toJson() => _$BSTRegionItemsToJson(this);
}

@JsonSerializable()
class BSTCentersItems {
  final dynamic id;
  final String? CenterName;
  final String? RegionId;

  BSTCentersItems(this.id, this.CenterName, this.RegionId);

  factory BSTCentersItems.fromJson(Map<String, dynamic> json) =>
      _$BSTCentersItemsFromJson(json);

  Map<String, dynamic> toJson() => _$BSTCentersItemsToJson(this);
}
