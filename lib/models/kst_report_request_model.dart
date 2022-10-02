import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kst_report_request_model.g.dart';

@JsonSerializable()
class KSTReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final int is_filter;
  final String selected_wing;
  final String selected_center;
  final String selected_region;
  final String selected_year;
  final int page;
  final int limit;
  final String generic_search;

  KSTReportRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.is_filter,
      this.selected_wing,
      this.selected_center,
      this.selected_region,
      this.selected_year,
      this.page,
      this.limit,
      this.generic_search);

  factory KSTReportRequestModel.fromJson(Map<String, dynamic> json) => _$KSTReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$KSTReportRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
