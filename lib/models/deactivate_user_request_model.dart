import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deactivate_user_request_model.g.dart';

@JsonSerializable()
class DeactivateUserRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final int bkms_id;
  final String record_id;

  DeactivateUserRequestModel(
    this.login_user_type,
    this.login_parent_type,
    this.bkms_id,
    this.record_id,
  );

  factory DeactivateUserRequestModel.fromJson(Map<String, dynamic> json) => _$DeactivateUserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeactivateUserRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
