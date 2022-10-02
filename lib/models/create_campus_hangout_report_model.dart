import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_campus_hangout_report_model.g.dart';

@JsonSerializable()
class CreateCampusHangoutReportModel /*extends Equatable*/ {
  final bool? has_error;

  CreateCampusHangoutReportModel(this.has_error,);

  factory CreateCampusHangoutReportModel.fromJson(Map<String, dynamic> json) => _$CreateCampusHangoutReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCampusHangoutReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
