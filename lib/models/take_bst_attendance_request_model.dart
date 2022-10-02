import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'take_bst_attendance_request_model.g.dart';

@JsonSerializable()
class TakeBSTAttendanceRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String bst_fallspring_report_id;
  final String user_id;
  final String user_group_name;
  final String user_wing_name;
  final String user_school_year_name;
  final String session_1_attendance_status;
  final String session_2_attendance_status;
  final String session_3_attendance_status;
  final String session_4_attendance_status;
  final String session_5_attendance_status;
  final String session_6_attendance_status;


  TakeBSTAttendanceRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.bst_fallspring_report_id,
      this.user_id,
      this.user_group_name,
      this.user_wing_name,
      this.user_school_year_name,
      this.session_1_attendance_status,
      this.session_2_attendance_status,
      this.session_3_attendance_status,
      this.session_4_attendance_status,
      this.session_5_attendance_status,
      this.session_6_attendance_status,
      );

  factory TakeBSTAttendanceRequestModel.fromJson(Map<String, dynamic> json) => _$TakeBSTAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TakeBSTAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}