import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_group_wise_sub_group_request_model.g.dart';

@JsonSerializable()
class UserGroupWiseSubGroupRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String center_id;
  final String personal_wing_name;
  final String group_name;

  UserGroupWiseSubGroupRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.center_id,
      this.personal_wing_name,
      this.group_name,
      );

  factory UserGroupWiseSubGroupRequestModel.fromJson(Map<String, dynamic> json) => _$UserGroupWiseSubGroupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserGroupWiseSubGroupRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}