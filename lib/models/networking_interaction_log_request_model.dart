import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'networking_interaction_log_request_model.g.dart';

@JsonSerializable()
class NetworkingInteractionLogRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String interect_center_record_id;
  final String interect_user_id;
  final String page;
  final String limit;

  NetworkingInteractionLogRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.interect_center_record_id,
      this.interect_user_id,
      this.page,
      this.limit);

  factory NetworkingInteractionLogRequestModel.fromJson(Map<String, dynamic> json) => _$NetworkingInteractionLogRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingInteractionLogRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}