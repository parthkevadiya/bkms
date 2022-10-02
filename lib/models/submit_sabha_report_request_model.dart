import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_sabha_report_request_model.g.dart';

@JsonSerializable()
class SubmitSabhaReportQuestionsRequestModel{
  String name;
  String? strValue;
  int? intValue;

  SubmitSabhaReportQuestionsRequestModel(
      this.name,
      this.strValue,
      this.intValue,
      );

  factory SubmitSabhaReportQuestionsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitSabhaReportQuestionsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSabhaReportQuestionsRequestModelToJson(this);
}