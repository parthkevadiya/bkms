import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_payment_model.g.dart';

@JsonSerializable()
class EventPaymentModel /*extends Equatable*/ {
  final bool has_error;

  EventPaymentModel(this.has_error);

  factory EventPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$EventPaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventPaymentModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}