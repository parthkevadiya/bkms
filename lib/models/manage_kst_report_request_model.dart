import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_kst_report_request_model.g.dart';

@JsonSerializable()
class ManageKSTReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final int page;
  final int limit;
  final String kst_report_id;
  final String generic_search;

  ManageKSTReportRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.user_role_type,
    this.bkms_id,
    this.page,
    this.limit,
    this.kst_report_id,
    this.generic_search,
  );

  factory ManageKSTReportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ManageKSTReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTReportRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
