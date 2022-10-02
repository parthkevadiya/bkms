// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      json['has_error'] as bool?,
      json['count'] as int?,
      (json['notification_list'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : NotificationListModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'count': instance.count,
      'notification_list': instance.notification_list,
    };

NotificationListModel _$NotificationListModelFromJson(
        Map<String, dynamic> json) =>
    NotificationListModel(
      json['id'] as String?,
      json['name'] as String?,
      json['details'] as String?,
      json['user_id'] as String?,
      json['is_read'] as String?,
      json['redirection_type'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$NotificationListModelToJson(
        NotificationListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'user_id': instance.user_id,
      'is_read': instance.is_read,
      'redirection_type': instance.redirection_type,
      'image': instance.image,
    };
