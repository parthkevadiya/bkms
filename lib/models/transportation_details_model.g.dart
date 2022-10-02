// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transportation_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportationsDetailsModel _$TransportationsDetailsModelFromJson(
        Map<String, dynamic> json) =>
    TransportationsDetailsModel(
      json['transport_id'] as int?,
      json['transport_selected'] == null
          ? null
          : TransportSelectedModel.fromJson(
              json['transport_selected'] as Map<String, dynamic>),
      ArrivalInformationModel.fromJson(
          json['arrival_information'] as Map<String, dynamic>),
      DepartureInformationModel.fromJson(
          json['departure_information'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransportationsDetailsModelToJson(
        TransportationsDetailsModel instance) =>
    <String, dynamic>{
      'transport_id': instance.transport_id,
      'transport_selected': instance.transport_selected,
      'arrival_information': instance.arrival_information,
      'departure_information': instance.departure_information,
    };

ArrivalInformationModel _$ArrivalInformationModelFromJson(
        Map<String, dynamic> json) =>
    ArrivalInformationModel(
      (json['transport_type'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TransportTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['need_pick_up'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NeedPickUpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['origin_airport'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OriginAirportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['destination_airport'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : DestinationAirportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArrivalInformationModelToJson(
        ArrivalInformationModel instance) =>
    <String, dynamic>{
      'transport_type': instance.transport_type,
      'need_pick_up': instance.need_pick_up,
      'origin_airport': instance.origin_airport,
      'destination_airport': instance.destination_airport,
    };

DepartureInformationModel _$DepartureInformationModelFromJson(
        Map<String, dynamic> json) =>
    DepartureInformationModel(
      (json['transport_type'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TransportTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['need_drop_off'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NeedDropOffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['origin_airport'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OriginAirportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['destination_airport'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : DestinationAirportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepartureInformationModelToJson(
        DepartureInformationModel instance) =>
    <String, dynamic>{
      'transport_type': instance.transport_type,
      'need_drop_off': instance.need_drop_off,
      'origin_airport': instance.origin_airport,
      'destination_airport': instance.destination_airport,
    };

TransportTypeModel _$TransportTypeModelFromJson(Map<String, dynamic> json) =>
    TransportTypeModel(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$TransportTypeModelToJson(TransportTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

NeedPickUpModel _$NeedPickUpModelFromJson(Map<String, dynamic> json) =>
    NeedPickUpModel(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$NeedPickUpModelToJson(NeedPickUpModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

NeedDropOffModel _$NeedDropOffModelFromJson(Map<String, dynamic> json) =>
    NeedDropOffModel(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$NeedDropOffModelToJson(NeedDropOffModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OriginAirportModel _$OriginAirportModelFromJson(Map<String, dynamic> json) =>
    OriginAirportModel(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$OriginAirportModelToJson(OriginAirportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

DestinationAirportModel _$DestinationAirportModelFromJson(
        Map<String, dynamic> json) =>
    DestinationAirportModel(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$DestinationAirportModelToJson(
        DestinationAirportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TransportSelectedModel _$TransportSelectedModelFromJson(
        Map<String, dynamic> json) =>
    TransportSelectedModel(
      SelectedArrivalInformationModel.fromJson(
          json['arrival_information'] as Map<String, dynamic>),
      SelectedDepartureInformationModel.fromJson(
          json['departure_information'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransportSelectedModelToJson(
        TransportSelectedModel instance) =>
    <String, dynamic>{
      'arrival_information': instance.arrival_information,
      'departure_information': instance.departure_information,
    };

SelectedArrivalInformationModel _$SelectedArrivalInformationModelFromJson(
        Map<String, dynamic> json) =>
    SelectedArrivalInformationModel(
      json['arrival_trans_type'] as String?,
      json['need_pickup'] as String?,
      json['arrival_date'] as String?,
      json['arrival_time'] as String?,
      json['origin_airport_id'] as String?,
      json['arrival_destination_airport_id'] as String?,
      json['arrival_airline'] as String?,
      json['arrival_flight_no'] as String?,
    );

Map<String, dynamic> _$SelectedArrivalInformationModelToJson(
        SelectedArrivalInformationModel instance) =>
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

SelectedDepartureInformationModel _$SelectedDepartureInformationModelFromJson(
        Map<String, dynamic> json) =>
    SelectedDepartureInformationModel(
      json['departure_trans_type'] as String?,
      json['need_dropoff'] as String?,
      json['departure_origin_airport_id'] as String?,
      json['destination_airport'] as String?,
      json['departure_date'] as String?,
      json['departure_time'] as String?,
      json['departure_airline'] as String?,
      json['departure_flight_no'] as String?,
    );

Map<String, dynamic> _$SelectedDepartureInformationModelToJson(
        SelectedDepartureInformationModel instance) =>
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
