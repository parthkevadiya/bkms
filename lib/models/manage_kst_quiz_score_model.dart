import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_kst_quiz_score_model.g.dart';

@JsonSerializable()
class ManageKSTQuizScoreModel /*extends Equatable*/ {
  final bool? has_error;
  final ManageKSTQuizListModel? kst_quiz_score_result;
  final ManageQuizSearchFilterModel? kst_quiz_score_filter;

  ManageKSTQuizScoreModel(this.has_error, this.kst_quiz_score_result, this.kst_quiz_score_filter);

  factory ManageKSTQuizScoreModel.fromJson(Map<String, dynamic> json) => _$ManageKSTQuizScoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTQuizScoreModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ManageKSTQuizListModel {
  final List<ManageKSTQuizListDataModel?>? data;
  final int? total;

  ManageKSTQuizListModel(this.data, this.total,);

  factory ManageKSTQuizListModel.fromJson(Map<String, dynamic> json) => _$ManageKSTQuizListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTQuizListModelToJson(this);
}

@JsonSerializable()
class ManageKSTQuizListDataModel {
  final String? user_id;
  final String? full_name;
  final String? FirstName;
  final String? MiddleName;
  final String? LastName;
  final String? grade;
  final String? RegionName;
  final String? CenterName;
  final String? group_name;
  final List<MKSTQDynamicFieldModel?>? dynamic_field;
  bool? isExpand;

  ManageKSTQuizListDataModel(this.user_id, this.full_name, this.FirstName,
      this.MiddleName, this.LastName, this.grade, this.RegionName,
      this.CenterName, this.group_name, this.dynamic_field, this.isExpand);

  factory ManageKSTQuizListDataModel.fromJson(Map<String, dynamic> json) => _$ManageKSTQuizListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageKSTQuizListDataModelToJson(this);
}

@JsonSerializable()
class MKSTQDynamicFieldModel {
  final String? name;
  final String? label;
  String? selected;
  final List<MKSTQDOptionsModel?>? options;

  MKSTQDynamicFieldModel(this.name, this.label, this.selected, this.options);

  factory MKSTQDynamicFieldModel.fromJson(Map<String, dynamic> json) => _$MKSTQDynamicFieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTQDynamicFieldModelToJson(this);
}

@JsonSerializable()
class MKSTQDOptionsModel {
  final String? id;
  final String? value;

  MKSTQDOptionsModel(this.id, this.value);

  factory MKSTQDOptionsModel.fromJson(Map<String, dynamic> json) => _$MKSTQDOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTQDOptionsModelToJson(this);
}

@JsonSerializable()
class ManageQuizSearchFilterModel {
  final String? user_role_type;
  final List<MKSTQRegionsModel?>? regions;
  final List<MKSTQWingsModel?>? wings;
  final List<MKSTQCentersModel?>? centers;
  final List<MKSTQSchoolListModel?>? school_list;
  final List<MKSTQGroupListModel?>? grouplist;
  final KSTQuizFallSpringReportDataModel? kst_manage_report_data;

  ManageQuizSearchFilterModel(
      this.user_role_type,
      this.regions,
      this.wings,
      this.centers,
      this.school_list,
      this.grouplist,
      this.kst_manage_report_data);

  factory ManageQuizSearchFilterModel.fromJson(Map<String, dynamic> json) => _$ManageQuizSearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageQuizSearchFilterModelToJson(this);
}

@JsonSerializable()
class MKSTQGroupListModel {
  final dynamic id;
  final String? group_name;
  final String? wingName;

  MKSTQGroupListModel(
      this.id,
      this.group_name,
      this.wingName,
     );

  factory MKSTQGroupListModel.fromJson(Map<String, dynamic> json) => _$MKSTQGroupListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTQGroupListModelToJson(this);
}

@JsonSerializable()
class MKSTQSchoolListModel {
  final dynamic id;
  final String? school_display_name;
  final String? school_value;

  MKSTQSchoolListModel(
      this.id,
      this.school_display_name,
      this.school_value,
     );

  factory MKSTQSchoolListModel.fromJson(Map<String, dynamic> json) => _$MKSTQSchoolListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTQSchoolListModelToJson(this);
}

@JsonSerializable()
class MKSTQCentersModel {
  final dynamic id;
  final String? CenterName;
  final String? RegionId;

  MKSTQCentersModel(
      this.id,
      this.CenterName,
      this.RegionId,
     );

  factory MKSTQCentersModel.fromJson(Map<String, dynamic> json) => _$MKSTQCentersModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTQCentersModelToJson(this);
}

@JsonSerializable()
class MKSTQWingsModel {
  final dynamic id;
  final String? wingName;

  MKSTQWingsModel(
      this.id,
      this.wingName,
     );

  factory MKSTQWingsModel.fromJson(Map<String, dynamic> json) => _$MKSTQWingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTQWingsModelToJson(this);
}

@JsonSerializable()
class MKSTQRegionsModel {
  final dynamic id;
  final String? RegionName;

  MKSTQRegionsModel(
      this.id,
      this.RegionName,
     );

  factory MKSTQRegionsModel.fromJson(Map<String, dynamic> json) => _$MKSTQRegionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MKSTQRegionsModelToJson(this);
}

@JsonSerializable()
class KSTQuizFallSpringReportDataModel {
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
  final String? total_quiz;
  final String? final_quiz;
  final String? final_quiz_weight;
  final String? report_wing_id;

  KSTQuizFallSpringReportDataModel(this.id, this.kst_center_report_id,
      this.region_id, this.host_center_id, this.report_year, this.report_type,
      this.name, this.report_status, this.eligible_user_id,
      this.participant_center_id, this.CenterName, this.RegionName,
      this.wingName, this.total_quiz, this.final_quiz, this.final_quiz_weight,
      this.report_wing_id);

  factory KSTQuizFallSpringReportDataModel.fromJson(Map<String, dynamic> json) => _$KSTQuizFallSpringReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$KSTQuizFallSpringReportDataModelToJson(this);
}