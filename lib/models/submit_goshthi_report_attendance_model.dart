import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_goshthi_report_attendance_model.g.dart';

@JsonSerializable()
class SubmitGoshthiReportAttendanceModel /*extends Equatable*/ {
  final bool? has_error;

  SubmitGoshthiReportAttendanceModel(this.has_error);

  factory SubmitGoshthiReportAttendanceModel.fromJson(Map<String, dynamic> json) => _$SubmitGoshthiReportAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitGoshthiReportAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}