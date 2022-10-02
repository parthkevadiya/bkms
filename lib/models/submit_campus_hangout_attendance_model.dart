import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_campus_hangout_attendance_model.g.dart';

@JsonSerializable()
class SubmitCampusHangoutAttendanceModel /*extends Equatable*/ {
  final bool? has_error;
  final String? campus_sabha_id;
  final List<SCHSchoolListModel?>? school_list;
  final List<SCHAttendanceListModel?>? attendance_list;

  SubmitCampusHangoutAttendanceModel(this.has_error, this.campus_sabha_id, this.school_list, this.attendance_list);

  factory SubmitCampusHangoutAttendanceModel.fromJson(Map<String, dynamic> json) => _$SubmitCampusHangoutAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitCampusHangoutAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class SCHSchoolListModel {
  final dynamic id;
  final String? school_display_name;
  final String? school_value;

  SCHSchoolListModel(this.id, this.school_display_name,this.school_value,);

  factory SCHSchoolListModel.fromJson(Map<String, dynamic> json) => _$SCHSchoolListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SCHSchoolListModelToJson(this);
}

@JsonSerializable()
class SCHAttendanceListModel {
  final String? user_id;
  final String? FirstName;
  final String? MiddleName;
  final String? LastName;
  final String? email;
  final String? PrimarySevaWing;
  final String? personalWing;
  final String? CenterName;
  final String? campus_name;
  final String? RegionName;
  final String? group_name;
  final String? grade;
  String? status;

  SCHAttendanceListModel(
      this.user_id,
      this.FirstName,
      this.MiddleName,
      this.LastName,
      this.email,
      this.PrimarySevaWing,
      this.personalWing,
      this.CenterName,
      this.campus_name,
      this.RegionName,
      this.group_name,
      this.grade,
      this.status);

  factory SCHAttendanceListModel.fromJson(Map<String, dynamic> json) => _$SCHAttendanceListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SCHAttendanceListModelToJson(this);
}