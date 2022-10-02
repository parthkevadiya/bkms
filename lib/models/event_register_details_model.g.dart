// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_register_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventRegisterDetailsModel _$EventRegisterDetailsModelFromJson(
        Map<String, dynamic> json) =>
    EventRegisterDetailsModel(
      json['registration_status'] as String?,
      json['basic_registration_status'] as String?,
      json['basic_registration_description'] as String?,
      json['liability_form_status'] as String?,
      json['liability_form_description'] as String?,
      json['registration_fee_status'] as String?,
      json['registration_fee_description'] as String?,
      json['transportation_details_status'] as String?,
      json['transportation_details_description'] as String?,
      json['checkin_status'] as String?,
      json['checkin_description'] as String?,
      json['has_registration_fee'] as String?,
      json['has_transportation'] as String?,
      json['has_checked_in'] as String?,
      json['has_basic_registration'] as String?,
      json['userevent_id'] as String?,
    );

Map<String, dynamic> _$EventRegisterDetailsModelToJson(
        EventRegisterDetailsModel instance) =>
    <String, dynamic>{
      'registration_status': instance.registration_status,
      'basic_registration_status': instance.basic_registration_status,
      'has_basic_registration': instance.has_basic_registration,
      'basic_registration_description': instance.basic_registration_description,
      'liability_form_status': instance.liability_form_status,
      'liability_form_description': instance.liability_form_description,
      'has_registration_fee': instance.has_registration_fee,
      'registration_fee_status': instance.registration_fee_status,
      'registration_fee_description': instance.registration_fee_description,
      'transportation_details_status': instance.transportation_details_status,
      'has_transportation': instance.has_transportation,
      'transportation_details_description':
          instance.transportation_details_description,
      'checkin_status': instance.checkin_status,
      'has_checked_in': instance.has_checked_in,
      'checkin_description': instance.checkin_description,
      'userevent_id': instance.userevent_id,
    };
