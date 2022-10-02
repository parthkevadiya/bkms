import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_bst_quiz_score_model.g.dart';

@JsonSerializable()
class ManageBSTQuizScoreModel /*extends Equatable*/ {
  final bool? has_error;
  final ManageBSTQuizListModel? bst_quiz_list;
  final ManageQuizSearchFilterModel? search_filter;

  ManageBSTQuizScoreModel(this.has_error, this.bst_quiz_list, this.search_filter);

  factory ManageBSTQuizScoreModel.fromJson(Map<String, dynamic> json) => _$ManageBSTQuizScoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTQuizScoreModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ManageBSTQuizListModel {
  final List<ManageBSTQuizListDataModel?>? data;
  final int? total;

  ManageBSTQuizListModel(this.data, this.total,);

  factory ManageBSTQuizListModel.fromJson(Map<String, dynamic> json) => _$ManageBSTQuizListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTQuizListModelToJson(this);
}

@JsonSerializable()
class ManageBSTQuizListDataModel {
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
  final List<MBSTQDynamicFieldModel?>? dynamic_field;
  bool? isExpand;

  ManageBSTQuizListDataModel(
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

  factory ManageBSTQuizListDataModel.fromJson(Map<String, dynamic> json) => _$ManageBSTQuizListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTQuizListDataModelToJson(this);
}

@JsonSerializable()
class MBSTQDynamicFieldModel {
  final String? name;
  final String? label;
  String? selected;
  final List<MBSTQDOptionsModel?>? options;

  MBSTQDynamicFieldModel(this.name, this.label, this.selected, this.options);

  factory MBSTQDynamicFieldModel.fromJson(Map<String, dynamic> json) => _$MBSTQDynamicFieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTQDynamicFieldModelToJson(this);
}

@JsonSerializable()
class MBSTQDOptionsModel {
  final String? id;
  final String? value;

  MBSTQDOptionsModel(this.id, this.value);

  factory MBSTQDOptionsModel.fromJson(Map<String, dynamic> json) => _$MBSTQDOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTQDOptionsModelToJson(this);
}

@JsonSerializable()
class ManageQuizSearchFilterModel {
  final String? user_role_type;
  final List<MBSTQRegionsModel?>? regions;
  final List<MBSTQWingsModel?>? wings;
  final List<MBSTQCentersModel?>? centers;
  final List<MBSTQSchoolListModel?>? school_list;
  final List<MBSTQGroupListModel?>? grouplist;
  final BSTQuizFallSpringReportDataModel? bst_fall_spring_report_data;

  ManageQuizSearchFilterModel(
      this.user_role_type,
      this.regions,
      this.wings,
      this.centers,
      this.school_list,
      this.grouplist,
      this.bst_fall_spring_report_data);

  factory ManageQuizSearchFilterModel.fromJson(Map<String, dynamic> json) => _$ManageQuizSearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageQuizSearchFilterModelToJson(this);
}

@JsonSerializable()
class MBSTQGroupListModel {
  final dynamic id;
  final String? group_name;
  final String? wingName;

  MBSTQGroupListModel(
      this.id,
      this.group_name,
      this.wingName,
     );

  factory MBSTQGroupListModel.fromJson(Map<String, dynamic> json) => _$MBSTQGroupListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTQGroupListModelToJson(this);
}

@JsonSerializable()
class MBSTQSchoolListModel {
  final dynamic id;
  final String? school_display_name;
  final String? school_value;

  MBSTQSchoolListModel(
      this.id,
      this.school_display_name,
      this.school_value,
     );

  factory MBSTQSchoolListModel.fromJson(Map<String, dynamic> json) => _$MBSTQSchoolListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTQSchoolListModelToJson(this);
}

@JsonSerializable()
class MBSTQCentersModel {
  final dynamic id;
  final String? CenterName;
  final String? RegionId;

  MBSTQCentersModel(
      this.id,
      this.CenterName,
      this.RegionId,
     );

  factory MBSTQCentersModel.fromJson(Map<String, dynamic> json) => _$MBSTQCentersModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTQCentersModelToJson(this);
}

@JsonSerializable()
class MBSTQWingsModel {
  final dynamic id;
  final String? wingName;

  MBSTQWingsModel(
      this.id,
      this.wingName,
     );

  factory MBSTQWingsModel.fromJson(Map<String, dynamic> json) => _$MBSTQWingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTQWingsModelToJson(this);
}

@JsonSerializable()
class MBSTQRegionsModel {
  final dynamic id;
  final String? RegionName;

  MBSTQRegionsModel(
      this.id,
      this.RegionName,
     );

  factory MBSTQRegionsModel.fromJson(Map<String, dynamic> json) => _$MBSTQRegionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MBSTQRegionsModelToJson(this);
}

@JsonSerializable()
class BSTQuizFallSpringReportDataModel {
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
  final String? quiz_weight;
  final String? total_quiz;
  final String? final_quiz;
  final String? final_quiz_weight;
  final String? report_wing_id;

  BSTQuizFallSpringReportDataModel(this.id, this.bst_center_report_id,
      this.region_id, this.host_center_id, this.report_year, this.report_type,
      this.name, this.report_status, this.eligible_user_id,
      this.total_eligible_users, this.is_submitted, this.created_date,
      this.updated_date, this.CenterName, this.RegionName, this.wingName,
      this.quiz_weight, this.total_quiz, this.final_quiz,
      this.final_quiz_weight, this.report_wing_id);

  factory BSTQuizFallSpringReportDataModel.fromJson(Map<String, dynamic> json) => _$BSTQuizFallSpringReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSTQuizFallSpringReportDataModelToJson(this);
}