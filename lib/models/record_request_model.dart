import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'record_request_model.g.dart';

@JsonSerializable()
class RecordRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;
  final String name;
  final String gender;
  final String wing;
  final String school_year;
  final String center;
  final String region;
  final String user_group;
  final String fname;
  final String mname;
  final String lname;
  final String user_id;
  final String email;
  final int page;
  final int limit;
  final bool is_export;

  RecordRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.bkms_id,
      this.name,
      this.gender,
      this.wing,
      this.school_year,
      this.center,
      this.region,
      this.user_group,
      this.fname,
      this.mname,
      this.lname,
      this.user_id,
      this.email,
      this.page,
      this.limit,
      this.is_export);

  factory RecordRequestModel.fromJson(Map<String, dynamic> json) => _$RecordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecordRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
