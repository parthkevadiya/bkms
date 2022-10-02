import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_all_kst_report_model.g.dart';

@JsonSerializable()
class CreateAllKSTReportModel /*extends Equatable*/ {
  final bool? has_error;

  CreateAllKSTReportModel(this.has_error,);

  factory CreateAllKSTReportModel.fromJson(Map<String, dynamic> json) => _$CreateAllKSTReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAllKSTReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
