// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liability_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiabilityFormModel _$LiabilityFormModelFromJson(Map<String, dynamic> json) =>
    LiabilityFormModel(
      json['user_data'] == null
          ? null
          : UserDataModel.fromJson(json['user_data'] as Map<String, dynamic>),
      json['event_description'] as String?,
      json['user_wing_set'] as int?,
      json['eventhost_name'] as String?,
      json['event_details'] == null
          ? null
          : EventDetailsModel.fromJson(
              json['event_details'] as Map<String, dynamic>),
      (json['outing_data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OutingDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stayover_data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : StayoverDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['states'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : StatesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['event_level'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EventLevelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['wingname'] as String,
      json['event_data'] == null
          ? null
          : EventDataModel.fromJson(json['event_data'] as Map<String, dynamic>),
      json['event_id'] as String,
      json['myevent_data'] == null
          ? null
          : MyeventDataModel.fromJson(
              json['myevent_data'] as Map<String, dynamic>),
      json['is_intialbox'] as bool,
      (json['initial_textbox'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : InitialTextboxModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiabilityFormModelToJson(LiabilityFormModel instance) =>
    <String, dynamic>{
      'user_data': instance.user_data,
      'event_description': instance.event_description,
      'user_wing_set': instance.user_wing_set,
      'eventhost_name': instance.eventhost_name,
      'event_details': instance.event_details,
      'outing_data': instance.outing_data,
      'stayover_data': instance.stayover_data,
      'states': instance.states,
      'event_level': instance.event_level,
      'wingname': instance.wingname,
      'event_data': instance.event_data,
      'event_id': instance.event_id,
      'myevent_data': instance.myevent_data,
      'is_intialbox': instance.is_intialbox,
      'initial_textbox': instance.initial_textbox,
    };

InitialTextboxModel _$InitialTextboxModelFromJson(Map<String, dynamic> json) =>
    InitialTextboxModel(
      json['type'] as String?,
      json['name'] as String?,
      json['placeholder'] as String?,
      json['content'] as String?,
      json['is_required'] as bool?,
      json['is_caps'] as bool?,
      json['max_length'] as int?,
    )..value = json['value'] as String?;

Map<String, dynamic> _$InitialTextboxModelToJson(
        InitialTextboxModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'placeholder': instance.placeholder,
      'content': instance.content,
      'is_required': instance.is_required,
      'is_caps': instance.is_caps,
      'max_length': instance.max_length,
      'value': instance.value,
    };

MyeventDataModel _$MyeventDataModelFromJson(Map<String, dynamic> json) =>
    MyeventDataModel(
      json['signed_user_name'] as String?,
      json['initial_box1'] as String?,
      json['initial_box2'] as String?,
      json['initial_box3'] as String?,
      json['initial_box4'] as String?,
      json['initial_box5'] as String?,
      json['initial_box6'] as String?,
      json['initial_box7'] as String?,
      json['invite_status'] as String?,
      json['liability_sign'] as String?,
      json['event_state_name'] as String?,
      json['host_region_name'] as String?,
      json['host_center_name'] as String?,
      json['wing_id'] as String?,
      json['is_canada_form'] as String?,
      json['login_parent_type'] as String?,
    );

Map<String, dynamic> _$MyeventDataModelToJson(MyeventDataModel instance) =>
    <String, dynamic>{
      'signed_user_name': instance.signed_user_name,
      'initial_box1': instance.initial_box1,
      'initial_box2': instance.initial_box2,
      'initial_box3': instance.initial_box3,
      'initial_box4': instance.initial_box4,
      'initial_box5': instance.initial_box5,
      'initial_box6': instance.initial_box6,
      'initial_box7': instance.initial_box7,
      'invite_status': instance.invite_status,
      'liability_sign': instance.liability_sign,
      'event_state_name': instance.event_state_name,
      'host_region_name': instance.host_region_name,
      'host_center_name': instance.host_center_name,
      'wing_id': instance.wing_id,
      'is_canada_form': instance.is_canada_form,
      'login_parent_type': instance.login_parent_type,
    };

EventDataModel _$EventDataModelFromJson(Map<String, dynamic> json) =>
    EventDataModel(
      json['event_title'] as String,
      json['event_level'] as String,
      json['event_start_date'] as String?,
      json['event_end_date'] as String?,
      json['early_reg_start_date'] as String?,
      json['reg_start_date'] as String?,
      json['reg_end_date'] as String?,
      json['transportation_avail'] as String,
      json['transportation_deadline'] as String?,
      json['event_description'] as String,
      json['show_stayinfo'] as String,
      json['show_outing'] as String,
    );

Map<String, dynamic> _$EventDataModelToJson(EventDataModel instance) =>
    <String, dynamic>{
      'event_title': instance.event_title,
      'event_level': instance.event_level,
      'event_start_date': instance.event_start_date,
      'event_end_date': instance.event_end_date,
      'early_reg_start_date': instance.early_reg_start_date,
      'reg_start_date': instance.reg_start_date,
      'reg_end_date': instance.reg_end_date,
      'transportation_avail': instance.transportation_avail,
      'transportation_deadline': instance.transportation_deadline,
      'event_description': instance.event_description,
      'show_stayinfo': instance.show_stayinfo,
      'show_outing': instance.show_outing,
    };

EventLevelModel _$EventLevelModelFromJson(Map<String, dynamic> json) =>
    EventLevelModel(
      json['id'] as String?,
      json['event_level_name'] as String?,
      json['roletype_id'] as String?,
      json['created_date'] as String?,
      json['updated_date'] as String?,
    );

Map<String, dynamic> _$EventLevelModelToJson(EventLevelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_level_name': instance.event_level_name,
      'roletype_id': instance.roletype_id,
      'created_date': instance.created_date,
      'updated_date': instance.updated_date,
    };

StatesModel _$StatesModelFromJson(Map<String, dynamic> json) => StatesModel(
      json['id'] as String,
      json['state_code'] as String?,
      json['name'] as String,
      json['country_id'] as String,
    );

Map<String, dynamic> _$StatesModelToJson(StatesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state_code': instance.state_code,
      'name': instance.name,
      'country_id': instance.country_id,
    };

StayoverDataModel _$StayoverDataModelFromJson(Map<String, dynamic> json) =>
    StayoverDataModel(
      json['id'] as String?,
      json['event_id'] as String?,
      json['stayover_name'] as String?,
      json['address'] as String?,
      json['city'] as String?,
      json['state'] as String?,
      json['rooms'] as String?,
      json['pincode'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['stayover_location_type'] as String?,
    );

Map<String, dynamic> _$StayoverDataModelToJson(StayoverDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.event_id,
      'stayover_name': instance.stayover_name,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'rooms': instance.rooms,
      'pincode': instance.pincode,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'stayover_location_type': instance.stayover_location_type,
    };

OutingDataModel _$OutingDataModelFromJson(Map<String, dynamic> json) =>
    OutingDataModel(
      json['id'] as String?,
      json['event_id'] as String?,
      json['outing_name'] as String?,
      json['address'] as String?,
      json['city'] as String?,
      json['state'] as String?,
      json['pincode'] as String?,
      json['outing_description'] as String?,
      json['outing_start_date'] as String?,
      json['outing_end_date'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$OutingDataModelToJson(OutingDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.event_id,
      'outing_name': instance.outing_name,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'outing_description': instance.outing_description,
      'outing_start_date': instance.outing_start_date,
      'outing_end_date': instance.outing_end_date,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

EventDetailsModel _$EventDetailsModelFromJson(Map<String, dynamic> json) =>
    EventDetailsModel(
      json['id'] as String?,
      json['event_level'] as String?,
      json['event_type'] as String?,
      json['event_title'] as String?,
      json['event_location'] as String?,
      json['event_description'] as String?,
      json['eligible_wings'] as String?,
      json['eligible_regions'] as String?,
      json['event_start_date'] as String?,
      json['event_end_date'] as String?,
      json['early_reg_start_date'] as String?,
      json['reg_start_date'] as String?,
      json['reg_end_date'] as String?,
      json['payment_region'] as String?,
      json['maximum_attendence'] as String?,
      json['day_care_avail'] as String?,
      json['transportation_avail'] as String?,
      json['transportation_deadline'] as String?,
      json['event_status'] as String?,
      json['created_by'] as String?,
      json['is_created_by'] as String?,
      json['stayover_option_type'] as String?,
      json['stay_start_date'] as String?,
      json['stay_end_date'] as String?,
      json['stay_start_date1'] as String?,
      json['stay_start_date2'] as String?,
      json['stay_end_date1'] as String?,
      json['stay_end_date2'] as String?,
      json['city'] as String?,
      json['zipcode'] as String?,
      json['state'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['show_stayinfo'] as String?,
      json['show_outing'] as String?,
      json['event_approve_status'] as String?,
      json['currency_type'] as String?,
      json['refund_amount'] as String?,
      json['payment_country'] as String?,
      json['payment_center'] as String?,
      json['form_type'] as String?,
      json['event_box_id'] as String?,
      json['event_center'] as String?,
      json['reg_fee'] as String?,
      json['multi_wing_event'] as String?,
      json['multi_gender_event'] as String?,
      json['transporation_require'] as String?,
      json['host_region'] as String?,
      json['host_center'] as String?,
      json['event_approve_by'] as String?,
      json['event_approval_date'] as String?,
      json['client_secret_key'] as String?,
      json['payment_method'] as String?,
      json['event_approval_request_date'] as String?,
      json['event_approve_request_by'] as String?,
      json['registration_email_template'] as String?,
      json['event_address'] as String?,
    );

Map<String, dynamic> _$EventDetailsModelToJson(EventDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_level': instance.event_level,
      'event_type': instance.event_type,
      'event_title': instance.event_title,
      'event_location': instance.event_location,
      'event_description': instance.event_description,
      'eligible_wings': instance.eligible_wings,
      'eligible_regions': instance.eligible_regions,
      'event_start_date': instance.event_start_date,
      'event_end_date': instance.event_end_date,
      'early_reg_start_date': instance.early_reg_start_date,
      'reg_start_date': instance.reg_start_date,
      'reg_end_date': instance.reg_end_date,
      'payment_region': instance.payment_region,
      'maximum_attendence': instance.maximum_attendence,
      'day_care_avail': instance.day_care_avail,
      'transportation_avail': instance.transportation_avail,
      'transportation_deadline': instance.transportation_deadline,
      'event_status': instance.event_status,
      'created_by': instance.created_by,
      'is_created_by': instance.is_created_by,
      'stayover_option_type': instance.stayover_option_type,
      'stay_start_date': instance.stay_start_date,
      'stay_end_date': instance.stay_end_date,
      'stay_start_date1': instance.stay_start_date1,
      'stay_start_date2': instance.stay_start_date2,
      'stay_end_date1': instance.stay_end_date1,
      'stay_end_date2': instance.stay_end_date2,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'state': instance.state,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'show_stayinfo': instance.show_stayinfo,
      'show_outing': instance.show_outing,
      'event_approve_status': instance.event_approve_status,
      'currency_type': instance.currency_type,
      'refund_amount': instance.refund_amount,
      'payment_country': instance.payment_country,
      'payment_center': instance.payment_center,
      'form_type': instance.form_type,
      'event_box_id': instance.event_box_id,
      'event_center': instance.event_center,
      'reg_fee': instance.reg_fee,
      'multi_wing_event': instance.multi_wing_event,
      'multi_gender_event': instance.multi_gender_event,
      'transporation_require': instance.transporation_require,
      'host_region': instance.host_region,
      'host_center': instance.host_center,
      'event_approve_by': instance.event_approve_by,
      'event_approval_date': instance.event_approval_date,
      'client_secret_key': instance.client_secret_key,
      'payment_method': instance.payment_method,
      'event_approval_request_date': instance.event_approval_request_date,
      'event_approve_request_by': instance.event_approve_request_by,
      'registration_email_template': instance.registration_email_template,
      'event_address': instance.event_address,
    };

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      json['user_name_event'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'user_name_event': instance.user_name_event,
    };
