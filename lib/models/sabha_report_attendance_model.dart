import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sabha_report_attendance_model.g.dart';

@JsonSerializable()
class SabhaReportAttendanceModel /*extends Equatable*/ {
  final bool? has_error;
  final AttendanceResultModel? attendance_result;

  SabhaReportAttendanceModel(this.has_error, this.attendance_result);

  factory SabhaReportAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$SabhaReportAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SabhaReportAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class AttendanceResultModel {
  final int? current_page;
  final int? from;
  final int? to;
  final int? last_page;
  final int? total;
  final int? per_page;
  final List<DataModel?>? data;

  AttendanceResultModel(this.current_page, this.from, this.to, this.last_page,
      this.total, this.per_page, this.data);

  factory AttendanceResultModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResultModelToJson(this);
}

@JsonSerializable()
class DataModel {
  final String user_id;
  final String? name;
  final String? email;
  final String? personalWing;
  final String? wing_name;
  final String? group_name;
  final String? status;
  final String? sabha_user_status;
  final String? user_group_name;
  final String? school_display_name;
  final String? user_school_year_name;
  String? is_present;
  final String? row_num;

  DataModel(
      this.user_id,
      this.name,
      this.email,
      this.personalWing,
      this.wing_name,
      this.group_name,
      this.status,
      this.sabha_user_status,
      this.user_group_name,
      this.school_display_name,
      this.user_school_year_name,
      this.is_present,
      this.row_num);

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
