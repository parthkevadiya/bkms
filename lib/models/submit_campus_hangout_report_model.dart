import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_campus_hangout_report_model.g.dart';

@JsonSerializable()
class SubmitCampusHangoutReportModel /*extends Equatable*/ {
  final bool? has_error;

  SubmitCampusHangoutReportModel(this.has_error,);

  factory SubmitCampusHangoutReportModel.fromJson(Map<String, dynamic> json) => _$SubmitCampusHangoutReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitCampusHangoutReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}