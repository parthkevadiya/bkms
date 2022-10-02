import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campus_hangout_region_request_model.g.dart';

@JsonSerializable()
class CampusHangoutRegionRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;

  CampusHangoutRegionRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      );

  factory CampusHangoutRegionRequestModel.fromJson(Map<String, dynamic> json) => _$CampusHangoutRegionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutRegionRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}