import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campus_hangout_details_request_model.g.dart';

@JsonSerializable()
class CampusHangoutReportDetailsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String campus_report_id;
  final String campus_hangout_report_id;
  final String user_id;
  final String first_name;
  final String middle_name;
  final String last_name;
  final String schoolyear;

  CampusHangoutReportDetailsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.campus_report_id,
      this.campus_hangout_report_id,
      this.user_id,
      this.first_name,
      this.middle_name,
      this.last_name,
      this.schoolyear);

  factory CampusHangoutReportDetailsRequestModel.fromJson(Map<String, dynamic> json) => _$CampusHangoutReportDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutReportDetailsRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}