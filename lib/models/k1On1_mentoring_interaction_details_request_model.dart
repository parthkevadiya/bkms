import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'k1On1_mentoring_interaction_details_request_model.g.dart';

@JsonSerializable()
class K1On1MentoringInteractionDetailsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String kst_manage_report_id;
  final String is_view_mode;
  final String kst_1on1_mentoring_id;

  K1On1MentoringInteractionDetailsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.kst_manage_report_id,
      this.is_view_mode,
      this.kst_1on1_mentoring_id,
      );

  factory K1On1MentoringInteractionDetailsRequestModel.fromJson(Map<String, dynamic> json) => _$K1On1MentoringInteractionDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$K1On1MentoringInteractionDetailsRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}