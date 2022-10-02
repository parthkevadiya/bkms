import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_register_details_model.g.dart';

@JsonSerializable()
class EventRegisterDetailsModel /*extends Equatable*/ {
  final String? registration_status;

  String? basic_registration_status;
  String? has_basic_registration;
  final String? basic_registration_description;

  String? liability_form_status;
  final String? liability_form_description;

  String? has_registration_fee;
  String? registration_fee_status;
  final String? registration_fee_description;

  String? transportation_details_status;
  String? has_transportation;
  final String? transportation_details_description;

  String? checkin_status;
  String? has_checked_in;
  final String? checkin_description;

  final String? userevent_id;

  EventRegisterDetailsModel(
    this.registration_status,
    this.basic_registration_status,
    this.basic_registration_description,
    this.liability_form_status,
    this.liability_form_description,
    this.registration_fee_status,
    this.registration_fee_description,
    this.transportation_details_status,
    this.transportation_details_description,
    this.checkin_status,
    this.checkin_description,
    this.has_registration_fee,
    this.has_transportation,
    this.has_checked_in,
    this.has_basic_registration,
    this.userevent_id,
  );

  factory EventRegisterDetailsModel.fromJson(Map<String, dynamic> json) => _$EventRegisterDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventRegisterDetailsModelToJson(this);

/*@override
  List<Object> get props => [name];*/
}
