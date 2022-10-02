// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewRecordModel _$AddNewRecordModelFromJson(Map<String, dynamic> json) =>
    AddNewRecordModel();

Map<String, dynamic> _$AddNewRecordModelToJson(AddNewRecordModel instance) =>
    <String, dynamic>{};

UserWiseGroup _$UserWiseGroupFromJson(Map<String, dynamic> json) =>
    UserWiseGroup(
      WingData.fromJson(json['wing_data'] as Map<String, dynamic>),
      GroupData.fromJson(json['group_data'] as Map<String, dynamic>),
      json['has_error'] as bool,
      (json['seva'] as List<dynamic>)
          .map((e) => UserSeva.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserWiseGroupToJson(UserWiseGroup instance) =>
    <String, dynamic>{
      'wing_data': instance.wing_data,
      'group_data': instance.group_data,
      'has_error': instance.has_error,
      'seva': instance.seva,
    };

WingData _$WingDataFromJson(Map<String, dynamic> json) => WingData(
      json['wing_id'] as String?,
      json['wing_name'] as String?,
    );

Map<String, dynamic> _$WingDataToJson(WingData instance) => <String, dynamic>{
      'wing_id': instance.wing_id,
      'wing_name': instance.wing_name,
    };

GroupData _$GroupDataFromJson(Map<String, dynamic> json) => GroupData(
      json['group_id'] as int?,
      json['group_name'] as String?,
    );

Map<String, dynamic> _$GroupDataToJson(GroupData instance) => <String, dynamic>{
      'group_id': instance.group_id,
      'group_name': instance.group_name,
    };

UserSeva _$UserSevaFromJson(Map<String, dynamic> json) => UserSeva(
      json['id'] as int?,
      json['sevaName'] as String?,
    );

Map<String, dynamic> _$UserSevaToJson(UserSeva instance) => <String, dynamic>{
      'id': instance.id,
      'sevaName': instance.sevaName,
    };
