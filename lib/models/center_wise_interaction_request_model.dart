import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'center_wise_interaction_request_model.g.dart';

@JsonSerializable()
class CenterWiseInteractionRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String center_id;

  CenterWiseInteractionRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.center_id,
      );

  factory CenterWiseInteractionRequestModel.fromJson(Map<String, dynamic> json) => _$CenterWiseInteractionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CenterWiseInteractionRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}