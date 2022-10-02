import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_bst_niyam_assesment_request_model.g.dart';

@JsonSerializable()
class ManageBSTNiyamAssesmentRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String bst_center_report_id;
  final String edit_mode;
  final String selected_wing;
  final String selected_region;
  final String selected_center;
  final String search_user_id;
  final String group;
  final String subgroup;
  final String schoolyear;
  final String first_name;
  final String middle_name;
  final String last_name;
  final int page;
  final int limit;
  final String generic_search;

  ManageBSTNiyamAssesmentRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.user_role_type,
    this.bkms_id,
    this.bst_center_report_id,
    this.edit_mode,
    this.selected_wing,
    this.selected_region,
    this.selected_center,
    this.search_user_id,
    this.group,
    this.subgroup,
    this.schoolyear,
    this.first_name,
    this.middle_name,
    this.last_name,
    this.page,
    this.limit,
    this.generic_search,
  );

  factory ManageBSTNiyamAssesmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ManageBSTNiyamAssesmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTNiyamAssesmentRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
