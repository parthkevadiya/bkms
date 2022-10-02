import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_detail_request.g.dart';

@JsonSerializable()
class EventDetailRequestModel /*extends Equatable*/ {
  final String bkms_id;
  final String event_id;

  EventDetailRequestModel(
    this.bkms_id,
    this.event_id,
  );

  factory EventDetailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventDetailRequestModelToJson(this);

/*@override
  List<Object> get props => [bkms_id];*/
}
