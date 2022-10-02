import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_center_bst_report_request_model.g.dart';

@JsonSerializable()
class CreateCenterBSTReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String report_center;
  final String report_wing;

  CreateCenterBSTReportRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.report_center,
      this.report_wing);

  factory CreateCenterBSTReportRequestModel.fromJson(Map<String, dynamic> json) => _$CreateCenterBSTReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCenterBSTReportRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}