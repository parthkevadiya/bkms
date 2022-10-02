// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_bst_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageBSTAttendanceModel _$ManageBSTAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTAttendanceModel(
      json['has_error'] as bool?,
      json['bst_attendance_list'] == null
          ? null
          : ManageBSTAttendanceListModel.fromJson(
              json['bst_attendance_list'] as Map<String, dynamic>),
      json['search_filter'] == null
          ? null
          : ManageAttendanceSearchFilterModel.fromJson(
              json['search_filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageBSTAttendanceModelToJson(
        ManageBSTAttendanceModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'bst_attendance_list': instance.bst_attendance_list,
      'search_filter': instance.search_filter,
    };

ManageBSTAttendanceListModel _$ManageBSTAttendanceListModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTAttendanceListModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ManageBSTAttendanceListDataModel.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$ManageBSTAttendanceListModelToJson(
        ManageBSTAttendanceListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

ManageBSTAttendanceListDataModel _$ManageBSTAttendanceListDataModelFromJson(
        Map<String, dynamic> json) =>
    ManageBSTAttendanceListDataModel(
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
              : MBSTADynamicFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..isExpand = json['isExpand'] as bool?;

Map<String, dynamic> _$ManageBSTAttendanceListDataModelToJson(
        ManageBSTAttendanceListDataModel instance) =>
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

MBSTADynamicFieldModel _$MBSTADynamicFieldModelFromJson(
        Map<String, dynamic> json) =>
    MBSTADynamicFieldModel(
      json['name'] as String?,
      json['label'] as String?,
      json['selected'] as String?,
      (json['option'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTADOptionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MBSTADynamicFieldModelToJson(
        MBSTADynamicFieldModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'selected': instance.selected,
      'option': instance.option,
    };

MBSTADOptionsModel _$MBSTADOptionsModelFromJson(Map<String, dynamic> json) =>
    MBSTADOptionsModel(
      json['id'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$MBSTADOptionsModelToJson(MBSTADOptionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

ManageAttendanceSearchFilterModel _$ManageAttendanceSearchFilterModelFromJson(
        Map<String, dynamic> json) =>
    ManageAttendanceSearchFilterModel(
      json['user_role_type'] as String?,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTARegionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['wings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTAWingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTACentersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['school_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTASchoolListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['grouplist'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MBSTAGroupListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bst_fall_spring_report_data'] == null
          ? null
          : BSTFallSpringReportDataModel.fromJson(
              json['bst_fall_spring_report_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageAttendanceSearchFilterModelToJson(
        ManageAttendanceSearchFilterModel instance) =>
    <String, dynamic>{
      'user_role_type': instance.user_role_type,
      'regions': instance.regions,
      'wings': instance.wings,
      'centers': instance.centers,
      'school_list': instance.school_list,
      'grouplist': instance.grouplist,
      'bst_fall_spring_report_data': instance.bst_fall_spring_report_data,
    };

MBSTAGroupListModel _$MBSTAGroupListModelFromJson(Map<String, dynamic> json) =>
    MBSTAGroupListModel(
      json['id'],
      json['group_name'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MBSTAGroupListModelToJson(
        MBSTAGroupListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_name': instance.group_name,
      'wingName': instance.wingName,
    };

MBSTASchoolListModel _$MBSTASchoolListModelFromJson(
        Map<String, dynamic> json) =>
    MBSTASchoolListModel(
      json['id'],
      json['school_display_name'] as String?,
      json['school_value'] as String?,
    );

Map<String, dynamic> _$MBSTASchoolListModelToJson(
        MBSTASchoolListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

MBSTACentersModel _$MBSTACentersModelFromJson(Map<String, dynamic> json) =>
    MBSTACentersModel(
      json['id'],
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$MBSTACentersModelToJson(MBSTACentersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

MBSTAWingsModel _$MBSTAWingsModelFromJson(Map<String, dynamic> json) =>
    MBSTAWingsModel(
      json['id'],
      json['wingName'] as String?,
    );

Map<String, dynamic> _$MBSTAWingsModelToJson(MBSTAWingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
    };

MBSTARegionsModel _$MBSTARegionsModelFromJson(Map<String, dynamic> json) =>
    MBSTARegionsModel(
      json['id'],
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$MBSTARegionsModelToJson(MBSTARegionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

BSTFallSpringReportDataModel _$BSTFallSpringReportDataModelFromJson(
        Map<String, dynamic> json) =>
    BSTFallSpringReportDataModel(
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
      json['total_sessions'] as String?,
      json['report_wing_id'] as String?,
    );

Map<String, dynamic> _$BSTFallSpringReportDataModelToJson(
        BSTFallSpringReportDataModel instance) =>
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
      'total_sessions': instance.total_sessions,
      'report_wing_id': instance.report_wing_id,
    };
