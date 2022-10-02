import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_center_bst_report_model.g.dart';

@JsonSerializable()
class CreateCenterBSTReportModel /*extends Equatable*/ {
  final bool? has_error;

  CreateCenterBSTReportModel(this.has_error,);

  factory CreateCenterBSTReportModel.fromJson(Map<String, dynamic> json) => _$CreateCenterBSTReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCenterBSTReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
