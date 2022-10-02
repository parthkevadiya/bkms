// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_hangout_report_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusHangoutReportDetailsModel _$CampusHangoutReportDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CampusHangoutReportDetailsModel(
      json['has_error'] as bool?,
      json['user_role_type'] as String?,
      json['campus_report_id'] as String?,
      json['campus_hangout_report_id'] as String?,
      json['campus_hangout_report'] == null
          ? null
          : VCampusHangoutReportModel.fromJson(
              json['campus_hangout_report'] as Map<String, dynamic>),
      json['hangout_question'] == null
          ? null
          : VHangoutQuestionModel.fromJson(
              json['hangout_question'] as Map<String, dynamic>),
      (json['school_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VSchoolListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['attendance_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VAttendanceListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CampusHangoutReportDetailsModelToJson(
        CampusHangoutReportDetailsModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'user_role_type': instance.user_role_type,
      'campus_report_id': instance.campus_report_id,
      'campus_hangout_report_id': instance.campus_hangout_report_id,
      'campus_hangout_report': instance.campus_hangout_report,
      'hangout_question': instance.hangout_question,
      'school_list': instance.school_list,
      'attendance_list': instance.attendance_list,
    };

VCampusHangoutReportModel _$VCampusHangoutReportModelFromJson(
        Map<String, dynamic> json) =>
    VCampusHangoutReportModel(
      json['id'] as String?,
      json['campus_report_id'] as String?,
      json['campus_hangout_date'] as String?,
      json['region_id'] as String?,
      json['center_id'] as String?,
      json['campus_id'] as String?,
      json['elligible_user_id'] as String?,
      json['wing_id'] as String?,
      json['report_type'] as String?,
      json['fall_year'] as String?,
      json['spring_year'] as String?,
      json['created_date'] as String?,
      json['created_by'] as String?,
      json['updated_date'],
      json['total_eligible_users'],
    );

Map<String, dynamic> _$VCampusHangoutReportModelToJson(
        VCampusHangoutReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'campus_report_id': instance.campus_report_id,
      'campus_hangout_date': instance.campus_hangout_date,
      'region_id': instance.region_id,
      'center_id': instance.center_id,
      'campus_id': instance.campus_id,
      'elligible_user_id': instance.elligible_user_id,
      'wing_id': instance.wing_id,
      'report_type': instance.report_type,
      'fall_year': instance.fall_year,
      'spring_year': instance.spring_year,
      'created_date': instance.created_date,
      'created_by': instance.created_by,
      'updated_date': instance.updated_date,
      'total_eligible_users': instance.total_eligible_users,
    };

VHangoutQuestionModel _$VHangoutQuestionModelFromJson(
        Map<String, dynamic> json) =>
    VHangoutQuestionModel(
      (json['form_fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VFormFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VHangoutQuestionModelToJson(
        VHangoutQuestionModel instance) =>
    <String, dynamic>{
      'form_fields': instance.form_fields,
    };

VFormFieldsModel _$VFormFieldsModelFromJson(Map<String, dynamic> json) =>
    VFormFieldsModel(
      json['label'] as String?,
      (json['fields'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VFieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VFormFieldsModelToJson(VFormFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'fields': instance.fields,
    };

VFieldsModel _$VFieldsModelFromJson(Map<String, dynamic> json) => VFieldsModel(
      json['label'] as String?,
      json['type'] as String?,
      json['name'] as String?,
      json['placeholder'] as String?,
      json['validation_message'] as String?,
      json['value'] as String?,
      json['help_text'] as String?,
      json['selected'] as String?,
      json['is_required'] as bool?,
      json['is_readonly'] as bool?,
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VOptionsItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VFieldsModelToJson(VFieldsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'type': instance.type,
      'name': instance.name,
      'placeholder': instance.placeholder,
      'validation_message': instance.validation_message,
      'value': instance.value,
      'help_text': instance.help_text,
      'selected': instance.selected,
      'is_required': instance.is_required,
      'is_readonly': instance.is_readonly,
      'options': instance.options,
    };

VOptionsItems _$VOptionsItemsFromJson(Map<String, dynamic> json) =>
    VOptionsItems(
      json['id'],
      json['value'] as String?,
      json['header'],
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$VOptionsItemsToJson(VOptionsItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'header': instance.header,
      'isSelected': instance.isSelected,
    };

VSchoolListModel _$VSchoolListModelFromJson(Map<String, dynamic> json) =>
    VSchoolListModel(
      json['id'],
      json['school_display_name'] as String?,
      json['school_value'] as String?,
    );

Map<String, dynamic> _$VSchoolListModelToJson(VSchoolListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

VAttendanceListModel _$VAttendanceListModelFromJson(
        Map<String, dynamic> json) =>
    VAttendanceListModel(
      json['user_id'] as String?,
      json['name'] as String?,
      json['grade'] as String?,
      json['email'] as String?,
      json['RegionName'] as String?,
      json['CenterName'] as String?,
      json['campus_name'] as String?,
      json['group_name'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$VAttendanceListModelToJson(
        VAttendanceListModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'name': instance.name,
      'grade': instance.grade,
      'email': instance.email,
      'RegionName': instance.RegionName,
      'CenterName': instance.CenterName,
      'campus_name': instance.campus_name,
      'group_name': instance.group_name,
      'status': instance.status,
    };
