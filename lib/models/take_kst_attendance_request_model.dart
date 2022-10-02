import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'take_kst_attendance_request_model.g.dart';

@JsonSerializable()
class TakeKSTAttendanceRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String kst_manage_report_id;
  final String list_user_id;
  final String list_user_group_name;
  final String list_user_wing_name;
  final String list_user_school_year_name;
  final String session_1_attendance_status;
  final String session_2_attendance_status;
  final String session_3_attendance_status;
  final String session_4_attendance_status;
  final String session_5_attendance_status;
  final String session_6_attendance_status;

  TakeKSTAttendanceRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.kst_manage_report_id,
      this.list_user_id,
      this.list_user_group_name,
      this.list_user_wing_name,
      this.list_user_school_year_name,
      this.session_1_attendance_status,
      this.session_2_attendance_status,
      this.session_3_attendance_status,
      this.session_4_attendance_status,
      this.session_5_attendance_status,
      this.session_6_attendance_status,
      );

  factory TakeKSTAttendanceRequestModel.fromJson(Map<String, dynamic> json) => _$TakeKSTAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TakeKSTAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}