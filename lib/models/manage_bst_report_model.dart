import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_bst_report_model.g.dart';

@JsonSerializable()
class ManageBSTReportModel /*extends Equatable*/ {
  final bool? has_error;
  final ManageBSTReportListModel? manage_bst_report_list;

  ManageBSTReportModel(this.has_error, this.manage_bst_report_list);

  factory ManageBSTReportModel.fromJson(Map<String, dynamic> json) => _$ManageBSTReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ManageBSTReportListModel {
  final List<ManageBSTReportListDataModel?>? data;
  final int? total;

  ManageBSTReportListModel(this.data, this.total,);

  factory ManageBSTReportListModel.fromJson(Map<String, dynamic> json) => _$ManageBSTReportListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTReportListModelToJson(this);
}

@JsonSerializable()
class ManageBSTReportListDataModel {
  final String? id;
  final String? name;
  final String? CenterName;
  final String? RegionName;
  final String? wingName;
  final String? fall_year;
  final String? spring_year;
  final String? bst_report_status;
  final String? wing_id;
  final String? region_id;
  final String? center_id;

  ManageBSTReportListDataModel(
      this.id,
      this.name,
      this.CenterName,
      this.RegionName,
      this.wingName,
      this.fall_year,
      this.spring_year,
      this.bst_report_status,
      this.wing_id,
      this.region_id,
      this.center_id,
      );

  factory ManageBSTReportListDataModel.fromJson(Map<String, dynamic> json) => _$ManageBSTReportListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTReportListDataModelToJson(this);
}