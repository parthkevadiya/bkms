import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goshthi_report_attendance_model.g.dart';

@JsonSerializable()
class GoshthiReportAttendanceModel /*extends Equatable*/ {
  final bool? has_error;
  final AttendanceResultModel? attendance_result;
  final GoshthiFiltersDataModel? filter_data;

  GoshthiReportAttendanceModel(this.has_error, this.attendance_result, this.filter_data);

  factory GoshthiReportAttendanceModel.fromJson(Map<String, dynamic> json) => _$GoshthiReportAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiReportAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class GoshthiFiltersDataModel {
  final String? karyakar_goshti_sabha_id;
  final String? date;
  final String? myregion;
  final String? mycenter;
  final String? Gender;
  final String? goshthi_month;
  final int? is_adminuser;
  final List<GoshthiRegionsModel?>? regions;
  final List<GoshthiCentersModel?>? centers;
  final List<GoshthiGoshthiWingModel?>? goshthi_wing;

  GoshthiFiltersDataModel(
      this.karyakar_goshti_sabha_id,
      this.date,
      this.myregion,
      this.mycenter,
      this.Gender,
      this.goshthi_month,
      this.is_adminuser,
      this.regions,
      this.centers,
      this.goshthi_wing);

  factory GoshthiFiltersDataModel.fromJson(Map<String, dynamic> json) => _$GoshthiFiltersDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiFiltersDataModelToJson(this);
}

@JsonSerializable()
class GoshthiRegionsModel {
  final String? id;
  final String? RegionName;
  final String? country_id;

  GoshthiRegionsModel(
      this.id,
      this.RegionName,
      this.country_id,);

  factory GoshthiRegionsModel.fromJson(Map<String, dynamic> json) => _$GoshthiRegionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiRegionsModelToJson(this);
}

@JsonSerializable()
class GoshthiCentersModel {
  final String? id;
  final String? CenterName;
  final String? RegionId;

  GoshthiCentersModel(
      this.id,
      this.CenterName,
      this.RegionId,);

  factory GoshthiCentersModel.fromJson(Map<String, dynamic> json) => _$GoshthiCentersModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiCentersModelToJson(this);
}

@JsonSerializable()
class GoshthiGoshthiWingModel {
  final String? id;
  final String? wingName;

  GoshthiGoshthiWingModel(
      this.id,
      this.wingName);

  factory GoshthiGoshthiWingModel.fromJson(Map<String, dynamic> json) => _$GoshthiGoshthiWingModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiGoshthiWingModelToJson(this);
}

@JsonSerializable()
class AttendanceResultModel {
  final int? current_page;
  final int? from;
  final int? to;
  final int? last_page;
  final int? total;
  final String? per_page;
  final List<GoshthiAttendanceDataModel?>? data;

  AttendanceResultModel(this.current_page, this.from, this.to, this.last_page, this.total, this.per_page, this.data);

  factory AttendanceResultModel.fromJson(Map<String, dynamic> json) => _$AttendanceResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResultModelToJson(this);
}

@JsonSerializable()
class GoshthiAttendanceDataModel {
  final String id;
  final String? FirstName;
  final String? MiddleName;
  final String? LastName;
  final String? email;
  final String? Gender;
  final String? region_id;
  final String? State;
  final String? center_id;
  final String? RegionName;
  final String? CenterName;
  final String? state_name;
  final String? Primarysevawing;
  final String? Primaryseva;
  final String? Secondarysevawing;
  final String? Secondaryseva;
  String? status;

  GoshthiAttendanceDataModel(
      this.id,
      this.FirstName,
      this.MiddleName,
      this.LastName,
      this.email,
      this.Gender,
      this.region_id,
      this.State,
      this.center_id,
      this.RegionName,
      this.CenterName,
      this.state_name,
      this.Primarysevawing,
      this.Primaryseva,
      this.Secondarysevawing,
      this.Secondaryseva,
      this.status,);

  factory GoshthiAttendanceDataModel.fromJson(Map<String, dynamic> json) => _$GoshthiAttendanceDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiAttendanceDataModelToJson(this);
}