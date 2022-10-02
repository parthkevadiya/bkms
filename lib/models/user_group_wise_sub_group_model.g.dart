// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_wise_sub_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupWiseSubGroupModel _$UserGroupWiseSubGroupModelFromJson(
        Map<String, dynamic> json) =>
    UserGroupWiseSubGroupModel(
      json['has_error'] as bool?,
      json['subgroups_count'] as int?,
      (json['subgroups'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$UserGroupWiseSubGroupModelToJson(
        UserGroupWiseSubGroupModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'subgroups_count': instance.subgroups_count,
      'subgroups': instance.subgroups,
    };
