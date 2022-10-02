import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel /*extends Equatable*/ {
  int login_user_type;
  String login_parent_type;
  String access_token;
  final dynamic refresh_token;
  final String token_type;
  final int bkms_id;
  final String password;
  final String f_name;
  final String m_name;
  final String l_name;
  final String? email;
  final String? mobile_number;
  final String greeting_title;
  final String role;
  final String is_biomatric_login_enbabled;
  final dynamic is_profile;
  final dynamic is_report;
  final dynamic is_record;
  final dynamic is_notification;
  final String? fcm_token;
  final dynamic is_home = true;

  LoginModel(
      this.login_user_type,
      this.login_parent_type,
      this.access_token,
      this.refresh_token,
      this.token_type,
      this.bkms_id,
      this.password,
      this.f_name,
      this.m_name,
      this.l_name,
      this.email,
      this.mobile_number,
      this.greeting_title,
      this.role,
      this.is_biomatric_login_enbabled,
      this.is_profile,
      this.is_report,
      this.is_record,
      this.is_notification,
      this.fcm_token,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  /*@override
  List<Object> get props => [access_token];*/
}