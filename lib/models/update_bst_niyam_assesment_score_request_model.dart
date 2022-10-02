import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_bst_niyam_assesment_score_request_model.g.dart';

@JsonSerializable()
class UpdateBSTNiyamAssesmentScoreRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String bst_center_report_id;
  final String user_id;
  final String user_group_name;
  final String user_wing_name;
  final String user_school_year_name;
  final String begin_score;
  final String final_score;

  UpdateBSTNiyamAssesmentScoreRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.bst_center_report_id,
      this.user_id,
      this.user_group_name,
      this.user_wing_name,
      this.user_school_year_name,
      this.begin_score,
      this.final_score);

  factory UpdateBSTNiyamAssesmentScoreRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateBSTNiyamAssesmentScoreRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBSTNiyamAssesmentScoreRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}