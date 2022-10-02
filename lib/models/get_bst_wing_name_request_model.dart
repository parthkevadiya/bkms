import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_bst_wing_name_request_model.g.dart';

@JsonSerializable()
class GetBSTWingNameRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String center_id;
  final String wing_name;

  GetBSTWingNameRequestModel(this.login_user_type, this.login_parent_type,
      this.user_role_type, this.bkms_id, this.center_id, this.wing_name);

  factory GetBSTWingNameRequestModel.fromJson(Map<String, dynamic> json) => _$GetBSTWingNameRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetBSTWingNameRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}