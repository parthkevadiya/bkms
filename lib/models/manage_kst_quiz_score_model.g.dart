// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_kst_quiz_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageKSTQuizScoreModel _$ManageKSTQuizScoreModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTQuizScoreModel(
      json['has_error'] as bool?,
      json['kst_quiz_score_result'] == null
          ? null
          : ManageKSTQuizListModel.fromJson(
              json['kst_quiz_score_result'] as Map<String, dynamic>),
      json['kst_quiz_score_filter'] == null
          ? null
          : ManageQuizSearchFilterModel.fromJson(
              json['kst_quiz_score_filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageKSTQuizScoreModelToJson(
        ManageKSTQuizScoreModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'kst_quiz_score_result': instance.kst_quiz_score_result,
      'kst_quiz_score_filter': instance.kst_quiz_score_filter,
    };

ManageKSTQuizListModel _$ManageKSTQuizListModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTQuizListModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ManageKSTQuizListDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$ManageKSTQuizListModelToJson(
        ManageKSTQuizListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

ManageKSTQuizListDataModel _$ManageKSTQuizListDataModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTQuizListDataModel(
      json['user_id'] as String?,
      json['full_name'] as String?,
      json['FirstName'] as String?,
      json['MiddleName'] as String?,
      json['LastName'] as String?,
      json['grade'] as String?,
      json['RegionName'] as String?,
      json['CenterName'] as String?,
      json['group_name'] as String?,
      (json['dynamic_field'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTQDynamicFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isExpand'] as bool?,
    );

Map<String, dynamic> _$ManageKSTQuizListDataModelToJson(
        ManageKSTQuizListDataModel instance) =>
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
      'dynamic_field': instance.dynamic_field,
      'isExpand': instance.isExpand,
    };

MKSTQDynamicFieldModel _$MKSTQDynamicFieldModelFromJson(
        Map<String, dynamic> json) =>
    MKSTQDynamicFieldModel(
      json['name'] as String?,
      json['label'] as String?,
      json['selected'] as String?,
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTQDOptionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MKSTQDynamicFieldModelToJson(
        MKSTQDynamicFieldModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'selected': instance.selected,
      'options': instance.options,
    };

MKSTQDOptionsModel _$MKSTQDOptionsModelFromJson(Map<String, dynamic> json) =>
    MKSTQDOptionsModel(
      json['id'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$MKSTQDOptionsModelToJson(MKSTQDOptionsModel instance) =>
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
              : MKSTQRegionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['wings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTQWingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTQCentersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['school_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTQSchoolListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['grouplist'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTQGroupListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['kst_manage_report_data'] == null
          ? null
          : KSTQuizFallSpringReportDataModel.fromJson(
              json['kst_manage_report_data'] as Map<String, dynamic>),
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
      'kst_manage_report_data': instance.kst_manage_report_data,
    };

MKSTQGroupListModel _$MKSTQGroupListModelFromJson(Map<String, dynamic> json) =>
    MKSTQGroupListModel(
      json['id'],
      json['group_name'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MKSTQGroupListModelToJson(
        MKSTQGroupListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_name': instance.group_name,
      'wingName': instance.wingName,
    };

MKSTQSchoolListModel _$MKSTQSchoolListModelFromJson(
        Map<String, dynamic> json) =>
    MKSTQSchoolListModel(
      json['id'],
      json['school_display_name'] as String?,
      json['school_value'] as String?,
    );

Map<String, dynamic> _$MKSTQSchoolListModelToJson(
        MKSTQSchoolListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

MKSTQCentersModel _$MKSTQCentersModelFromJson(Map<String, dynamic> json) =>
    MKSTQCentersModel(
      json['id'],
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$MKSTQCentersModelToJson(MKSTQCentersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

MKSTQWingsModel _$MKSTQWingsModelFromJson(Map<String, dynamic> json) =>
    MKSTQWingsModel(
      json['id'],
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MKSTQWingsModelToJson(MKSTQWingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

MKSTQRegionsModel _$MKSTQRegionsModelFromJson(Map<String, dynamic> json) =>
    MKSTQRegionsModel(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$MKSTQRegionsModelToJson(MKSTQRegionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

KSTQuizFallSpringReportDataModel _$KSTQuizFallSpringReportDataModelFromJson(
        Map<String, dynamic> json) =>
    KSTQuizFallSpringReportDataModel(
      json['id'] as String?,
      json['kst_center_report_id'] as String?,
      json['region_id'] as String?,
      json['host_center_id'] as String?,
      json['report_year'] as String?,
      json['report_type'] as String?,
      json['name'] as String?,
      json['report_status'] as String?,
      json['eligible_user_id'] as String?,
      json['participant_center_id'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingName'] as String?,
      json['total_quiz'] as String?,
      json['final_quiz'] as String?,
      json['final_quiz_weight'] as String?,
      json['report_wing_id'] as String?,
    );

Map<String, dynamic> _$KSTQuizFallSpringReportDataModelToJson(
        KSTQuizFallSpringReportDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kst_center_report_id': instance.kst_center_report_id,
      'region_id': instance.region_id,
      'host_center_id': instance.host_center_id,
      'report_year': instance.report_year,
      'report_type': instance.report_type,
      'name': instance.name,
      'report_status': instance.report_status,
      'eligible_user_id': instance.eligible_user_id,
      'participant_center_id': instance.participant_center_id,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingName': instance.wingName,
      'total_quiz': instance.total_quiz,
      'final_quiz': instance.final_quiz,
      'final_quiz_weight': instance.final_quiz_weight,
      'report_wing_id': instance.report_wing_id,
    };
