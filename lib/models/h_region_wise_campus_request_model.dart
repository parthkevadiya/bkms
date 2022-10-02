import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'h_region_wise_campus_request_model.g.dart';

@JsonSerializable()
class HRegionWiseCampusRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String region_id;

  HRegionWiseCampusRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.region_id,
      );

  factory HRegionWiseCampusRequestModel.fromJson(Map<String, dynamic> json) => _$HRegionWiseCampusRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$HRegionWiseCampusRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}