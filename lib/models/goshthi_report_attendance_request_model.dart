import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goshthi_report_attendance_request_model.g.dart';

@JsonSerializable()
class GoshthiReportAttendanceRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String karyakar_goshti_sabha_id;
  final String page;
  final String limit;
  final String search_name;
  final String wing_id;
  final String selected_center;
  final String selected_region;
  final String checkfilter;
  final String gender;

  GoshthiReportAttendanceRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.user_role_type,
    this.bkms_id,
    this.karyakar_goshti_sabha_id,
    this.page,
    this.limit,
    this.search_name,
    this.wing_id,
    this.selected_center,
    this.selected_region,
    this.checkfilter,
    this.gender,
  );

  factory GoshthiReportAttendanceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GoshthiReportAttendanceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiReportAttendanceRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
