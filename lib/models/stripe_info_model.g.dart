// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripeInfoModel _$StripeInfoModelFromJson(Map<String, dynamic> json) =>
    StripeInfoModel(
      json['client_id'] as String,
      json['client_secret'] as String,
      json['payment_type'] as String,
      json['event_id'] as String,
      json['user_id'] as String,
      json['myevent_id'] as int,
      (json['registration_fees'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : RegistrationFeesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['current_state_record'] == null
          ? null
          : CurrentStateRecordModel.fromJson(
              json['current_state_record'] as Map<String, dynamic>),
      json['current_country_record'] == null
          ? null
          : CurrentCountryRecordModel.fromJson(
              json['current_country_record'] as Map<String, dynamic>),
      (json['payment_country'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PaymentCountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['payment_state'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PaymentStateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      LateFeeModel.fromJson(json['late_fee'] as Map<String, dynamic>),
      MainEventDataModel.fromJson(
          json['main_event_data'] as Map<String, dynamic>),
      json['payable_amonunt'] as int,
    );

Map<String, dynamic> _$StripeInfoModelToJson(StripeInfoModel instance) =>
    <String, dynamic>{
      'client_id': instance.client_id,
      'client_secret': instance.client_secret,
      'payment_type': instance.payment_type,
      'event_id': instance.event_id,
      'user_id': instance.user_id,
      'myevent_id': instance.myevent_id,
      'registration_fees': instance.registration_fees,
      'current_state_record': instance.current_state_record,
      'current_country_record': instance.current_country_record,
      'payment_country': instance.payment_country,
      'payment_state': instance.payment_state,
      'late_fee': instance.late_fee,
      'main_event_data': instance.main_event_data,
      'payable_amonunt': instance.payable_amonunt,
    };

RegistrationFeesModel _$RegistrationFeesModelFromJson(
        Map<String, dynamic> json) =>
    RegistrationFeesModel(
      json['id'] as String,
      json['event_id'] as String,
      json['fee_type'] as String,
      json['description'] as String,
      json['early_fee'] as String,
      json['regular_fee'] as String,
      json['max_attendee'] as String,
      json['family_room'] as String,
      json['status'] as String,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['total_paid_users'] as String,
    );

Map<String, dynamic> _$RegistrationFeesModelToJson(
        RegistrationFeesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.event_id,
      'fee_type': instance.fee_type,
      'description': instance.description,
      'early_fee': instance.early_fee,
      'regular_fee': instance.regular_fee,
      'max_attendee': instance.max_attendee,
      'family_room': instance.family_room,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'total_paid_users': instance.total_paid_users,
    };

CurrentStateRecordModel _$CurrentStateRecordModelFromJson(
        Map<String, dynamic> json) =>
    CurrentStateRecordModel(
      json['id'] as String,
      json['state_code'] as String,
      json['name'] as String,
      json['country_id'] as String,
    );

Map<String, dynamic> _$CurrentStateRecordModelToJson(
        CurrentStateRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state_code': instance.state_code,
      'name': instance.name,
      'country_id': instance.country_id,
    };

CurrentCountryRecordModel _$CurrentCountryRecordModelFromJson(
        Map<String, dynamic> json) =>
    CurrentCountryRecordModel(
      json['id'] as int,
      json['country_name'] as String,
      json['payment_gateway'] as String,
    );

Map<String, dynamic> _$CurrentCountryRecordModelToJson(
        CurrentCountryRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_name': instance.country_name,
      'payment_gateway': instance.payment_gateway,
    };

PaymentCountryModel _$PaymentCountryModelFromJson(Map<String, dynamic> json) =>
    PaymentCountryModel(
      json['id'] as String,
      json['country_name'] as String,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$PaymentCountryModelToJson(
        PaymentCountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_name': instance.country_name,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

PaymentStateModel _$PaymentStateModelFromJson(Map<String, dynamic> json) =>
    PaymentStateModel(
      json['id'] as String,
      json['name'] as String,
      json['country_id'] as String,
    );

Map<String, dynamic> _$PaymentStateModelToJson(PaymentStateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.country_id,
    };

MainEventDataModel _$MainEventDataModelFromJson(Map<String, dynamic> json) =>
    MainEventDataModel(
      json['id'] as int,
      json['early_reg_start_date'] as String,
      json['reg_start_date'] as String,
      json['reg_end_date'] as String,
      json['event_start_date'] as String,
      json['event_end_date'] as String,
    );

Map<String, dynamic> _$MainEventDataModelToJson(MainEventDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'early_reg_start_date': instance.early_reg_start_date,
      'reg_start_date': instance.reg_start_date,
      'reg_end_date': instance.reg_end_date,
      'event_start_date': instance.event_start_date,
      'event_end_date': instance.event_end_date,
    };

LateFeeModel _$LateFeeModelFromJson(Map<String, dynamic> json) => LateFeeModel(
      json['id'] as String,
      json['fee_type'] as String,
      json['description'] as String,
      json['regular_fee'] as String,
    );

Map<String, dynamic> _$LateFeeModelToJson(LateFeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fee_type': instance.fee_type,
      'description': instance.description,
      'regular_fee': instance.regular_fee,
    };
