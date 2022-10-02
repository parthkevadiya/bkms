// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_transportation_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitTransportationDetailsRequestModel
    _$SubmitTransportationDetailsRequestModelFromJson(
            Map<String, dynamic> json) =>
        SubmitTransportationDetailsRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['bkms_id'] as String,
          json['event_id'] as String,
          json['userevent_id'] as String,
          json['transport_id'] as String,
          ArrivalInformationRequestModel.fromJson(
              json['arrival_information'] as Map<String, dynamic>),
          DepartureInformationRequestModel.fromJson(
              json['departure_information'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SubmitTransportationDetailsRequestModelToJson(
        SubmitTransportationDetailsRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'event_id': instance.event_id,
      'userevent_id': instance.userevent_id,
      'transport_id': instance.transport_id,
      'arrival_information': instance.arrival_information,
      'departure_information': instance.departure_information,
    };

ArrivalInformationRequestModel _$ArrivalInformationRequestModelFromJson(
        Map<String, dynamic> json) =>
    ArrivalInformationRequestModel(
      json['arrival_trans_type'] as String,
      json['need_pickup'] as String,
      json['arrival_date'] as String,
      json['arrival_time'] as String,
      json['origin_airport_id'] as String,
      json['arrival_destination_airport_id'] as String,
      json['arrival_airline'] as String,
      json['arrival_flight_no'] as String,
    );

Map<String, dynamic> _$ArrivalInformationRequestModelToJson(
        ArrivalInformationRequestModel instance) =>
    <String, dynamic>{
      'arrival_trans_type': instance.arrival_trans_type,
      'need_pickup': instance.need_pickup,
      'arrival_date': instance.arrival_date,
      'arrival_time': instance.arrival_time,
      'origin_airport_id': instance.origin_airport_id,
      'arrival_destination_airport_id': instance.arrival_destination_airport_id,
      'arrival_airline': instance.arrival_airline,
      'arrival_flight_no': instance.arrival_flight_no,
    };

DepartureInformationRequestModel _$DepartureInformationRequestModelFromJson(
        Map<String, dynamic> json) =>
    DepartureInformationRequestModel(
      json['departure_trans_type'] as String,
      json['need_dropoff'] as String,
      json['departure_origin_airport_id'] as String,
      json['destination_airport'] as String,
      json['departure_date'] as String,
      json['departure_time'] as String,
      json['departure_airline'] as String,
      json['departure_flight_no'] as String,
    );

Map<String, dynamic> _$DepartureInformationRequestModelToJson(
        DepartureInformationRequestModel instance) =>
    <String, dynamic>{
      'departure_trans_type': instance.departure_trans_type,
      'need_dropoff': instance.need_dropoff,
      'departure_origin_airport_id': instance.departure_origin_airport_id,
      'destination_airport': instance.destination_airport,
      'departure_date': instance.departure_date,
      'departure_time': instance.departure_time,
      'departure_airline': instance.departure_airline,
      'departure_flight_no': instance.departure_flight_no,
    };
