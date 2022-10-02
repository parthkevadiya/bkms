import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_campus_hangout_attendance_request_model.g.dart';

@JsonSerializable()
class SubmitCampusHangoutAttendanceRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String campus_hangout_date;
  final String wing_id;
  final String campus_id;
  final String region_id;
  final String edit_mode;
  final String schoolyear;
  final String first_name;
  final String middle_name;
  final String last_name;
  final String user_id;

  SubmitCampusHangoutAttendanceRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.campus_hangout_date,
      this.wing_id,
      this.campus_id,
      this.region_id,
      this.edit_mode,
      this.schoolyear,
      this.first_name,
      this.middle_name,
      this.last_name,
      this.user_id);

  factory SubmitCampusHangoutAttendanceRequestModel.fromJson(Map<String, dynamic> json) => _$SubmitCampusHangoutAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitCampusHangoutAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}