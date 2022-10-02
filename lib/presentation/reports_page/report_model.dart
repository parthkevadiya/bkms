import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel /*extends Equatable*/ {
  final bool? has_error;
  final SabhaResultModel? sabha_result;
  final SabhaFilterModel? sabha_filter;
  String? roleType;

  ReportModel(this.has_error, this.sabha_result, this.sabha_filter);

  factory ReportModel.fromJson(Map<String, dynamic> json) => _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class SabhaResultModel {
  final int? current_page;
  final List<ReportsListDataModel?>? data;
  final List<LinksModel?>? links;
  final String? first_page_url;
  final String? last_page_url;
  final String? next_page_url;
  final String? prev_page_url;
  final String? path;
  final int? from;
  final int? to;
  final int? last_page;
  final int? per_page;
  final int? total;

  SabhaResultModel(this.current_page, this.data, this.links, this.first_page_url, this.last_page_url,
      this.next_page_url, this.prev_page_url, this.path, this.from, this.to, this.last_page, this.per_page, this.total);

  factory SabhaResultModel.fromJson(Map<String, dynamic> json) => _$SabhaResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$SabhaResultModelToJson(this);
}

@JsonSerializable()
class LinksModel {
  final String? url;
  final String? label;
  final bool active;

  LinksModel(this.url, this.label, this.active);

  factory LinksModel.fromJson(Map<String, dynamic> json) => _$LinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}

@JsonSerializable()
class ReportsListDataModel {
  final int id;
  final String? sabha_label;
  final String? center_id;
  final String? region_id;
  final String? wing_id;
  final String? sabha_date;
  final String? sabha_week_date;
  final String? sabha_status;
  final String? CenterName;
  final String? RegionName;
  final String? wingName;
  final String? total_ratio;

  ReportsListDataModel(this.id, this.sabha_label, this.center_id, this.region_id, this.wing_id, this.sabha_date,
      this.sabha_week_date, this.sabha_status, this.CenterName, this.RegionName, this.wingName, this.total_ratio);

  factory ReportsListDataModel.fromJson(Map<String, dynamic> json) => _$ReportsListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsListDataModelToJson(this);
}

@JsonSerializable()
class SabhaFilterModel /*extends Equatable*/ {
  final bool has_error;
  final List<RegionsModel?>? regions;
  final List<WingsModel?>? wings;
  final List<CentersModel?>? centers;
  final List<int?>? years;
  final List<ReportStatusModel?>? report_status;
  final List<String?>? sabha_week;
  final int? user_wings;
  final String? last_sunday;
  final String? user_region_id;
  final String? user_center_id;
  final String? selected_week;

  SabhaFilterModel(this.has_error, this.regions, this.wings, this.centers, this.years, this.report_status,
      this.sabha_week, this.user_wings, this.last_sunday, this.user_region_id, this.user_center_id, this.selected_week);

  factory SabhaFilterModel.fromJson(Map<String, dynamic> json) => _$SabhaFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$SabhaFilterModelToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class RegionsModel {
  final int id;
  final String RegionName;

  RegionsModel(this.id, this.RegionName);

  factory RegionsModel.fromJson(Map<String, dynamic> json) => _$RegionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionsModelToJson(this);
}

@JsonSerializable()
class WingsModel {
  final int id;
  final String wingName;

  WingsModel(this.id, this.wingName);

  factory WingsModel.fromJson(Map<String, dynamic> json) => _$WingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WingsModelToJson(this);
}

@JsonSerializable()
class CentersModel {
  final int id;
  final String CenterName;
  final String RegionId;

  CentersModel(this.id, this.CenterName, this.RegionId);

  factory CentersModel.fromJson(Map<String, dynamic> json) => _$CentersModelFromJson(json);

  Map<String, dynamic> toJson() => _$CentersModelToJson(this);
}

@JsonSerializable()
class ReportStatusModel {
  final int id;
  final String value;

  ReportStatusModel(this.id, this.value);

  factory ReportStatusModel.fromJson(Map<String, dynamic> json) => _$ReportStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportStatusModelToJson(this);
}
