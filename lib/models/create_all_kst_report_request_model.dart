import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_all_kst_report_request_model.g.dart';

@JsonSerializable()
class CreateAllKSTReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String report_center;
  final String report_wing;
  final bool all_center_report;

  CreateAllKSTReportRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.report_center,
      this.report_wing,
      this.all_center_report,);

  factory CreateAllKSTReportRequestModel.fromJson(Map<String, dynamic> json) => _$CreateAllKSTReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAllKSTReportRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}