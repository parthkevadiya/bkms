import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campus_wise_hangout_types_request_model.g.dart';

@JsonSerializable()
class CampusWiseHangoutTypesRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String campus_id;

  CampusWiseHangoutTypesRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.campus_id,
      );

  factory CampusWiseHangoutTypesRequestModel.fromJson(Map<String, dynamic> json) => _$CampusWiseHangoutTypesRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusWiseHangoutTypesRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}