// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_bst_niyam_assesment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageBSTNiyamAssesmentModel _$ManageBSTNiyamAssesmentModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTNiyamAssesmentModel(
      json['has_error'] as bool?,
      json['bst_niyam_assessment_result'] == null
          ? null
          : ManageBSTNiyamAssessmentResultModel.fromJson(
              json['bst_niyam_assessment_result'] as Map<String, dynamic>),
      json['search_filter'] == null
          ? null
          : MNASearchFilterModel.fromJson(
              json['search_filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageBSTNiyamAssesmentModelToJson(
        ManageBSTNiyamAssesmentModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'bst_niyam_assessment_result': instance.bst_niyam_assessment_result,
      'search_filter': instance.search_filter,
    };

ManageBSTNiyamAssessmentResultModel
    _$ManageBSTNiyamAssessmentResultModelFromJson(Map<String, dynamic> json) =>
        ManageBSTNiyamAssessmentResultModel(
          (json['data'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : MNAListDataModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['total'] as int?,
        );

Map<String, dynamic> _$ManageBSTNiyamAssessmentResultModelToJson(
        ManageBSTNiyamAssessmentResultModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

MNAListDataModel _$MNAListDataModelFromJson(Map<String, dynamic> json) =>
    MNAListDataModel(
      json['user_id'] as String?,
      json['full_name'] as String?,
      json['FirstName'] as String?,
      json['MiddleName'] as String?,
      json['LastName'] as String?,
      json['grade'] as String?,
      json['RegionName'] as String?,
      json['CenterName'] as String?,
      json['group_name'] as String?,
      json['user_school_year_name'] as String?,
      json['begin_score'] as String?,
      json['final_score'] as String?,
      (json['dynamic_field'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MNADynamicFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isExpand'] as bool?,
    );

Map<String, dynamic> _$MNAListDataModelToJson(MNAListDataModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'full_name': instance.full_name,
      'FirstName': instance.FirstName,
      'MiddleName': instance.MiddleName,
      'LastName': instance.LastName,
      'grade': instance.grade,
      'RegionName': instance.RegionName,
      'CenterName': instance.CenterName,
      'group_name': instance.group_name,
      'user_school_year_name': instance.user_school_year_name,
      'begin_score': instance.begin_score,
      'final_score': instance.final_score,
      'dynamic_field': instance.dynamic_field,
      'isExpand': instance.isExpand,
    };

MNADynamicFieldModel _$MNADynamicFieldModelFromJson(
        Map<String, dynamic> json) =>
    MNADynamicFieldModel(
      json['name'] as String?,
      json['label'] as String?,
      json['selected'] as String?,
      (json['option'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MNADFOptionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MNADynamicFieldModelToJson(
        MNADynamicFieldModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'selected': instance.selected,
      'option': instance.option,
    };

MNADFOptionsModel _$MNADFOptionsModelFromJson(Map<String, dynamic> json) =>
    MNADFOptionsModel(
      json['id'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$MNADFOptionsModelToJson(MNADFOptionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

MNASearchFilterModel _$MNASearchFilterModelFromJson(
        Map<String, dynamic> json) =>
    MNASearchFilterModel(
      json['user_role_type'] as String?,
      json['user_wing_set'] as int?,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MNARegionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['wings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MNAWingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MNACentersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['school_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MNASchoolListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['grouplist'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MNAGroupListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bst_report_data'] == null
          ? null
          : MNABSTReportDataModel.fromJson(
              json['bst_report_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MNASearchFilterModelToJson(
        MNASearchFilterModel instance) =>
    <String, dynamic>{
      'user_role_type': instance.user_role_type,
      'user_wing_set': instance.user_wing_set,
      'regions': instance.regions,
      'wings': instance.wings,
      'centers': instance.centers,
      'school_list': instance.school_list,
      'grouplist': instance.grouplist,
      'bst_report_data': instance.bst_report_data,
    };

MNAGroupListModel _$MNAGroupListModelFromJson(Map<String, dynamic> json) =>
    MNAGroupListModel(
      json['id'],
      json['group_name'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MNAGroupListModelToJson(MNAGroupListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_name': instance.group_name,
      'wingName': instance.wingName,
    };

MNASchoolListModel _$MNASchoolListModelFromJson(Map<String, dynamic> json) =>
    MNASchoolListModel(
      json['id'],
      json['school_display_name'] as String?,
      json['school_value'] as String?,
    );

Map<String, dynamic> _$MNASchoolListModelToJson(MNASchoolListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

MNACentersModel _$MNACentersModelFromJson(Map<String, dynamic> json) =>
    MNACentersModel(
      json['id'],
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$MNACentersModelToJson(MNACentersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

MNAWingsModel _$MNAWingsModelFromJson(Map<String, dynamic> json) =>
    MNAWingsModel(
      json['id'],
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MNAWingsModelToJson(MNAWingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

MNARegionsModel _$MNARegionsModelFromJson(Map<String, dynamic> json) =>
    MNARegionsModel(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$MNARegionsModelToJson(MNARegionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

MNABSTReportDataModel _$MNABSTReportDataModelFromJson(
        Map<String, dynamic> json) =>
    MNABSTReportDataModel(
      json['id'] as String?,
      json['region_id'] as String?,
      json['host_center_id'] as String?,
      json['participant_center_id'] as String?,
      json['elligible_user_id'] as String?,
      json['elligible_niyam_assessment_user_id'] as String?,
      json['bstkst_option'] as String?,
      json['wing_id'] as String?,
      json['fall_sessions'] as String?,
      json['spring_sessions'] as String?,
      json['fall_quizzes'] as String?,
      json['spring_quizzes'] as String?,
      json['quiz_weight'] as String?,
      json['spring_final'] as String?,
      json['spring_final_weight'] as String?,
      json['fall_year'] as String?,
      json['spring_year'] as String?,
      json['average'] as String?,
      json['created_date'] as String?,
      json['updated_date'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MNABSTReportDataModelToJson(
        MNABSTReportDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region_id': instance.region_id,
      'host_center_id': instance.host_center_id,
      'participant_center_id': instance.participant_center_id,
      'elligible_user_id': instance.elligible_user_id,
      'elligible_niyam_assessment_user_id':
          instance.elligible_niyam_assessment_user_id,
      'bstkst_option': instance.bstkst_option,
      'wing_id': instance.wing_id,
      'fall_sessions': instance.fall_sessions,
      'spring_sessions': instance.spring_sessions,
      'fall_quizzes': instance.fall_quizzes,
      'spring_quizzes': instance.spring_quizzes,
      'quiz_weight': instance.quiz_weight,
      'spring_final': instance.spring_final,
      'spring_final_weight': instance.spring_final_weight,
      'fall_year': instance.fall_year,
      'spring_year': instance.spring_year,
      'average': instance.average,
      'created_date': instance.created_date,
      'updated_date': instance.updated_date,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingName': instance.wingName,
    };
