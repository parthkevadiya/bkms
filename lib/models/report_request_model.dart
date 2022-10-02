import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_request_model.g.dart';

@JsonSerializable()
class ReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final int is_filter;
  final String selected_region;
  final String selected_center;
  final String selected_wing;
  final String sabha_year;
  final String sabha_week;
  final String report_status;
  final int page;
  final int limit;
  final String generic_search;

  ReportRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.is_filter,
      this.selected_region,
      this.selected_center,
      this.selected_wing,
      this.sabha_year,
      this.sabha_week,
      this.report_status,
      this.page,
      this.limit,
      this.generic_search);

  factory ReportRequestModel.fromJson(Map<String, dynamic> json) => _$ReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
