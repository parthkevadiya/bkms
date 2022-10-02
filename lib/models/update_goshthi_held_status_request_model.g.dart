// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_goshthi_held_status_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateGoshthiHeldStatusRequestModel
    _$UpdateGoshthiHeldStatusRequestModelFromJson(Map<String, dynamic> json) =>
        UpdateGoshthiHeldStatusRequestModel(
          json['login_user_type'] as String,
          json['login_parent_type'] as String,
          json['user_role_type'] as String,
          json['bkms_id'] as String,
          json['karyakar_goshti_sabha_id'] as String,
          json['selected_center'] as String,
          json['selected_region'] as String,
          json['goshthi_status'] as String,
          json['sabha_date'] as String,
          json['sabha_label'] as String,
          json['sabha_wing'] as String,
          json['total_datatable_records'] as String,
          (json['status_array'] as List<dynamic>)
              .map((e) => StatusArrayModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$UpdateGoshthiHeldStatusRequestModelToJson(
        UpdateGoshthiHeldStatusRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'bkms_id': instance.bkms_id,
      'karyakar_goshti_sabha_id': instance.karyakar_goshti_sabha_id,
      'selected_center': instance.selected_center,
      'selected_region': instance.selected_region,
      'goshthi_status': instance.goshthi_status,
      'sabha_date': instance.sabha_date,
      'sabha_label': instance.sabha_label,
      'sabha_wing': instance.sabha_wing,
      'total_datatable_records': instance.total_datatable_records,
      'status_array': instance.status_array,
    };

StatusArrayModel _$StatusArrayModelFromJson(Map<String, dynamic> json) =>
    StatusArrayModel(
      json['id'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$StatusArrayModelToJson(StatusArrayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
