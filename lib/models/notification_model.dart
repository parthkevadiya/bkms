import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel /*extends Equatable*/ {
  final bool? has_error;
  final int? count;
  @JsonKey(defaultValue: [])
  final List<NotificationListModel?> notification_list;

  NotificationModel(this.has_error, this.count, this.notification_list);

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}

@JsonSerializable()
class NotificationListModel {
  final String? id;
  final String? name;
  final String? details;
  final String? user_id;
  String? is_read;
  final String? redirection_type;
  final String? image;

  NotificationListModel(
    this.id,
    this.name,
    this.details,
    this.user_id,
    this.is_read,
    this.redirection_type,
    this.image,
  );

  factory NotificationListModel.fromJson(Map<String, dynamic> json) => _$NotificationListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationListModelToJson(this);
}
