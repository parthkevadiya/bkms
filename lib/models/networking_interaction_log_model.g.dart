// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networking_interaction_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkingInteractionLogModel _$NetworkingInteractionLogModelFromJson(
        Map<String, dynamic> json) =>
    NetworkingInteractionLogModel(
      json['has_error'] as bool?,
      json['interaction_log_list'] == null
          ? null
          : InteractionLogListModel.fromJson(
              json['interaction_log_list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkingInteractionLogModelToJson(
        NetworkingInteractionLogModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'interaction_log_list': instance.interaction_log_list,
    };

InteractionLogListModel _$InteractionLogListModelFromJson(
        Map<String, dynamic> json) =>
    InteractionLogListModel(
      json['current_page'] as int?,
      json['total'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : InteractionLogDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InteractionLogListModelToJson(
        InteractionLogListModel instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'total': instance.total,
      'data': instance.data,
    };

InteractionLogDataModel _$InteractionLogDataModelFromJson(
        Map<String, dynamic> json) =>
    InteractionLogDataModel(
      json['id'] as String?,
      json['FirstName'] as String?,
      json['LastName'] as String?,
      json['interaction_date'] as String?,
      json['interaction_type'] as String?,
      json['name'] as String?,
      json['event_name'] as String?,
      json['reportdate'] as String?,
    );

Map<String, dynamic> _$InteractionLogDataModelToJson(
        InteractionLogDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'interaction_date': instance.interaction_date,
      'interaction_type': instance.interaction_type,
      'name': instance.name,
      'event_name': instance.event_name,
      'reportdate': instance.reportdate,
    };
