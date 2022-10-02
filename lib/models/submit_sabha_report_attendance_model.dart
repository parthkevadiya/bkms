import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_sabha_report_attendance_model.g.dart';

@JsonSerializable()
class SubmitSabhaReportAttendanceModel /*extends Equatable*/ {
  final bool? has_error;

  SubmitSabhaReportAttendanceModel(this.has_error);

  factory SubmitSabhaReportAttendanceModel.fromJson(Map<String, dynamic> json) => _$SubmitSabhaReportAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSabhaReportAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}