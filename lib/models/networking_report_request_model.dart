import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'networking_report_request_model.g.dart';

@JsonSerializable()
class NetworkingReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String selected_region;
  final String selected_center;
  final String reporting_year;
  final int page;
  final int limit;
  final String generic_search;

  NetworkingReportRequestModel(this.login_user_type, this.login_parent_type, this.user_role_type, this.bkms_id,
      this.selected_region, this.selected_center, this.reporting_year, this.page, this.limit, this.generic_search);

  factory NetworkingReportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkingReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingReportRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
