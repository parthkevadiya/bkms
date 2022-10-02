import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kst_1On1_mentoring_list_request_model.g.dart';

@JsonSerializable()
class KST1On1MentoringListRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String kst_manage_report_id;
  final String search_record;
  final int page;
  final int limit;

  KST1On1MentoringListRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.kst_manage_report_id,
      this.search_record,
      this.page,
      this.limit);

  factory KST1On1MentoringListRequestModel.fromJson(Map<String, dynamic> json) => _$KST1On1MentoringListRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$KST1On1MentoringListRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}