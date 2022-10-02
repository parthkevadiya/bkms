// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) => RecordModel(
      json['file_url'],
      json['total_reocrds'],
      (json['records'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : RecordsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['filter'] == null
          ? null
          : RecordsFilters.fromJson(json['filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecordModelToJson(RecordModel instance) =>
    <String, dynamic>{
      'file_url': instance.file_url,
      'total_reocrds': instance.total_reocrds,
      'records': instance.records,
      'filter': instance.filter,
    };

RecordsFilters _$RecordsFiltersFromJson(Map<String, dynamic> json) =>
    RecordsFilters(
      SelectedFilters.fromJson(json['selected_filter'] as Map<String, dynamic>),
      json['gender'] as String,
      (json['wing'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : WingF.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['school_year'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : SchoolYear.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['region'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Region.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['center'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : CenterF.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['user_group'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : UserGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$RecordsFiltersToJson(RecordsFilters instance) =>
    <String, dynamic>{
      'selected_filter': instance.selected_filter,
      'gender': instance.gender,
      'wing': instance.wing,
      'school_year': instance.school_year,
      'region': instance.region,
      'center': instance.center,
      'user_group': instance.user_group,
    };

SelectedFilters _$SelectedFiltersFromJson(Map<String, dynamic> json) =>
    SelectedFilters(
      json['gender'],
      json['wing'] as String,
      json['school_year'] as String,
      json['region'] as String,
      json['center'] as String,
      json['user_group'] as String,
    );

Map<String, dynamic> _$SelectedFiltersToJson(SelectedFilters instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'wing': instance.wing,
      'school_year': instance.school_year,
      'region': instance.region,
      'center': instance.center,
      'user_group': instance.user_group,
    };

CenterF _$CenterFFromJson(Map<String, dynamic> json) => CenterF(
      json['id'] as int,
      json['CenterName'] as String,
      json['RegionId'] as String,
    );

Map<String, dynamic> _$CenterFToJson(CenterF instance) => <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

UserGroup _$UserGroupFromJson(Map<String, dynamic> json) => UserGroup(
      json['group_name'] as String,
    );

Map<String, dynamic> _$UserGroupToJson(UserGroup instance) => <String, dynamic>{
      'group_name': instance.group_name,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      json['id'] as int,
      json['RegionName'] as String,
      json['RegionShortName'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
      'RegionShortName': instance.RegionShortName,
    };

SchoolYear _$SchoolYearFromJson(Map<String, dynamic> json) => SchoolYear(
      json['id'] as int,
      json['school_display_name'] as String,
      json['school_value'] as String,
    );

Map<String, dynamic> _$SchoolYearToJson(SchoolYear instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

WingF _$WingFFromJson(Map<String, dynamic> json) => WingF(
      json['id'] as int,
      json['wingName'] as String,
      json['gender'] as String,
    );

Map<String, dynamic> _$WingFToJson(WingF instance) => <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
      'gender': instance.gender,
    };

RecordsItem _$RecordsItemFromJson(Map<String, dynamic> json) => RecordsItem(
      json['id'] as int,
      json['name'] as String?,
      json['image'] as String?,
      json['region'] as String?,
      json['region_id'] as String?,
      json['current_wing'] as String?,
      json['current_wing_name'] as String?,
      json['gender'] as String?,
      json['school_year'] as String?,
      json['center'] as String?,
      json['center_id'] as String?,
      json['email'] as String?,
      json['phone_cell'] as String?,
    );

Map<String, dynamic> _$RecordsItemToJson(RecordsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'region': instance.region,
      'region_id': instance.region_id,
      'current_wing': instance.current_wing,
      'current_wing_name': instance.current_wing_name,
      'gender': instance.gender,
      'school_year': instance.school_year,
      'center': instance.center,
      'center_id': instance.center_id,
      'email': instance.email,
      'phone_cell': instance.phone_cell,
    };
