import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kst_report_model.g.dart';

@JsonSerializable()
class KSTReportModel /*extends Equatable*/ {
  final bool? has_error;
  final KSTResultModel? kst_result;
  final KSTFilterModel? kst_filter;
  String? roleType;

  KSTReportModel(this.has_error, this.kst_result, this.kst_filter);

  factory KSTReportModel.fromJson(Map<String, dynamic> json) => _$KSTReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$KSTReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class KSTResultModel {
  final List<KSTReportListDataModel?>? data;
  final int? total;

  KSTResultModel(this.data, this.total,);

  factory KSTResultModel.fromJson(Map<String, dynamic> json) => _$KSTResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$KSTResultModelToJson(this);
}

@JsonSerializable()
class KSTReportListDataModel {
  final dynamic id;
  final String? participant_center_id;
  final String? average;
  final String? fall_year;
  final String? spring_year;
  final String? region_id;
  final String? host_center_id;
  final String? wing_id;
  final String? kst_year;
  final String? CenterName;
  final String? RegionName;
  final String? wingName;

  KSTReportListDataModel(
      this.id,
      this.participant_center_id,
      this.average,
      this.fall_year,
      this.spring_year,
      this.region_id,
      this.host_center_id,
      this.wing_id,
      this.kst_year,
      this.CenterName,
      this.RegionName,
      this.wingName);

  factory KSTReportListDataModel.fromJson(Map<String, dynamic> json) => _$KSTReportListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$KSTReportListDataModelToJson(this);
}

@JsonSerializable()
class KSTFilterModel {
  final int? user_wings;
  final String? date;
  final String? user_region_id;
  final String? user_center_id;
  final List<KSTWingsItems?>? wings;
  final List<KSTRegionItems?>? regions;
  final List<KSTCentersItems?>? centers;
  final List<KSTCentersItems?>? kst_centers;
  final List<int?>? years;

  KSTFilterModel(this.user_wings, this.date, this.user_region_id,
      this.user_center_id, this.wings, this.regions, this.centers, this.kst_centers, this.years);

  factory KSTFilterModel.fromJson(Map<String, dynamic> json) => _$KSTFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$KSTFilterModelToJson(this);
}

@JsonSerializable()
class KSTWingsItems {
  final dynamic id;
  final String? wingName;

  KSTWingsItems(this.id, this.wingName);

  factory KSTWingsItems.fromJson(Map<String, dynamic> json) => _$KSTWingsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$KSTWingsItemsToJson(this);
}

@JsonSerializable()
class KSTRegionItems {
  final dynamic id;
  final String? RegionName;

  KSTRegionItems(this.id, this.RegionName);

  factory KSTRegionItems.fromJson(Map<String, dynamic> json) => _$KSTRegionItemsFromJson(json);

  Map<String, dynamic> toJson() => _$KSTRegionItemsToJson(this);
}

@JsonSerializable()
class KSTCentersItems {
  final dynamic id;
  final String? CenterName;
  final String? RegionId;

  KSTCentersItems(this.id, this.CenterName, this.RegionId);

  factory KSTCentersItems.fromJson(Map<String, dynamic> json) => _$KSTCentersItemsFromJson(json);

  Map<String, dynamic> toJson() => _$KSTCentersItemsToJson(this);
}