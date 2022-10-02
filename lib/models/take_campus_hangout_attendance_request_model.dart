import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'take_campus_hangout_attendance_request_model.g.dart';

@JsonSerializable()
class TakeCampusHangoutAttendanceRequestModel /*extends Equatable*/ {
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
  final String campus_hangout_date;
  final String wing_id;

  TakeCampusHangoutAttendanceRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.sabha_id,
      this.user_id,
      this.status,
      this.user_group_name,
      this.user_wing_name,
      this.user_school_year_name,
      this.campus_hangout_date,
      this.wing_id);

  factory TakeCampusHangoutAttendanceRequestModel.fromJson(Map<String, dynamic> json) => _$TakeCampusHangoutAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TakeCampusHangoutAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}