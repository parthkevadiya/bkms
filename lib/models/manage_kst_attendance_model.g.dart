// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_kst_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageKSTAttendanceModel _$ManageKSTAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTAttendanceModel(
      json['has_error'] as bool?,
      json['kst_attendance_result'] == null
          ? null
          : ManageKSTAttendanceListModel.fromJson(
              json['kst_attendance_result'] as Map<String, dynamic>),
      json['kst_attendance_filter'] == null
          ? null
          : ManageAttendanceSearchFilterModel.fromJson(
              json['kst_attendance_filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageKSTAttendanceModelToJson(
        ManageKSTAttendanceModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'kst_attendance_result': instance.kst_attendance_result,
      'kst_attendance_filter': instance.kst_attendance_filter,
    };

ManageKSTAttendanceListModel _$ManageKSTAttendanceListModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTAttendanceListModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ManageKSTAttendanceListDataModel.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$ManageKSTAttendanceListModelToJson(
        ManageKSTAttendanceListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

ManageKSTAttendanceListDataModel _$ManageKSTAttendanceListDataModelFromJson(
        Map<String, dynamic> json) =>
    ManageKSTAttendanceListDataModel(
      json['user_id'] as String?,
      json['FirstName'] as String?,
      json['MiddleName'] as String?,
      json['LastName'] as String?,
      json['full_name'] as String?,
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
              : MKSTADynamicFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..isExpand = json['isExpand'] as bool?;

Map<String, dynamic> _$ManageKSTAttendanceListDataModelToJson(
        ManageKSTAttendanceListDataModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'FirstName': instance.FirstName,
      'MiddleName': instance.MiddleName,
      'LastName': instance.LastName,
      'full_name': instance.full_name,
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

MKSTADynamicFieldModel _$MKSTADynamicFieldModelFromJson(
        Map<String, dynamic> json) =>
    MKSTADynamicFieldModel(
      json['name'] as String?,
      json['label'] as String?,
      json['selected'] as String?,
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTADOptionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MKSTADynamicFieldModelToJson(
        MKSTADynamicFieldModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'selected': instance.selected,
      'options': instance.options,
    };

MKSTADOptionsModel _$MKSTADOptionsModelFromJson(Map<String, dynamic> json) =>
    MKSTADOptionsModel(
      json['id'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$MKSTADOptionsModelToJson(MKSTADOptionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

ManageAttendanceSearchFilterModel _$ManageAttendanceSearchFilterModelFromJson(
        Map<String, dynamic> json) =>
    ManageAttendanceSearchFilterModel(
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTARegionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['wings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTAWingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTACentersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['school_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTASchoolListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['grouplist'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MKSTAGroupListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['kst_manage_report_data'] == null
          ? null
          : KSTFallSpringReportDataModel.fromJson(
              json['kst_manage_report_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageAttendanceSearchFilterModelToJson(
        ManageAttendanceSearchFilterModel instance) =>
    <String, dynamic>{
      'regions': instance.regions,
      'wings': instance.wings,
      'centers': instance.centers,
      'school_list': instance.school_list,
      'grouplist': instance.grouplist,
      'kst_manage_report_data': instance.kst_manage_report_data,
    };

MKSTAGroupListModel _$MKSTAGroupListModelFromJson(Map<String, dynamic> json) =>
    MKSTAGroupListModel(
      json['id'],
      json['group_name'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MKSTAGroupListModelToJson(
        MKSTAGroupListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_name': instance.group_name,
      'wingName': instance.wingName,
    };

MKSTASchoolListModel _$MKSTASchoolListModelFromJson(
        Map<String, dynamic> json) =>
    MKSTASchoolListModel(
      json['id'],
      json['school_display_name'] as String?,
      json['school_value'] as String?,
    );

Map<String, dynamic> _$MKSTASchoolListModelToJson(
        MKSTASchoolListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

MKSTACentersModel _$MKSTACentersModelFromJson(Map<String, dynamic> json) =>
    MKSTACentersModel(
      json['id'],
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$MKSTACentersModelToJson(MKSTACentersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

MKSTAWingsModel _$MKSTAWingsModelFromJson(Map<String, dynamic> json) =>
    MKSTAWingsModel(
      json['id'],
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MKSTAWingsModelToJson(MKSTAWingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

MKSTARegionsModel _$MKSTARegionsModelFromJson(Map<String, dynamic> json) =>
    MKSTARegionsModel(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$MKSTARegionsModelToJson(MKSTARegionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

KSTFallSpringReportDataModel _$KSTFallSpringReportDataModelFromJson(
        Map<String, dynamic> json) =>
    KSTFallSpringReportDataModel(
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
      json['total_sessions'] as String?,
      json['report_wing_id'] as String?,
    );

Map<String, dynamic> _$KSTFallSpringReportDataModelToJson(
        KSTFallSpringReportDataModel instance) =>
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
      'total_sessions': instance.total_sessions,
      'report_wing_id': instance.report_wing_id,
    };
