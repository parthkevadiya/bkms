import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_goshthi_report_attendance_request_model.g.dart';

@JsonSerializable()
class SubmitGoshthiReportAttendanceRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String sabha_id;
  final String user_id;
  final String status;

  SubmitGoshthiReportAttendanceRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.sabha_id,
      this.user_id,
      this.status,
      );

  factory SubmitGoshthiReportAttendanceRequestModel.fromJson(Map<String, dynamic> json) => _$SubmitGoshthiReportAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitGoshthiReportAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}