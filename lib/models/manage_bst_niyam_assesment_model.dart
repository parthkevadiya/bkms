import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_bst_niyam_assesment_model.g.dart';

@JsonSerializable()
class ManageBSTNiyamAssesmentModel /*extends Equatable*/ {
  final bool? has_error;
  final ManageBSTNiyamAssessmentResultModel? bst_niyam_assessment_result;
  final MNASearchFilterModel? search_filter;

  ManageBSTNiyamAssesmentModel(this.has_error, this.bst_niyam_assessment_result, this.search_filter);

  factory ManageBSTNiyamAssesmentModel.fromJson(Map<String, dynamic> json) => _$ManageBSTNiyamAssesmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTNiyamAssesmentModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class ManageBSTNiyamAssessmentResultModel {
  final List<MNAListDataModel?>? data;
  final int? total;

  ManageBSTNiyamAssessmentResultModel(this.data, this.total,);

  factory ManageBSTNiyamAssessmentResultModel.fromJson(Map<String, dynamic> json) => _$ManageBSTNiyamAssessmentResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManageBSTNiyamAssessmentResultModelToJson(this);
}

@JsonSerializable()
class MNAListDataModel {
  final String? user_id;
  final String? full_name;
  final String? FirstName;
  final String? MiddleName;
  final String? LastName;
  final String? grade;
  final String? RegionName;
  final String? CenterName;
  final String? group_name;
  final String? user_school_year_name;
  final String? begin_score;
  final String? final_score ;
  final List<MNADynamicFieldModel?>? dynamic_field;
  bool? isExpand;

  MNAListDataModel(
      this.user_id,
      this.full_name,
      this.FirstName,
      this.MiddleName,
      this.LastName,
      this.grade,
      this.RegionName,
      this.CenterName,
      this.group_name,
      this.user_school_year_name,
      this.begin_score,
      this.final_score,
      this.dynamic_field,
      this.isExpand);

  factory MNAListDataModel.fromJson(Map<String, dynamic> json) => _$MNAListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNAListDataModelToJson(this);
}

@JsonSerializable()
class MNADynamicFieldModel {
  final String? name;
  final String? label;
  String? selected;
  final List<MNADFOptionsModel?>? option;

  MNADynamicFieldModel(this.name, this.label, this.selected, this.option);

  factory MNADynamicFieldModel.fromJson(Map<String, dynamic> json) => _$MNADynamicFieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNADynamicFieldModelToJson(this);
}

@JsonSerializable()
class MNADFOptionsModel {
  final String? id;
  final String? value;

  MNADFOptionsModel(this.id, this.value);

  factory MNADFOptionsModel.fromJson(Map<String, dynamic> json) => _$MNADFOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNADFOptionsModelToJson(this);
}

@JsonSerializable()
class MNASearchFilterModel {
  final String? user_role_type;
  final int? user_wing_set;
  final List<MNARegionsModel?>? regions;
  final List<MNAWingsModel?>? wings;
  final List<MNACentersModel?>? centers;
  final List<MNASchoolListModel?>? school_list;
  final List<MNAGroupListModel?>? grouplist;
  final MNABSTReportDataModel? bst_report_data;

  MNASearchFilterModel(
      this.user_role_type,
      this.user_wing_set,
      this.regions,
      this.wings,
      this.centers,
      this.school_list,
      this.grouplist,
      this.bst_report_data);

  factory MNASearchFilterModel.fromJson(Map<String, dynamic> json) => _$MNASearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNASearchFilterModelToJson(this);
}

@JsonSerializable()
class MNAGroupListModel {
  final dynamic id;
  final String? group_name;
  final String? wingName;

  MNAGroupListModel(
      this.id,
      this.group_name,
      this.wingName,
     );

  factory MNAGroupListModel.fromJson(Map<String, dynamic> json) => _$MNAGroupListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNAGroupListModelToJson(this);
}

@JsonSerializable()
class MNASchoolListModel {
  final dynamic id;
  final String? school_display_name;
  final String? school_value;

  MNASchoolListModel(
      this.id,
      this.school_display_name,
      this.school_value,
     );

  factory MNASchoolListModel.fromJson(Map<String, dynamic> json) => _$MNASchoolListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNASchoolListModelToJson(this);
}

@JsonSerializable()
class MNACentersModel {
  final dynamic id;
  final String? CenterName;
  final String? RegionId;

  MNACentersModel(
      this.id,
      this.CenterName,
      this.RegionId,
     );

  factory MNACentersModel.fromJson(Map<String, dynamic> json) => _$MNACentersModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNACentersModelToJson(this);
}

@JsonSerializable()
class MNAWingsModel {
  final dynamic id;
  final String? wingName;

  MNAWingsModel(
      this.id,
      this.wingName,
     );

  factory MNAWingsModel.fromJson(Map<String, dynamic> json) => _$MNAWingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNAWingsModelToJson(this);
}

@JsonSerializable()
class MNARegionsModel {
  final dynamic id;
  final String? RegionName;

  MNARegionsModel(
      this.id,
      this.RegionName,
     );

  factory MNARegionsModel.fromJson(Map<String, dynamic> json) => _$MNARegionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNARegionsModelToJson(this);
}

@JsonSerializable()
class MNABSTReportDataModel {
  final String? id;
  final String? region_id;
  final String? host_center_id;
  final String? participant_center_id;
  final String? elligible_user_id;
  final String? elligible_niyam_assessment_user_id;
  final String? bstkst_option;
  final String? wing_id;
  final String? fall_sessions;
  final String? spring_sessions;
  final String? fall_quizzes;
  final String? spring_quizzes;
  final String? quiz_weight;
  final String? spring_final;
  final String? spring_final_weight;
  final String? fall_year;
  final String? spring_year;
  final String? average;
  final String? created_date;
  final String? updated_date;
  final String? CenterName;
  final String? RegionName;
  final String? wingName;

  MNABSTReportDataModel(
      this.id,
      this.region_id,
      this.host_center_id,
      this.participant_center_id,
      this.elligible_user_id,
      this.elligible_niyam_assessment_user_id,
      this.bstkst_option,
      this.wing_id,
      this.fall_sessions,
      this.spring_sessions,
      this.fall_quizzes,
      this.spring_quizzes,
      this.quiz_weight,
      this.spring_final,
      this.spring_final_weight,
      this.fall_year,
      this.spring_year,
      this.average,
      this.created_date,
      this.updated_date,
      this.CenterName,
      this.RegionName,
      this.wingName);

  factory MNABSTReportDataModel.fromJson(Map<String, dynamic> json) => _$MNABSTReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MNABSTReportDataModelToJson(this);
}