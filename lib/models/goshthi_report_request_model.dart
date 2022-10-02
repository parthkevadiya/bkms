import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goshthi_report_request_model.g.dart';

@JsonSerializable()
class GoshthiReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String selected_center;
  final String selected_region;
  final String sabha_month;
  final String sabha_year;
  final String sabha_gender;
  final int page;
  final int limit;
  final String generic_search;

  GoshthiReportRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.selected_center,
      this.selected_region,
      this.sabha_month,
      this.sabha_year,
      this.sabha_gender,
      this.page,
      this.limit,
      this.generic_search);

  factory GoshthiReportRequestModel.fromJson(Map<String, dynamic> json) => _$GoshthiReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoshthiReportRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
