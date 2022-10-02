import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campus_hangout_request_model.g.dart';

@JsonSerializable()
class CampusHangoutRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String selected_wing;
  final String selected_campus;
  final String selected_region;
  final String sabha_year;
  final int page;
  final int limit;
  final String generic_search;

  CampusHangoutRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.selected_wing,
      this.selected_campus,
      this.selected_region,
      this.sabha_year,
      this.page,
      this.limit,
      this.generic_search);

  factory CampusHangoutRequestModel.fromJson(Map<String, dynamic> json) => _$CampusHangoutRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
