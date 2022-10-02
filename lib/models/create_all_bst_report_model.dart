import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_all_bst_report_model.g.dart';

@JsonSerializable()
class CreateAllBSTReportModel /*extends Equatable*/ {
  final bool? has_error;

  CreateAllBSTReportModel(this.has_error,);

  factory CreateAllBSTReportModel.fromJson(Map<String, dynamic> json) => _$CreateAllBSTReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAllBSTReportModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
