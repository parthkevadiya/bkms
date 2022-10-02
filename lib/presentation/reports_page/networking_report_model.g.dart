// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networking_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkingReportModel _$NetworkingReportModelFromJson(
        Map<String, dynamic> json) =>
    NetworkingReportModel(
      json['has_error'] as bool?,
      json['network_list'] == null
          ? null
          : NetworkListModel.fromJson(
              json['network_list'] as Map<String, dynamic>),
      json['filter_data'] == null
          ? null
          : FilterDataModel.fromJson(
              json['filter_data'] as Map<String, dynamic>),
    )..roleType = json['roleType'] as String?;

Map<String, dynamic> _$NetworkingReportModelToJson(
        NetworkingReportModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'network_list': instance.network_list,
      'filter_data': instance.filter_data,
      'roleType': instance.roleType,
    };

NetworkListModel _$NetworkListModelFromJson(Map<String, dynamic> json) =>
    NetworkListModel(
      json['current_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NetworkReportListDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String?,
      json['last_page_url'] as String?,
      json['next_page_url'] as String?,
      json['prev_page_url'] as String?,
      json['path'] as String?,
      json['from'] as int?,
      json['to'] as int?,
      json['last_page'] as int?,
      json['per_page'] as int?,
      json['total'] as int?,
    );

Map<String, dynamic> _$NetworkListModelToJson(NetworkListModel instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'first_page_url': instance.first_page_url,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'prev_page_url': instance.prev_page_url,
      'path': instance.path,
      'from': instance.from,
      'to': instance.to,
      'last_page': instance.last_page,
      'per_page': instance.per_page,
      'total': instance.total,
    };

NetworkReportListDataModel _$NetworkReportListDataModelFromJson(
        Map<String, dynamic> json) =>
    NetworkReportListDataModel(
      json['id'] as String?,
      json['center_id'] as String?,
      json['CenterName'] as String?,
      json['RegionName'] as String?,
      json['wingname'] as String?,
      json['reportdate'] as String?,
      json['current_networking_targetuser'] as String?,
      json['current_networking_targetuser_id'] as String?,
      json['networking_targetuser_id'] as String?,
      json['total_user_interaction'] as String?,
      json['total_parent_interaction'] as String?,
      json['total_ratio'] as String?,
    );

Map<String, dynamic> _$NetworkReportListDataModelToJson(
        NetworkReportListDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'center_id': instance.center_id,
      'CenterName': instance.CenterName,
      'RegionName': instance.RegionName,
      'wingname': instance.wingname,
      'reportdate': instance.reportdate,
      'current_networking_targetuser': instance.current_networking_targetuser,
      'current_networking_targetuser_id':
          instance.current_networking_targetuser_id,
      'networking_targetuser_id': instance.networking_targetuser_id,
      'total_user_interaction': instance.total_user_interaction,
      'total_parent_interaction': instance.total_parent_interaction,
      'total_ratio': instance.total_ratio,
    };

FilterDataModel _$FilterDataModelFromJson(Map<String, dynamic> json) =>
    FilterDataModel(
      json['user_role_type'] as String?,
      json['user_region_id'] as String?,
      json['user_center_id'] as String?,
      (json['regions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NTWRKRegionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['centers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NTWRKCentersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['report_center'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NTWRKReportCenterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['years'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$FilterDataModelToJson(FilterDataModel instance) =>
    <String, dynamic>{
      'user_role_type': instance.user_role_type,
      'user_region_id': instance.user_region_id,
      'user_center_id': instance.user_center_id,
      'regions': instance.regions,
      'centers': instance.centers,
      'report_center': instance.report_center,
      'years': instance.years,
    };

NTWRKRegionsModel _$NTWRKRegionsModelFromJson(Map<String, dynamic> json) =>
    NTWRKRegionsModel(
      json['id'] as int?,
      json['RegionName'] as String?,
    );

Map<String, dynamic> _$NTWRKRegionsModelToJson(NTWRKRegionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

NTWRKCentersModel _$NTWRKCentersModelFromJson(Map<String, dynamic> json) =>
    NTWRKCentersModel(
      json['id'] as int?,
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$NTWRKCentersModelToJson(NTWRKCentersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

NTWRKReportCenterModel _$NTWRKReportCenterModelFromJson(
        Map<String, dynamic> json) =>
    NTWRKReportCenterModel(
      json['id'] as int?,
      json['CenterName'] as String?,
      json['RegionId'] as String?,
    );

Map<String, dynamic> _$NTWRKReportCenterModelToJson(
        NTWRKReportCenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };
