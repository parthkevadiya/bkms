import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_transportation_details_request_model.g.dart';

@JsonSerializable()
class SubmitTransportationDetailsRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;
  final String event_id;
  final String userevent_id;
  final String transport_id;
  final ArrivalInformationRequestModel arrival_information;
  final DepartureInformationRequestModel departure_information;

  SubmitTransportationDetailsRequestModel(
      this.login_user_type,
      this.login_parent_type,
    this.bkms_id,
    this.event_id,
    this.userevent_id,
    this.transport_id,
    this.arrival_information,
    this.departure_information,
  );

  factory SubmitTransportationDetailsRequestModel.fromJson(Map<String, dynamic> json) => _$SubmitTransportationDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitTransportationDetailsRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}

@JsonSerializable()
class ArrivalInformationRequestModel {
  final String arrival_trans_type;
  final String need_pickup;
  final String arrival_date;
  final String arrival_time;
  final String origin_airport_id;
  final String arrival_destination_airport_id;
  final String arrival_airline;
  final String arrival_flight_no;

  ArrivalInformationRequestModel(
      this.arrival_trans_type,
      this.need_pickup,
      this.arrival_date,
      this.arrival_time,
      this.origin_airport_id,
      this.arrival_destination_airport_id,
      this.arrival_airline,
      this.arrival_flight_no);

  factory ArrivalInformationRequestModel.fromJson(Map<String, dynamic> json) => _$ArrivalInformationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArrivalInformationRequestModelToJson(this);
}

@JsonSerializable()
class DepartureInformationRequestModel {
  final String departure_trans_type;
  final String need_dropoff;
  final String departure_origin_airport_id;
  final String destination_airport;
  final String departure_date;
  final String departure_time;
  final String departure_airline;
  final String departure_flight_no;

  DepartureInformationRequestModel(
      this.departure_trans_type,
      this.need_dropoff,
      this.departure_origin_airport_id,
      this.destination_airport,
      this.departure_date,
      this.departure_time,
      this.departure_airline,
      this.departure_flight_no);

  factory DepartureInformationRequestModel.fromJson(Map<String, dynamic> json) => _$DepartureInformationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureInformationRequestModelToJson(this);
}