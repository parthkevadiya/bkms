import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_bst_attendance_model.g.dart';

@JsonSerializable()
class ManageBSTAttendanceModel /*extends Equatable*/ {
  final bool? has_error;
  final ManageBSTAttendanceListModel? bst_attendance_list;
  final ManageAttendanceSearchFilterModel? search_filter;

  ManageBSTAttendanceModel(this.has_error, this.bst_attendance_list, this.search_filter);

  factory ManageBSTAttendanceModel.fromJson(Map<String, dynamic> json) => _$ManageBSTAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ManageBSTAttendanceListModel {
  final List<ManageBSTAttendanceListDataModel?>? data;
  final int? total;

  ManageBSTAttendanceListModel(this.data, this.total,);

  factory ManageBSTAttendanceListModel.fromJson(Map<String, dynamic> json) => _$ManageBSTAttendanceListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTAttendanceListModelToJson(this);
}

@JsonSerializable()
class ManageBSTAttendanceListDataModel {
  final String? user_id;
  final String? FirstName;
  final String? MiddleName;
  final String? LastName;
  final String? name;
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
  final List<MBSTADynamicFieldModel?>? dynamic_field;
  bool? isExpand;

  ManageBSTAttendanceListDataModel(
      this.user_id,
      this.FirstName,
      this.MiddleName,
      this.LastName,
      this.name,
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

  factory ManageBSTAttendanceListDataModel.fromJson(Map<String, dynamic> json) => _$ManageBSTAttendanceListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTAttendanceListDataModelToJson(this);
}

@JsonSerializable()
class MBSTADynamicFieldModel {
  final String? name;
  final String? label;
  String? selected;
  final List<MBSTADOptionsModel?>? option;

  MBSTADynamicFieldModel(this.name, this.label, this.selected, this.option);

  factory MBSTADynamicFieldModel.fromJson(Map<String, dynamic> json) => _$MBSTADynamicFieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTADynamicFieldModelToJson(this);
}

@JsonSerializable()
class MBSTADOptionsModel {
  final String? id;
  final String? value;

  MBSTADOptionsModel(this.id, this.value);

  factory MBSTADOptionsModel.fromJson(Map<String, dynamic> json) => _$MBSTADOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTADOptionsModelToJson(this);
}

@JsonSerializable()
class ManageAttendanceSearchFilterModel {
  final String? user_role_type;
  final List<MBSTARegionsModel?>? regions;
  final List<MBSTAWingsModel?>? wings;
  final List<MBSTACentersModel?>? centers;
  final List<MBSTASchoolListModel?>? school_list;
  final List<MBSTAGroupListModel?>? grouplist;
  final BSTFallSpringReportDataModel? bst_fall_spring_report_data;

  ManageAttendanceSearchFilterModel(
      this.user_role_type,
      this.regions,
      this.wings,
      this.centers,
      this.school_list,
      this.grouplist,
      this.bst_fall_spring_report_data);

  factory ManageAttendanceSearchFilterModel.fromJson(Map<String, dynamic> json) => _$ManageAttendanceSearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageAttendanceSearchFilterModelToJson(this);
}

@JsonSerializable()
class MBSTAGroupListModel {
  final dynamic id;
  final String? group_name;
  final String? wingName;

  MBSTAGroupListModel(
      this.id,
      this.group_name,
      this.wingName,
     );

  factory MBSTAGroupListModel.fromJson(Map<String, dynamic> json) => _$MBSTAGroupListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTAGroupListModelToJson(this);
}

@JsonSerializable()
class MBSTASchoolListModel {
  final dynamic id;
  final String? school_display_name;
  final String? school_value;

  MBSTASchoolListModel(
      this.id,
      this.school_display_name,
      this.school_value,
     );

  factory MBSTASchoolListModel.fromJson(Map<String, dynamic> json) => _$MBSTASchoolListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTASchoolListModelToJson(this);
}

@JsonSerializable()
class MBSTACentersModel {
  final dynamic id;
  final String? CenterName;
  final String? RegionId;

  MBSTACentersModel(
      this.id,
      this.CenterName,
      this.RegionId,
     );

  factory MBSTACentersModel.fromJson(Map<String, dynamic> json) => _$MBSTACentersModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTACentersModelToJson(this);
}

@JsonSerializable()
class MBSTAWingsModel {
  final dynamic id;
  final String? wingName;

  MBSTAWingsModel(
      this.id,
      this.wingName,
     );

  factory MBSTAWingsModel.fromJson(Map<String, dynamic> json) => _$MBSTAWingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTAWingsModelToJson(this);
}

@JsonSerializable()
class MBSTARegionsModel {
  final dynamic id;
  final String? RegionName;

  MBSTARegionsModel(
      this.id,
      this.RegionName,
     );

  factory MBSTARegionsModel.fromJson(Map<String, dynamic> json) => _$MBSTARegionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTARegionsModelToJson(this);
}

@JsonSerializable()
class BSTFallSpringReportDataModel {
  final String? id;
  final String? bst_center_report_id;
  final String? region_id;
  final String? host_center_id;
  final String? report_year;
  final String? report_type;
  final String? name;
  final String? report_status;
  final String? eligible_user_id;
  final String? total_eligible_users;
  final String? is_submitted;
  final String? created_date;
  final String? updated_date;
  final String? CenterName;
  final String? RegionName;
  final String? wingName;
  final String? total_sessions;
  final String? report_wing_id;

  BSTFallSpringReportDataModel(
      this.id,
      this.bst_center_report_id,
      this.region_id,
      this.host_center_id,
      this.report_year,
      this.report_type,
      this.name,
      this.report_status,
      this.eligible_user_id,
      this.total_eligible_users,
      this.is_submitted,
      this.created_date,
      this.updated_date,
      this.CenterName,
      this.RegionName,
      this.wingName,
      this.total_sessions,
      this.report_wing_id);

  factory BSTFallSpringReportDataModel.fromJson(Map<String, dynamic> json) => _$BSTFallSpringReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSTFallSpringReportDataModelToJson(this);
}