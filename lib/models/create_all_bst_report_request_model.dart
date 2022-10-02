import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_all_bst_report_request_model.g.dart';

@JsonSerializable()
class CreateAllBSTReportRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;

  CreateAllBSTReportRequestModel(this.login_user_type, this.login_parent_type,
      this.user_role_type, this.bkms_id);

  factory CreateAllBSTReportRequestModel.fromJson(Map<String, dynamic> json) => _$CreateAllBSTReportRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAllBSTReportRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}