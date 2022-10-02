import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'view_hangout_report_model.g.dart';

@JsonSerializable()
class ViewHangoutReportModel /*extends Equatable*/ {
  final bool? has_error;
  final ViewHangoutResultModel? hangout_result;

  ViewHangoutReportModel(this.has_error, this.hangout_result);

  factory ViewHangoutReportModel.fromJson(Map<String, dynamic> json) => _$ViewHangoutReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewHangoutReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ViewHangoutResultModel /*extends Equatable*/ {
  final int? total;
  final List<ViewHangoutDataModel?>? data;

  ViewHangoutResultModel(this.total, this.data);

  factory ViewHangoutResultModel.fromJson(Map<String, dynamic> json) => _$ViewHangoutResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewHangoutResultModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ViewHangoutDataModel /*extends Equatable*/ {
  final String? id;
  final String? report_type;
  final String? report_year;
  final String? wing_id;
  final String? campus_hangout_date_updated;
  final String? name;
  final String? reportdate;
  final String? total_students;
  final String? total_attendees;

  ViewHangoutDataModel(
      this.id,
      this.report_type,
      this.report_year,
      this.wing_id,
      this.campus_hangout_date_updated,
      this.name,
      this.reportdate,
      this.total_students,
      this.total_attendees);

  factory ViewHangoutDataModel.fromJson(Map<String, dynamic> json) => _$ViewHangoutDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewHangoutDataModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}