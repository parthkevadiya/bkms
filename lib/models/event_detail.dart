import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_detail.g.dart';

@JsonSerializable()
class EventDetailModel /*extends Equatable*/ {
  final String name;
  final String country;
  final String date_time;
  final String? image;
  final String? description;

  EventDetailModel(
    this.name,
    this.country,
    this.date_time,
    this.image,
    this.description,
  );

  factory EventDetailModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventDetailModelToJson(this);

/*@override
  List<Object> get props => [bkms_id];*/
}
