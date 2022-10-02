import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'education_mentoring_interaction_details_request_model.g.dart';

@JsonSerializable()
class EducationMentoringInteractionDetailsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String kst_manage_report_id;
  final String is_view_mode;
  final String kst_education_mentoring_id;

  EducationMentoringInteractionDetailsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.kst_manage_report_id,
      this.is_view_mode,
      this.kst_education_mentoring_id,
      );

  factory EducationMentoringInteractionDetailsRequestModel.fromJson(Map<String, dynamic> json) => _$EducationMentoringInteractionDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationMentoringInteractionDetailsRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}