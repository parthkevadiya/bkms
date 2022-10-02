import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region_wise_campus_request_model.g.dart';

@JsonSerializable()
class RegionWiseCampusRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String region_id;

  RegionWiseCampusRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.region_id,
      );

  factory RegionWiseCampusRequestModel.fromJson(Map<String, dynamic> json) => _$RegionWiseCampusRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionWiseCampusRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}