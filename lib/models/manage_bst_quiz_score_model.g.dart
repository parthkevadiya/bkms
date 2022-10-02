// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_bst_quiz_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageBSTQuizScoreModel _$ManageBSTQuizScoreModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTQuizScoreModel(
      json['has_error'] as bool?,
      json['bst_quiz_list'] == null
          ? null
          : ManageBSTQuizListModel.fromJson(
              json['bst_quiz_list'] as Map<String, dynamic>),
      json['search_filter'] == null
          ? null
          : ManageQuizSearchFilterModel.fromJson(
              json['search_filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageBSTQuizScoreModelToJson(
        ManageBSTQuizScoreModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'bst_quiz_list': instance.bst_quiz_list,
      'search_filter': instance.search_filter,
    };

ManageBSTQuizListModel _$ManageBSTQuizListModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTQuizListModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ManageBSTQuizListDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$ManageBSTQuizListModelToJson(
        ManageBSTQuizListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

ManageBSTQuizListDataModel _$ManageBSTQuizListDataModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTQuizListDataModel(
      json['user_id'] as String?,
      json['FirstName'] as String?,
      json['MiddleName'] as String?,
      json['LastName'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['PrimarySevaWing'] as String?,
      json['personalWing'] as String?,
      json['wing_name'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['group_name'] as String?,
      json['user_group_name'] as String?,
      json['school_display_name'] as String?,
      json['user_school_year_name'] as String?,
      json['grade'] as String?,
      (json['dynamic_field'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTQDynamicFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..isExpand = json['isExpand'] as bool?;

Map<String, dynamic> _$ManageBSTQuizListDataModelToJson(
        ManageBSTQuizListDataModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'FirstName': instance.FirstName,
      'MiddleName': instance.MiddleName,
      'LastName': instance.LastName,
      'name': instance.name,
      'email': instance.email,
      'PrimarySevaWing': instance.PrimarySevaWing,
      'personalWing': instance.personalWing,
      'wing_name': instance.wing_name,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'group_name': instance.group_name,
      'user_group_name': instance.user_group_name,
      'school_display_name': instance.school_display_name,
      'user_school_year_name': instance.user_school_year_name,
      'grade': instance.grade,
      'dynamic_field': instance.dynamic_field,
      'isExpand': instance.isExpand,
    };

MBSTQDynamicFieldModel _$MBSTQDynamicFieldModelFromJson(
        Map<String, dynamic> json) =>
    MBSTQDynamicFieldModel(
      json['name'] as String?,
      json['label'] as String?,
      json['selected'] as String?,
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTQDOptionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MBSTQDynamicFieldModelToJson(
        MBSTQDynamicFieldModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'selected': instance.selected,
      'options': instance.options,
    };

MBSTQDOptionsModel _$MBSTQDOptionsModelFromJson(Map<String, dynamic> json) =>
    MBSTQDOptionsModel(
      json['id'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$MBSTQDOptionsModelToJson(MBSTQDOptionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

ManageQuizSearchFilterModel _$ManageQuizSearchFilterModelFromJson(
        Map<String, dynamic> json) =>
    ManageQuizSearchFilterModel(
      json['user_role_type'] as String?,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTQRegionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['wings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTQWingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTQCentersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['school_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTQSchoolListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['grouplist'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTQGroupListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bst_fall_spring_report_data'] == null
          ? null
          : BSTQuizFallSpringReportDataModel.fromJson(
              json['bst_fall_spring_report_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageQuizSearchFilterModelToJson(
        ManageQuizSearchFilterModel instance) =>
    <String, dynamic>{
      'user_role_type': instance.user_role_type,
      'regions': instance.regions,
      'wings': instance.wings,
      'centers': instance.centers,
      'school_list': instance.school_list,
      'grouplist': instance.grouplist,
      'bst_fall_spring_report_data': instance.bst_fall_spring_report_data,
    };

MBSTQGroupListModel _$MBSTQGroupListModelFromJson(Map<String, dynamic> json) =>
    MBSTQGroupListModel(
      json['id'],
      json['group_name'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MBSTQGroupListModelToJson(
        MBSTQGroupListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_name': instance.group_name,
      'wingName': instance.wingName,
    };

MBSTQSchoolListModel _$MBSTQSchoolListModelFromJson(
        Map<String, dynamic> json) =>
    MBSTQSchoolListModel(
      json['id'],
      json['school_display_name'] as String?,
      json['school_value'] as String?,
    );

Map<String, dynamic> _$MBSTQSchoolListModelToJson(
        MBSTQSchoolListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

MBSTQCentersModel _$MBSTQCentersModelFromJson(Map<String, dynamic> json) =>
    MBSTQCentersModel(
      json['id'],
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$MBSTQCentersModelToJson(MBSTQCentersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

MBSTQWingsModel _$MBSTQWingsModelFromJson(Map<String, dynamic> json) =>
    MBSTQWingsModel(
      json['id'],
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MBSTQWingsModelToJson(MBSTQWingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

MBSTQRegionsModel _$MBSTQRegionsModelFromJson(Map<String, dynamic> json) =>
    MBSTQRegionsModel(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$MBSTQRegionsModelToJson(MBSTQRegionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

BSTQuizFallSpringReportDataModel _$BSTQuizFallSpringReportDataModelFromJson(
        Map<String, dynamic> json) =>
    BSTQuizFallSpringReportDataModel(
      json['id'] as String?,
      json['bst_center_report_id'] as String?,
      json['region_id'] as String?,
      json['host_center_id'] as String?,
      json['report_year'] as String?,
      json['report_type'] as String?,
      json['name'] as String?,
      json['report_status'] as String?,
      json['eligible_user_id'] as String?,
      json['total_eligible_users'] as String?,
      json['is_submitted'] as String?,
      json['created_date'] as String?,
      json['updated_date'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingName'] as String?,
      json['quiz_weight'] as String?,
      json['total_quiz'] as String?,
      json['final_quiz'] as String?,
      json['final_quiz_weight'] as String?,
      json['report_wing_id'] as String?,
    );

Map<String, dynamic> _$BSTQuizFallSpringReportDataModelToJson(
        BSTQuizFallSpringReportDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bst_center_report_id': instance.bst_center_report_id,
      'region_id': instance.region_id,
      'host_center_id': instance.host_center_id,
      'report_year': instance.report_year,
      'report_type': instance.report_type,
      'name': instance.name,
      'report_status': instance.report_status,
      'eligible_user_id': instance.eligible_user_id,
      'total_eligible_users': instance.total_eligible_users,
      'is_submitted': instance.is_submitted,
      'created_date': instance.created_date,
      'updated_date': instance.updated_date,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingName': instance.wingName,
      'quiz_weight': instance.quiz_weight,
      'total_quiz': instance.total_quiz,
      'final_quiz': instance.final_quiz,
      'final_quiz_weight': instance.final_quiz_weight,
      'report_wing_id': instance.report_wing_id,
    };
