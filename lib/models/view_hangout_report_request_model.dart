import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'view_hangout_report_request_model.g.dart';

@JsonSerializable()
class ViewHangoutReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String campus_report_id;
  final int page;
  final int limit;
  final String generic_search;

  ViewHangoutReportRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.user_role_type,
    this.bkms_id,
    this.campus_report_id,
    this.page,
    this.limit,
    this.generic_search,
  );

  factory ViewHangoutReportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ViewHangoutReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewHangoutReportRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
