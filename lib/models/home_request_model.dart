import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_request_model.g.dart';

@JsonSerializable()
class HomeRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;
  final String role;

  HomeRequestModel(
      this.login_user_type,
      this.login_parent_type,
    this.bkms_id,
    this.role,
  );

  factory HomeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HomeRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
