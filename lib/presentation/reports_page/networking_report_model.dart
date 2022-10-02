import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'networking_report_model.g.dart';

@JsonSerializable()
class NetworkingReportModel /*extends Equatable*/ {
  final bool? has_error;
  final NetworkListModel? network_list;
  final FilterDataModel? filter_data;
  String? roleType;

  NetworkingReportModel(this.has_error, this.network_list, this.filter_data);

  factory NetworkingReportModel.fromJson(Map<String, dynamic> json) => _$NetworkingReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class NetworkListModel {
  final int? current_page;
  final List<NetworkReportListDataModel?>? data;
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

  NetworkListModel(
      this.current_page,
      this.data,
      this.first_page_url,
      this.last_page_url,
      this.next_page_url,
      this.prev_page_url,
      this.path,
      this.from,
      this.to,
      this.last_page,
      this.per_page,
      this.total);

  factory NetworkListModel.fromJson(Map<String, dynamic> json) => _$NetworkListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkListModelToJson(this);
}

@JsonSerializable()
class NetworkReportListDataModel {
  final String? id;
  final String? center_id;
  final String? CenterName;
  final String? RegionName;
  final String? wingname;
  final String? reportdate;
  final String? current_networking_targetuser;
  final String? current_networking_targetuser_id;
  final String? networking_targetuser_id;
  final String? total_user_interaction;
  final String? total_parent_interaction;
  final String? total_ratio;

  NetworkReportListDataModel(
      this.id,
      this.center_id,
      this.CenterName,
      this.RegionName,
      this.wingname,
      this.reportdate,
      this.current_networking_targetuser,
      this.current_networking_targetuser_id,
      this.networking_targetuser_id,
      this.total_user_interaction,
      this.total_parent_interaction,
      this.total_ratio,
      );

  factory NetworkReportListDataModel.fromJson(Map<String, dynamic> json) => _$NetworkReportListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkReportListDataModelToJson(this);
}

@JsonSerializable()
class FilterDataModel /*extends Equatable*/ {
  final String? user_role_type;
  final String? user_region_id;
  final String? user_center_id;
  final List<NTWRKRegionsModel?>? regions;
  final List<NTWRKCentersModel?>? centers;
  final List<NTWRKReportCenterModel?>? report_center;
  final List<int?>? years;

  FilterDataModel(
      this.user_role_type,
      this.user_region_id,
      this.user_center_id,
      this.regions,
      this.centers,
      this.report_center,
      this.years);

  factory FilterDataModel.fromJson(Map<String, dynamic> json) => _$FilterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterDataModelToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class NTWRKRegionsModel /*extends Equatable*/ {
  final int? id;
  final String? RegionName;

  NTWRKRegionsModel(
      this.id,
      this.RegionName,
      );

  factory NTWRKRegionsModel.fromJson(Map<String, dynamic> json) => _$NTWRKRegionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NTWRKRegionsModelToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class NTWRKCentersModel /*extends Equatable*/ {
  final int? id;
  final String? CenterName;
  final String? RegionId;

  NTWRKCentersModel(
      this.id,
      this.CenterName,
      this.RegionId,
      );

  factory NTWRKCentersModel.fromJson(Map<String, dynamic> json) => _$NTWRKCentersModelFromJson(json);

  Map<String, dynamic> toJson() => _$NTWRKCentersModelToJson(this);

/*@override
  List<Object> get props => [id];*/
}

@JsonSerializable()
class NTWRKReportCenterModel /*extends Equatable*/ {
  final int? id;
  final String? CenterName;
  final String? RegionId;

  NTWRKReportCenterModel(
      this.id,
      this.CenterName,
      this.RegionId,
      );

  factory NTWRKReportCenterModel.fromJson(Map<String, dynamic> json) => _$NTWRKReportCenterModelFromJson(json);

  Map<String, dynamic> toJson() => _$NTWRKReportCenterModelToJson(this);

/*@override
  List<Object> get props => [id];*/
}