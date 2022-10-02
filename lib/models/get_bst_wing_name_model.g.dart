// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bst_wing_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBSTWingNameModel _$GetBSTWingNameModelFromJson(Map<String, dynamic> json) =>
    GetBSTWingNameModel(
      json['has_error'] as bool?,
      json['wing_count'] as int?,
      (json['wing'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BSTWingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBSTWingNameModelToJson(
        GetBSTWingNameModel instance) =>
    <String, dynamic>{
      'has_error': instance.has_error,
      'wing_count': instance.wing_count,
      'wing': instance.wing,
    };

BSTWingModel _$BSTWingModelFromJson(Map<String, dynamic> json) => BSTWingModel(
      json['wing_id'] as String?,
      json['wingName'] as String?,
    );

Map<String, dynamic> _$BSTWingModelToJson(BSTWingModel instance) =>
    <String, dynamic>{
      'wing_id': instance.wing_id,
      'wingName': instance.wingName,
    };
