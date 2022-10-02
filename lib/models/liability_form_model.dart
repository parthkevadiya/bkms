import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'liability_form_model.g.dart';

@JsonSerializable()
class LiabilityFormModel /*extends Equatable*/ {
  final UserDataModel? user_data;
  final String? event_description;
  final int? user_wing_set;
  final String? eventhost_name;
  final EventDetailsModel? event_details;
  final List<OutingDataModel?>? outing_data;
  final List<StayoverDataModel?>? stayover_data;
  final List<StatesModel?>? states;
  final List<EventLevelModel?>? event_level;
  final String wingname;
  final EventDataModel? event_data;
  final String event_id;
  final MyeventDataModel? myevent_data;
  final bool is_intialbox;
  final List<InitialTextboxModel?>? initial_textbox;

  LiabilityFormModel(
      this.user_data,
      this.event_description,
      this.user_wing_set,
      this.eventhost_name,
      this.event_details,
      this.outing_data,
      this.stayover_data,
      this.states,
      this.event_level,
      this.wingname,
      this.event_data,
      this.event_id,
      this.myevent_data,
      this.is_intialbox,
      this.initial_textbox);

  factory LiabilityFormModel.fromJson(Map<String, dynamic> json) =>
      _$LiabilityFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiabilityFormModelToJson(this);

/*@override
  List<Object> get props => [name];*/
}

@JsonSerializable()
class InitialTextboxModel {
  final String? type;
  final String? name;
  final String? placeholder;
  final String? content;
  final bool? is_required;
  final bool? is_caps;
  final int? max_length;
  String? value;

  InitialTextboxModel(this.type, this.name, this.placeholder, this.content,
      this.is_required, this.is_caps, this.max_length);

  factory InitialTextboxModel.fromJson(Map<String, dynamic> json) =>
      _$InitialTextboxModelFromJson(json);

  Map<String, dynamic> toJson() => _$InitialTextboxModelToJson(this);
}

@JsonSerializable()
class MyeventDataModel {
  final String? signed_user_name;
  final String? initial_box1;
  final String? initial_box2;
  final String? initial_box3;
  final String? initial_box4;
  final String? initial_box5;
  final String? initial_box6;
  final String? initial_box7;
  final String? invite_status;
  final String? liability_sign;
  final String? event_state_name;
  final String? host_region_name;
  final String? host_center_name;
  final String? wing_id;
  final String? is_canada_form;
  final String? login_parent_type;

  MyeventDataModel(
      this.signed_user_name,
      this.initial_box1,
      this.initial_box2,
      this.initial_box3,
      this.initial_box4,
      this.initial_box5,
      this.initial_box6,
      this.initial_box7,
      this.invite_status,
      this.liability_sign,
      this.event_state_name,
      this.host_region_name,
      this.host_center_name,
      this.wing_id,
      this.is_canada_form,
      this.login_parent_type);

  factory MyeventDataModel.fromJson(Map<String, dynamic> json) =>
      _$MyeventDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyeventDataModelToJson(this);
}

@JsonSerializable()
class EventDataModel {
  final String event_title;
  final String event_level;
  final String? event_start_date;
  final String? event_end_date;
  final String? early_reg_start_date;
  final String? reg_start_date;
  final String? reg_end_date;
  final String transportation_avail;
  final String? transportation_deadline;
  final String event_description;
  final String show_stayinfo;
  final String show_outing;

  EventDataModel(
      this.event_title,
      this.event_level,
      this.event_start_date,
      this.event_end_date,
      this.early_reg_start_date,
      this.reg_start_date,
      this.reg_end_date,
      this.transportation_avail,
      this.transportation_deadline,
      this.event_description,
      this.show_stayinfo,
      this.show_outing);

  factory EventDataModel.fromJson(Map<String, dynamic> json) =>
      _$EventDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventDataModelToJson(this);
}

@JsonSerializable()
class EventLevelModel {
  final String? id;
  final String? event_level_name;
  final String? roletype_id;
  final String? created_date;
  final String? updated_date;

  EventLevelModel(this.id, this.event_level_name, this.roletype_id,
      this.created_date, this.updated_date);

  factory EventLevelModel.fromJson(Map<String, dynamic> json) =>
      _$EventLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventLevelModelToJson(this);
}

@JsonSerializable()
class StatesModel {
  final String id;
  final String? state_code;
  final String name;
  final String country_id;

  StatesModel(this.id, this.state_code, this.name, this.country_id);

  factory StatesModel.fromJson(Map<String, dynamic> json) =>
      _$StatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatesModelToJson(this);
}

@JsonSerializable()
class StayoverDataModel {
  final String? id;
  final String? event_id;
  final String? stayover_name;
  final String? address;
  final String? city;
  final String? state;
  final String? rooms;
  final String? pincode;
  final String? created_at;
  final String? updated_at;
  final String? stayover_location_type;

  StayoverDataModel(
      this.id,
      this.event_id,
      this.stayover_name,
      this.address,
      this.city,
      this.state,
      this.rooms,
      this.pincode,
      this.created_at,
      this.updated_at,
      this.stayover_location_type);

  factory StayoverDataModel.fromJson(Map<String, dynamic> json) =>
      _$StayoverDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$StayoverDataModelToJson(this);
}

@JsonSerializable()
class OutingDataModel {
  final String? id;
  final String? event_id;
  final String? outing_name;
  final String? address;
  final String? city;
  final String? state;
  final String? pincode;
  final String? outing_description;
  final String? outing_start_date;
  final String? outing_end_date;
  final String? created_at;
  final String? updated_at;

  OutingDataModel(
      this.id,
      this.event_id,
      this.outing_name,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.outing_description,
      this.outing_start_date,
      this.outing_end_date,
      this.created_at,
      this.updated_at);

  factory OutingDataModel.fromJson(Map<String, dynamic> json) =>
      _$OutingDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$OutingDataModelToJson(this);
}

@JsonSerializable()
class EventDetailsModel {
  final String? id;
  final String? event_level;
  final String? event_type;
  final String? event_title;
  final String? event_location;
  final String? event_description;
  final String? eligible_wings;
  final String? eligible_regions;
  final String? event_start_date;
  final String? event_end_date;
  final String? early_reg_start_date;
  final String? reg_start_date;
  final String? reg_end_date;
  final String? payment_region;
  final String? maximum_attendence;
  final String? day_care_avail;
  final String? transportation_avail;
  final String? transportation_deadline;
  final String? event_status;
  final String? created_by;
  final String? is_created_by;
  final String? stayover_option_type;
  final String? stay_start_date;
  final String? stay_end_date;
  final String? stay_start_date1;
  final String? stay_start_date2;
  final String? stay_end_date1;
  final String? stay_end_date2;
  final String? city;
  final String? zipcode;
  final String? state;
  final String? created_at;
  final String? updated_at;
  final String? show_stayinfo;
  final String? show_outing;
  final String? event_approve_status;
  final String? currency_type;
  final String? refund_amount;
  final String? payment_country;
  final String? payment_center;
  final String? form_type;
  final String? event_box_id;
  final String? event_center;
  final String? reg_fee;
  final String? multi_wing_event;
  final String? multi_gender_event;
  final String? transporation_require;
  final String? host_region;
  final String? host_center;
  final String? event_approve_by;
  final String? event_approval_date;
  final String? client_secret_key;
  final String? payment_method;
  final String? event_approval_request_date;
  final String? event_approve_request_by;
  final String? registration_email_template;
  final String? event_address;

  EventDetailsModel(
      this.id,
      this.event_level,
      this.event_type,
      this.event_title,
      this.event_location,
      this.event_description,
      this.eligible_wings,
      this.eligible_regions,
      this.event_start_date,
      this.event_end_date,
      this.early_reg_start_date,
      this.reg_start_date,
      this.reg_end_date,
      this.payment_region,
      this.maximum_attendence,
      this.day_care_avail,
      this.transportation_avail,
      this.transportation_deadline,
      this.event_status,
      this.created_by,
      this.is_created_by,
      this.stayover_option_type,
      this.stay_start_date,
      this.stay_end_date,
      this.stay_start_date1,
      this.stay_start_date2,
      this.stay_end_date1,
      this.stay_end_date2,
      this.city,
      this.zipcode,
      this.state,
      this.created_at,
      this.updated_at,
      this.show_stayinfo,
      this.show_outing,
      this.event_approve_status,
      this.currency_type,
      this.refund_amount,
      this.payment_country,
      this.payment_center,
      this.form_type,
      this.event_box_id,
      this.event_center,
      this.reg_fee,
      this.multi_wing_event,
      this.multi_gender_event,
      this.transporation_require,
      this.host_region,
      this.host_center,
      this.event_approve_by,
      this.event_approval_date,
      this.client_secret_key,
      this.payment_method,
      this.event_approval_request_date,
      this.event_approve_request_by,
      this.registration_email_template,
      this.event_address);

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventDetailsModelToJson(this);
}

@JsonSerializable()
class UserDataModel {
  final String? user_name_event;

  UserDataModel(this.user_name_event);

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
