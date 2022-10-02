import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_bst_report_request_model.g.dart';

@JsonSerializable()
class ManageBSTReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final int page;
  final int limit;
  final String bst_center_report_id;
  final String generic_search;

  ManageBSTReportRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.user_role_type,
    this.bkms_id,
    this.page,
    this.limit,
    this.bst_center_report_id,
    this.generic_search,
  );

  factory ManageBSTReportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ManageBSTReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTReportRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
