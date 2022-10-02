import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campus_hangout_report_details_model.g.dart';

@JsonSerializable()
class CampusHangoutReportDetailsModel /*extends Equatable*/ {
  final bool? has_error;
  final String? user_role_type;
  final String? campus_report_id;
  final String? campus_hangout_report_id;
  final VCampusHangoutReportModel? campus_hangout_report;
  final VHangoutQuestionModel? hangout_question;
  final List<VSchoolListModel?>? school_list;
  final List<VAttendanceListModel?>? attendance_list;

  CampusHangoutReportDetailsModel(this.has_error, this.user_role_type,
      this.campus_report_id, this.campus_hangout_report_id,
      this.campus_hangout_report, this.hangout_question, this.school_list,
      this.attendance_list);

  factory CampusHangoutReportDetailsModel.fromJson(Map<String, dynamic> json) => _$CampusHangoutReportDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampusHangoutReportDetailsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class VCampusHangoutReportModel {
  final String? id;
  final String? campus_report_id;
  final String? campus_hangout_date;
  final String? region_id;
  final String? center_id;
  final String? campus_id;
  final String? elligible_user_id;
  final String? wing_id;
  final String? report_type;
  final String? fall_year;
  final String? spring_year;
  final String? created_date;
  final String? created_by;
  final dynamic updated_date;
  final dynamic total_eligible_users;

  VCampusHangoutReportModel(
      this.id,
      this.campus_report_id,
      this.campus_hangout_date,
      this.region_id,
      this.center_id,
      this.campus_id,
      this.elligible_user_id,
      this.wing_id,
      this.report_type,
      this.fall_year,
      this.spring_year,
      this.created_date,
      this.created_by,
      this.updated_date,
      this.total_eligible_users);

  factory VCampusHangoutReportModel.fromJson(Map<String, dynamic> json) => _$VCampusHangoutReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$VCampusHangoutReportModelToJson(this);
}

@JsonSerializable()
class VHangoutQuestionModel {
  final List<VFormFieldsModel?>? form_fields;

  VHangoutQuestionModel(
      this.form_fields,
      );

  factory VHangoutQuestionModel.fromJson(Map<String, dynamic> json) => _$VHangoutQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$VHangoutQuestionModelToJson(this);
}

@JsonSerializable()
class VFormFieldsModel {
  final String? label;
  final List<VFieldsModel?>? fields;

  VFormFieldsModel(
      this.label,
      this.fields,
      );

  factory VFormFieldsModel.fromJson(Map<String, dynamic> json) => _$VFormFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VFormFieldsModelToJson(this);
}

@JsonSerializable()
class VFieldsModel {
  final String? label;
  final String? type;
  final String? name;
  final String? placeholder;
  final String? validation_message;
  String? value;
  String? help_text;
  String? selected;
  final bool? is_required;
  final bool? is_readonly;
  final List<VOptionsItems?>? options;

  VFieldsModel(
      this.label,
      this.type,
      this.name,
      this.placeholder,
      this.validation_message,
      this.value,
      this.help_text,
      this.selected,
      this.is_required,
      this.is_readonly,
      this.options);

  factory VFieldsModel.fromJson(Map<String, dynamic> json) => _$VFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VFieldsModelToJson(this);
}

@JsonSerializable()
class VOptionsItems /*extends Equatable*/ {
  final dynamic id;
  final String? value;
  final dynamic header;
  bool? isSelected = false;

  VOptionsItems(
      this.id, this.value, this.header
      );

  factory VOptionsItems.fromJson(Map<String, dynamic> json) => _$VOptionsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$VOptionsItemsToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class VSchoolListModel /*extends Equatable*/ {
  final dynamic id;
  final String? school_display_name;
  final String? school_value;

  VSchoolListModel(this.id, this.school_display_name, this.school_value);

  factory VSchoolListModel.fromJson(Map<String, dynamic> json) => _$VSchoolListModelFromJson(json);

  Map<String, dynamic> toJson() => _$VSchoolListModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class VAttendanceListModel /*extends Equatable*/ {
  final String? user_id;
  final String? name;
  final String? grade;
  final String? email;
  final String? RegionName;
  final String? CenterName;
  final String? campus_name;
  final String? group_name;
  final String? status;

  VAttendanceListModel(
      this.user_id,
      this.name,
      this.grade,
      this.email,
      this.RegionName,
      this.CenterName,
      this.campus_name,
      this.group_name,
      this.status);

  factory VAttendanceListModel.fromJson(Map<String, dynamic> json) => _$VAttendanceListModelFromJson(json);

  Map<String, dynamic> toJson() => _$VAttendanceListModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}