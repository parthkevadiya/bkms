import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_kst_attendance_request_model.g.dart';

@JsonSerializable()
class ManageKSTAttendanceRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String kst_manage_report_id;
  final String edit_mode;
  final String selected_wing;
  final String selected_center;
  final String selected_region;
  final String search_user_id;
  final String group;
  final String subgroup;
  final String schoolyear;
  final String first_name;
  final String middle_name;
  final String last_name;
  final int page;
  final int limit;
  final String generic_search;

  ManageKSTAttendanceRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.user_role_type,
    this.bkms_id,
    this.kst_manage_report_id,
    this.edit_mode,
    this.selected_wing,
    this.selected_center,
    this.selected_region,
    this.search_user_id,
    this.group,
    this.subgroup,
    this.schoolyear,
    this.first_name,
    this.middle_name,
    this.last_name,
    this.page,
    this.limit,
    this.generic_search,
  );

  factory ManageKSTAttendanceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ManageKSTAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
