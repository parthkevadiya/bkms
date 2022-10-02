// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventPaymentRequestModel _$EventPaymentRequestModelFromJson(
        Map<String, dynamic> json) =>
    EventPaymentRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as int,
      json['event_id'] as String,
      json['myevent_id'] as String,
      json['event_fee_amount'] as String,
      json['name_on_card'] as String,
      json['payment_card_number'] as String,
      json['payment_card_expiry_date'] as String,
      json['payment_card_cvv'] as String,
      json['payment_address_country'] as String,
      json['payment_address_1'] as String,
      json['payment_address_2'] as String,
      json['payment_address_city'] as String,
      json['payment_address_state'] as String,
      json['payment_address_zip'] as String,
      json['hidden_pay_cur_type'] as String,
      json['registration_fee'] as String,
    );

Map<String, dynamic> _$EventPaymentRequestModelToJson(
        EventPaymentRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'event_id': instance.event_id,
      'myevent_id': instance.myevent_id,
      'event_fee_amount': instance.event_fee_amount,
      'name_on_card': instance.name_on_card,
      'payment_card_number': instance.payment_card_number,
      'payment_card_expiry_date': instance.payment_card_expiry_date,
      'payment_card_cvv': instance.payment_card_cvv,
      'payment_address_country': instance.payment_address_country,
      'payment_address_1': instance.payment_address_1,
      'payment_address_2': instance.payment_address_2,
      'payment_address_city': instance.payment_address_city,
      'payment_address_state': instance.payment_address_state,
      'payment_address_zip': instance.payment_address_zip,
      'hidden_pay_cur_type': instance.hidden_pay_cur_type,
      'registration_fee': instance.registration_fee,
    };
