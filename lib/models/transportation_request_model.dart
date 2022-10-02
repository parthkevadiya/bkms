import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transportation_request_model.g.dart';

@JsonSerializable()
class TransportationRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String bkms_id;
  final String event_id;
  final String userevent_id;

  TransportationRequestModel(
      this.login_user_type,
      this.login_parent_type,
    this.bkms_id,
    this.event_id,
    this.userevent_id,
  );

  factory TransportationRequestModel.fromJson(Map<String, dynamic> json) => _$TransportationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransportationRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}