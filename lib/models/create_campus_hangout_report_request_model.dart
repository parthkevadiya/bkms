import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_campus_hangout_report_request_model.g.dart';

@JsonSerializable()
class CreateCampusHangoutReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String report_region;
  final String report_campus;
  final String report_wing;

  CreateCampusHangoutReportRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.report_region,
      this.report_campus,
      this.report_wing,
      );

  factory CreateCampusHangoutReportRequestModel.fromJson(Map<String, dynamic> json) => _$CreateCampusHangoutReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCampusHangoutReportRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}