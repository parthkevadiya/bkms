// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_liability_form_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitLiabilityFormRequestModel _$SubmitLiabilityFormRequestModelFromJson(
        Map<String, dynamic> json) =>
    SubmitLiabilityFormRequestModel(
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['bkms_id'] as String,
      json['event_id'] as String,
      json['liability_user_type'] as String,
      json['signature'] as String,
      json['approve_option'] as String,
      json['initial_box1'] as String,
      json['initial_box2'] as String,
      json['initial_box3'] as String,
      json['initial_box4'] as String,
      json['initial_box5'] as String,
      json['initial_box6'] as String,
      json['initial_box7'] as String,
      json['parents_name'] as String,
    );

Map<String, dynamic> _$SubmitLiabilityFormRequestModelToJson(
        SubmitLiabilityFormRequestModel instance) =>
    <String, dynamic>{
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'bkms_id': instance.bkms_id,
      'event_id': instance.event_id,
      'liability_user_type': instance.liability_user_type,
      'signature': instance.signature,
      'approve_option': instance.approve_option,
      'initial_box1': instance.initial_box1,
      'initial_box2': instance.initial_box2,
      'initial_box3': instance.initial_box3,
      'initial_box4': instance.initial_box4,
      'initial_box5': instance.initial_box5,
      'initial_box6': instance.initial_box6,
      'initial_box7': instance.initial_box7,
      'parents_name': instance.parents_name,
    };
