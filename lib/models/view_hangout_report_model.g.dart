// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_hangout_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewHangoutReportModel _$ViewHangoutReportModelFromJson(
        Map<String, dynamic> json) =>
    ViewHangoutReportModel(
      json['has_error'] as bool?,
      json['hangout_result'] == null
          ? null
          : ViewHangoutResultModel.fromJson(
              json['hangout_result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewHangoutReportModelToJson(
        ViewHangoutReportModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'hangout_result': instance.hangout_result,
    };

ViewHangoutResultModel _$ViewHangoutResultModelFromJson(
        Map<String, dynamic> json) =>
    ViewHangoutResultModel(
      json['total'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ViewHangoutDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViewHangoutResultModelToJson(
        ViewHangoutResultModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

ViewHangoutDataModel _$ViewHangoutDataModelFromJson(
        Map<String, dynamic> json) =>
    ViewHangoutDataModel(
      json['id'] as String?,
      json['report_type'] as String?,
      json['report_year'] as String?,
      json['wing_id'] as String?,
      json['campus_hangout_date_updated'] as String?,
      json['name'] as String?,
      json['reportdate'] as String?,
      json['total_students'] as String?,
      json['total_attendees'] as String?,
    );

Map<String, dynamic> _$ViewHangoutDataModelToJson(
        ViewHangoutDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'report_type': instance.report_type,
      'report_year': instance.report_year,
      'wing_id': instance.wing_id,
      'campus_hangout_date_updated': instance.campus_hangout_date_updated,
      'name': instance.name,
      'reportdate': instance.reportdate,
      'total_students': instance.total_students,
      'total_attendees': instance.total_attendees,
    };
