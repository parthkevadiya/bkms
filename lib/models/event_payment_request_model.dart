import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_payment_request_model.g.dart';

@JsonSerializable()
class EventPaymentRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final int bkms_id;
  final String event_id;
  final String myevent_id;
  final String event_fee_amount;
  final String name_on_card;
  final String payment_card_number;
  final String payment_card_expiry_date;
  final String payment_card_cvv;
  final String payment_address_country;
  final String payment_address_1;
  final String payment_address_2;
  final String payment_address_city;
  final String payment_address_state;
  final String payment_address_zip;
  final String hidden_pay_cur_type;
  final String registration_fee;

  EventPaymentRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.bkms_id,
      this.event_id,
      this.myevent_id,
      this.event_fee_amount,
      this.name_on_card,
      this.payment_card_number,
      this.payment_card_expiry_date,
      this.payment_card_cvv,
      this.payment_address_country,
      this.payment_address_1,
      this.payment_address_2,
      this.payment_address_city,
      this.payment_address_state,
      this.payment_address_zip,
      this.hidden_pay_cur_type,
      this.registration_fee);

  factory EventPaymentRequestModel.fromJson(Map<String, dynamic> json) => _$EventPaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventPaymentRequestModelToJson(this);

/*@override
  List<Object> get props => [bkms_id];*/
}