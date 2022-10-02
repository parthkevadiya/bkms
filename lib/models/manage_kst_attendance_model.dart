import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_kst_attendance_model.g.dart';

@JsonSerializable()
class ManageKSTAttendanceModel /*extends Equatable*/ {
  final bool? has_error;
  final ManageKSTAttendanceListModel? kst_attendance_result;
  final ManageAttendanceSearchFilterModel? kst_attendance_filter;

  ManageKSTAttendanceModel(this.has_error, this.kst_attendance_result, this.kst_attendance_filter);

  factory ManageKSTAttendanceModel.fromJson(Map<String, dynamic> json) => _$ManageKSTAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ManageKSTAttendanceListModel {
  final List<ManageKSTAttendanceListDataModel?>? data;
  final int? total;

  ManageKSTAttendanceListModel(this.data, this.total,);

  factory ManageKSTAttendanceListModel.fromJson(Map<String, dynamic> json) => _$ManageKSTAttendanceListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTAttendanceListModelToJson(this);
}

@JsonSerializable()
class ManageKSTAttendanceListDataModel {
  final String? user_id;
  final String? FirstName;
  final String? MiddleName;
  final String? LastName;
  final String? full_name;
  final String? email;
  final String? PrimarySevaWing;
  final String? personalWing;
  final String? wing_name;
  final String? CenterName;
  final String? RegionName;
  final String? group_name;
  final String? user_group_name;
  final String? school_display_name;
  final String? user_school_year_name;
  final String? grade;
  final List<MKSTADynamicFieldModel?>? dynamic_field;
  bool? isExpand;

  ManageKSTAttendanceListDataModel(
      this.user_id,
      this.FirstName,
      this.MiddleName,
      this.LastName,
      this.full_name,
      this.email,
      this.PrimarySevaWing,
      this.personalWing,
      this.wing_name,
      this.CenterName,
      this.RegionName,
      this.group_name,
      this.user_group_name,
      this.school_display_name,
      this.user_school_year_name,
      this.grade,
      this.dynamic_field,
      );

  factory ManageKSTAttendanceListDataModel.fromJson(Map<String, dynamic> json) => _$ManageKSTAttendanceListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTAttendanceListDataModelToJson(this);
}

@JsonSerializable()
class MKSTADynamicFieldModel {
  final String? name;
  final String? label;
  String? selected;
  final List<MKSTADOptionsModel?>? options;

  MKSTADynamicFieldModel(this.name, this.label, this.selected, this.options);

  factory MKSTADynamicFieldModel.fromJson(Map<String, dynamic> json) => _$MKSTADynamicFieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTADynamicFieldModelToJson(this);
}

@JsonSerializable()
class MKSTADOptionsModel {
  final String? id;
  final String? value;

  MKSTADOptionsModel(this.id, this.value);

  factory MKSTADOptionsModel.fromJson(Map<String, dynamic> json) => _$MKSTADOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTADOptionsModelToJson(this);
}

@JsonSerializable()
class ManageAttendanceSearchFilterModel {
  final List<MKSTARegionsModel?>? regions;
  final List<MKSTAWingsModel?>? wings;
  final List<MKSTACentersModel?>? centers;
  final List<MKSTASchoolListModel?>? school_list;
  final List<MKSTAGroupListModel?>? grouplist;
  final KSTFallSpringReportDataModel? kst_manage_report_data;

  ManageAttendanceSearchFilterModel(
      this.regions,
      this.wings,
      this.centers,
      this.school_list,
      this.grouplist,
      this.kst_manage_report_data);

  factory ManageAttendanceSearchFilterModel.fromJson(Map<String, dynamic> json) => _$ManageAttendanceSearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageAttendanceSearchFilterModelToJson(this);
}

@JsonSerializable()
class MKSTAGroupListModel {
  final dynamic id;
  final String? group_name;
  final String? wingName;

  MKSTAGroupListModel(
      this.id,
      this.group_name,
      this.wingName,
     );

  factory MKSTAGroupListModel.fromJson(Map<String, dynamic> json) => _$MKSTAGroupListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTAGroupListModelToJson(this);
}

@JsonSerializable()
class MKSTASchoolListModel {
  final dynamic id;
  final String? school_display_name;
  final String? school_value;

  MKSTASchoolListModel(
      this.id,
      this.school_display_name,
      this.school_value,
     );

  factory MKSTASchoolListModel.fromJson(Map<String, dynamic> json) => _$MKSTASchoolListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTASchoolListModelToJson(this);
}

@JsonSerializable()
class MKSTACentersModel {
  final dynamic id;
  final String? CenterName;
  final String? RegionId;

  MKSTACentersModel(
      this.id,
      this.CenterName,
      this.RegionId,
     );

  factory MKSTACentersModel.fromJson(Map<String, dynamic> json) => _$MKSTACentersModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTACentersModelToJson(this);
}

@JsonSerializable()
class MKSTAWingsModel {
  final dynamic id;
  final String? wingName;

  MKSTAWingsModel(
      this.id,
      this.wingName,
     );

  factory MKSTAWingsModel.fromJson(Map<String, dynamic> json) => _$MKSTAWingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTAWingsModelToJson(this);
}

@JsonSerializable()
class MKSTARegionsModel {
  final dynamic id;
  final String? RegionName;

  MKSTARegionsModel(
      this.id,
      this.RegionName,
     );

  factory MKSTARegionsModel.fromJson(Map<String, dynamic> json) => _$MKSTARegionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTARegionsModelToJson(this);
}

@JsonSerializable()
class KSTFallSpringReportDataModel {
  final String? id;
  final String? kst_center_report_id;
  final String? region_id;
  final String? host_center_id;
  final String? report_year;
  final String? report_type;
  final String? name;
  final String? report_status;
  final String? eligible_user_id;
  final String? participant_center_id;
  final String? CenterName;
  final String? RegionName;
  final String? wingName;
  final String? total_sessions;
  final String? report_wing_id;

  KSTFallSpringReportDataModel(
      this.id,
      this.kst_center_report_id,
      this.region_id,
      this.host_center_id,
      this.report_year,
      this.report_type,
      this.name,
      this.report_status,
      this.eligible_user_id,
      this.participant_center_id,
      this.CenterName,
      this.RegionName,
      this.wingName,
      this.total_sessions,
      this.report_wing_id);

  factory KSTFallSpringReportDataModel.fromJson(Map<String, dynamic> json) => _$KSTFallSpringReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$KSTFallSpringReportDataModelToJson(this);
}