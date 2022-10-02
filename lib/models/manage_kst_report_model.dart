import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_kst_report_model.g.dart';

@JsonSerializable()
class ManageKSTReportModel /*extends Equatable*/ {
  final bool? has_error;
  final ManageKSTReportListModel? manage_kst_report;

  ManageKSTReportModel(this.has_error, this.manage_kst_report);

  factory ManageKSTReportModel.fromJson(Map<String, dynamic> json) => _$ManageKSTReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ManageKSTReportListModel {
  final List<ManageKSTReportListDataModel?>? data;
  final int? total;

  ManageKSTReportListModel(this.data, this.total,);

  factory ManageKSTReportListModel.fromJson(Map<String, dynamic> json) => _$ManageKSTReportListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTReportListModelToJson(this);
}

@JsonSerializable()
class ManageKSTReportListDataModel {
  final String? id;
  final String? name;
  final String? report_year;
  final String? host_center_id;
  final String? region_id;
  final String? CenterName;
  final String? RegionName;
  final String? wing_id;
  final String? wingName;
  final String? kst_report_status;

  ManageKSTReportListDataModel(
      this.id,
      this.name,
      this.report_year,
      this.host_center_id,
      this.region_id,
      this.CenterName,
      this.RegionName,
      this.wing_id,
      this.wingName,
      this.kst_report_status);

  factory ManageKSTReportListDataModel.fromJson(Map<String, dynamic> json) => _$ManageKSTReportListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTReportListDataModelToJson(this);
}