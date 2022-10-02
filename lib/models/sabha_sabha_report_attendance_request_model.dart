import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sabha_sabha_report_attendance_request_model.g.dart';

@JsonSerializable()
class SubmitSabhaReportAttendanceRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String sabha_id;
  final String user_id;
  final String status;
  final String user_group_name;
  final String user_wing_name;
  final String user_school_year_name;

  SubmitSabhaReportAttendanceRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.sabha_id,
      this.user_id,
      this.status,
      this.user_group_name,
      this.user_wing_name,
      this.user_school_year_name);

  factory SubmitSabhaReportAttendanceRequestModel.fromJson(Map<String, dynamic> json) => _$SubmitSabhaReportAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSabhaReportAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}