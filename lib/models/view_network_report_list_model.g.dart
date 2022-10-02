// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_network_report_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewNetworkingReportListModel _$ViewNetworkingReportListModelFromJson(
        Map<String, dynamic> json) =>
    ViewNetworkingReportListModel(
      json['has_error'] as bool?,
      json['networking_list'] == null
          ? null
          : NetworkingListModel.fromJson(
              json['networking_list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewNetworkingReportListModelToJson(
        ViewNetworkingReportListModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'networking_list': instance.networking_list,
    };

NetworkingListModel _$NetworkingListModelFromJson(Map<String, dynamic> json) =>
    NetworkingListModel(
      json['current_page'] as int?,
      json['total'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NetworkingListDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkingListModelToJson(
        NetworkingListModel instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'total': instance.total,
      'data': instance.data,
    };

NetworkingListDataModel _$NetworkingListDataModelFromJson(
        Map<String, dynamic> json) =>
    NetworkingListDataModel(
      json['user_id'] as String?,
      json['user_name'] as String?,
      json['total_user_interaction'] as String?,
      json['total_parent_interaction'] as String?,
      json['current_networking_user'] as String?,
    );

Map<String, dynamic> _$NetworkingListDataModelToJson(
        NetworkingListDataModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'total_user_interaction': instance.total_user_interaction,
      'total_parent_interaction': instance.total_parent_interaction,
      'current_networking_user': instance.current_networking_user,
    };
