import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'view_networking_report_list_request_model.g.dart';

@JsonSerializable()
class ViewNetworkingReportListRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String reporting_record_id;
  final String page;
  final String limit;

  ViewNetworkingReportListRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.reporting_record_id,
      this.page,
      this.limit);

  factory ViewNetworkingReportListRequestModel.fromJson(Map<String, dynamic> json) => _$ViewNetworkingReportListRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewNetworkingReportListRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}