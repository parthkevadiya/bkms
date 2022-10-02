import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goshthi_report_model.g.dart';

@JsonSerializable()
class GoshthiReportModel /*extends Equatable*/ {
  final bool? has_error;
  final GoshthiResultModel? goshthi_result;
  final SabhaGoshthiFilterModel? sabha_goshthi_filter;
  String? roleType;

  GoshthiReportModel(this.has_error, this.goshthi_result, this.sabha_goshthi_filter);

  factory GoshthiReportModel.fromJson(Map<String, dynamic> json) => _$GoshthiReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class SabhaGoshthiFilterModel {
  final String? user_role_type;
  final String? last_sunday;
  final String? user_region_id;
  final String? user_center_id;
  final List<RegionItems?>? regions;
  final List<CentersItems?>? centers;
  final List<ReportCenterItems?>? report_center;
  final List<String?>? gender;
  final List<GoshthiMonthItems?>? months;
  final List<int?>? years;

  SabhaGoshthiFilterModel(
      this.user_role_type,
      this.last_sunday,
      this.user_region_id,
      this.user_center_id,
      this.regions,
      this.centers,
      this.report_center,
      this.gender,
      this.months,
      this.years);

  factory SabhaGoshthiFilterModel.fromJson(Map<String, dynamic> json) => _$SabhaGoshthiFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$SabhaGoshthiFilterModelToJson(this);
}

@JsonSerializable()
class RegionItems {
  final int id;
  final String RegionName;

  RegionItems(
      this.id,
      this.RegionName,);

  factory RegionItems.fromJson(Map<String, dynamic> json) => _$RegionItemsFromJson(json);

  Map<String, dynamic> toJson() => _$RegionItemsToJson(this);
}

@JsonSerializable()
class CentersItems {
  final int id;
  final String CenterName;
  final String RegionId;

  CentersItems(
      this.id,
      this.CenterName,
      this.RegionId,
      );

  factory CentersItems.fromJson(Map<String, dynamic> json) => _$CentersItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CentersItemsToJson(this);
}

@JsonSerializable()
class ReportCenterItems {
  final int? id;
  final String? CenterName;
  final String? RegionId;

  ReportCenterItems(
      this.id,
      this.CenterName,
      this.RegionId,
      );

  factory ReportCenterItems.fromJson(Map<String, dynamic> json) => _$ReportCenterItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ReportCenterItemsToJson(this);
}

@JsonSerializable()
class GoshthiResultModel {
  final int? current_page;
  final int? from;
  final int? last_page;
  final int? per_page;
  final int? to;
  final int? total;
  final List<GoshthiDataModel?>? data;

  GoshthiResultModel(this.current_page, this.from, this.last_page, this.per_page, this.to, this.total, this.data);

  factory GoshthiResultModel.fromJson(Map<String, dynamic> json) => _$GoshthiResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiResultModelToJson(this);
}

@JsonSerializable()
class GoshthiMonthItems {
  final String? id;
  final String? name;

  GoshthiMonthItems(this.id, this.name);

  factory GoshthiMonthItems.fromJson(Map<String, dynamic> json) => _$GoshthiMonthItemsFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiMonthItemsToJson(this);
}

@JsonSerializable()
class GoshthiDataModel {
  final String? id;
  final String? current_page;
  final String? sabha_date;
  final String? sabha_label;
  final String? attendees;
  final String? created_by;
  final String? region_id;
  final String? center_id;
  final String? updated_by;
  final String? sabha_gender;
  final String? sabha_year;
  final String? month_number;
  final String? goshthi_held;
  final String? report_status;
  final String? wing_id;
  final String? RegionName;
  final String? CenterName;
  final String? goshthi_report_status;
  final String? total_ratio;
  final String? wingName;

  GoshthiDataModel(
      this.id,
      this.current_page,
      this.sabha_date,
      this.sabha_label,
      this.attendees,
      this.created_by,
      this.region_id,
      this.center_id,
      this.updated_by,
      this.sabha_gender,
      this.sabha_year,
      this.month_number,
      this.goshthi_held,
      this.report_status,
      this.wing_id,
      this.RegionName,
      this.CenterName,
      this.goshthi_report_status,
      this.total_ratio,
      this.wingName,
      );

  factory GoshthiDataModel.fromJson(Map<String, dynamic> json) => _$GoshthiDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiDataModelToJson(this);
}