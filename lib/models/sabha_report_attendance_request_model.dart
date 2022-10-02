import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sabha_report_attendance_request_model.g.dart';

@JsonSerializable()
class SabhaReportAttendanceRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String sabha_id;
  final int page;
  final int limit;
  final String search_name;
  final String selected_wing;
  final String selected_center;
  final String selected_region;
  final String edit_mode;

  SabhaReportAttendanceRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.sabha_id,
      this.page,
      this.limit,
      this.search_name,
      this.selected_wing,
      this.selected_center,
      this.selected_region,
      this.edit_mode);

  factory SabhaReportAttendanceRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$SabhaReportAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SabhaReportAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
