import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'read_notification_model.g.dart';

@JsonSerializable()
class ReadNotificationModel /*extends Equatable*/ {
  final bool has_error;

  ReadNotificationModel(this.has_error);

  factory ReadNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$ReadNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReadNotificationModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}