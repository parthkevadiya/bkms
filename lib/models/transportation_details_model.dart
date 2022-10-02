import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transportation_details_model.g.dart';

@JsonSerializable()
class TransportationsDetailsModel /*extends Equatable*/ {
  final int? transport_id;
  final TransportSelectedModel? transport_selected;
  final ArrivalInformationModel arrival_information;
  final DepartureInformationModel departure_information;

  TransportationsDetailsModel(this.transport_id, this.transport_selected, this.arrival_information, this.departure_information);

  factory TransportationsDetailsModel.fromJson(Map<String, dynamic> json) => _$TransportationsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransportationsDetailsModelToJson(this);

/*@override
  List<Object> get props => [name];*/
}

@JsonSerializable()
class ArrivalInformationModel {
  final List<TransportTypeModel?>? transport_type;
  final List<NeedPickUpModel?>? need_pick_up;
  final List<OriginAirportModel?>? origin_airport;
  final List<DestinationAirportModel?>? destination_airport;

  ArrivalInformationModel(this.transport_type, this.need_pick_up, this.origin_airport, this.destination_airport);

  factory ArrivalInformationModel.fromJson(Map<String, dynamic> json) => _$ArrivalInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArrivalInformationModelToJson(this);
}

@JsonSerializable()
class DepartureInformationModel {
  final List<TransportTypeModel?>? transport_type;
  final List<NeedDropOffModel?>? need_drop_off;
  final List<OriginAirportModel?>? origin_airport;
  final List<DestinationAirportModel?>? destination_airport;

  DepartureInformationModel(this.transport_type, this.need_drop_off, this.origin_airport, this.destination_airport);

  factory DepartureInformationModel.fromJson(Map<String, dynamic> json) => _$DepartureInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureInformationModelToJson(this);
}

@JsonSerializable()
class TransportTypeModel {
  final int? id;
  final String? name;

  TransportTypeModel(this.id, this.name);

  factory TransportTypeModel.fromJson(Map<String, dynamic> json) => _$TransportTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransportTypeModelToJson(this);
}

@JsonSerializable()
class NeedPickUpModel {
  final int? id;
  final String? name;

  NeedPickUpModel(this.id, this.name);

  factory NeedPickUpModel.fromJson(Map<String, dynamic> json) => _$NeedPickUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeedPickUpModelToJson(this);
}

@JsonSerializable()
class NeedDropOffModel {
  final int? id;
  final String? name;

  NeedDropOffModel(this.id, this.name);

  factory NeedDropOffModel.fromJson(Map<String, dynamic> json) => _$NeedDropOffModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeedDropOffModelToJson(this);
}

@JsonSerializable()
class OriginAirportModel {
  final int? id;
  final String? name;

  OriginAirportModel(this.id, this.name);

  factory OriginAirportModel.fromJson(Map<String, dynamic> json) => _$OriginAirportModelFromJson(json);

  Map<String, dynamic> toJson() => _$OriginAirportModelToJson(this);
}

@JsonSerializable()
class DestinationAirportModel {
  final int? id;
  final String? name;

  DestinationAirportModel(this.id, this.name);

  factory DestinationAirportModel.fromJson(Map<String, dynamic> json) => _$DestinationAirportModelFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationAirportModelToJson(this);
}

@JsonSerializable()
class TransportSelectedModel {
  final SelectedArrivalInformationModel arrival_information;
  final SelectedDepartureInformationModel departure_information;

  TransportSelectedModel(this.arrival_information, this.departure_information);

  factory TransportSelectedModel.fromJson(Map<String, dynamic> json) => _$TransportSelectedModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransportSelectedModelToJson(this);
}

@JsonSerializable()
class SelectedArrivalInformationModel {
  final String? arrival_trans_type;
  final String? need_pickup;
  final String? arrival_date;
  final String? arrival_time;
  final String? origin_airport_id;
  final String? arrival_destination_airport_id;
  final String? arrival_airline;
  final String? arrival_flight_no;

  SelectedArrivalInformationModel(
      this.arrival_trans_type,
      this.need_pickup,
      this.arrival_date,
      this.arrival_time,
      this.origin_airport_id,
      this.arrival_destination_airport_id,
      this.arrival_airline,
      this.arrival_flight_no);

  factory SelectedArrivalInformationModel.fromJson(Map<String, dynamic> json) => _$SelectedArrivalInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedArrivalInformationModelToJson(this);
}

@JsonSerializable()
class SelectedDepartureInformationModel {
  final String? departure_trans_type;
  final String? need_dropoff;
  final String? departure_origin_airport_id;
  final String? destination_airport;
  final String? departure_date;
  final String? departure_time;
  final String? departure_airline;
  final String? departure_flight_no;

  SelectedDepartureInformationModel(
      this.departure_trans_type,
      this.need_dropoff,
      this.departure_origin_airport_id,
      this.destination_airport,
      this.departure_date,
      this.departure_time,
      this.departure_airline,
      this.departure_flight_no);

  factory SelectedDepartureInformationModel.fromJson(Map<String, dynamic> json) => _$SelectedDepartureInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedDepartureInformationModelToJson(this);
}