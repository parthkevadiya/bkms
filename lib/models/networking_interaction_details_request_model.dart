import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'networking_interaction_details_request_model.g.dart';

@JsonSerializable()
class NetworkingInteractionDetailsRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String interect_center_record_id;
  final String interect_user_id;
  final String interaction_id;

  NetworkingInteractionDetailsRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.interect_center_record_id,
      this.interect_user_id,
      this.interaction_id,);

  factory NetworkingInteractionDetailsRequestModel.fromJson(Map<String, dynamic> json) => _$NetworkingInteractionDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingInteractionDetailsRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}