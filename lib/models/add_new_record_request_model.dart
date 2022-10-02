import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/gender_status.dart';

part 'add_new_record_request_model.g.dart';

@JsonSerializable()
class AddNewRecordRequestModel /*extends Equatable*/ {
  final int bkms_id;
  String login_user_type;
  String login_parent_type;
  String user_role_type;
  final ContactInformationAU contact_information;
  final FamilyContactInformationAU family_contact_information;
  final EmergencyContactInformationAU emergency_contact_information;
  final MedicalInformationAU medical_information;
  final SatsangInformationAU satsang_information;
  final SocialMediaInformationAU social_media_information;

  AddNewRecordRequestModel(
    this.bkms_id,
    this.login_user_type,
    this.login_parent_type,
    this.user_role_type,
    this.contact_information,
    this.family_contact_information,
    this.emergency_contact_information,
    this.medical_information,
    this.satsang_information,
    this.social_media_information,
  );

  factory AddNewRecordRequestModel.fromJson(Map<String, dynamic> json) => _$AddNewRecordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewRecordRequestModelToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}

@JsonSerializable()
class ContactInformationAU extends Equatable {
  final String? f_name;
  final String? m_name;
  final String? l_name;
  final String? email;
  final String? date_of_birth;
  final String? password;
  final String? region_id;
  final String? center_id;
  final String? home_address;
  final String? apartment;
  final String? city;
  final String? state;
  final String? country;
  final String? zip_code;
  final String? home_phone;
  final String? cell_phone;
  final String? role_type;
  final String? permission_group;

  ContactInformationAU(
    this.f_name,
    this.m_name,
    this.l_name,
    this.email,
    this.date_of_birth,
    this.password,
    this.region_id,
    this.center_id,
    this.home_address,
    this.apartment,
    this.city,
    this.state,
    this.country,
    this.zip_code,
    this.home_phone,
    this.cell_phone,
    this.role_type,
    this.permission_group,
  );

  factory ContactInformationAU.fromJson(Map<String, dynamic> json) => _$ContactInformationAUFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInformationAUToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class FamilyContactInformationAU extends Equatable {
  final String? father_name;
  final String? father_cellphone;
  final String? father_email;
  final String? mother_name;
  final String? mother_cellphone;
  final String? mother_email;
  FamilyContactInformationAU(
    this.father_name,
    this.father_cellphone,
    this.father_email,
    this.mother_name,
    this.mother_cellphone,
    this.mother_email,
  );

  factory FamilyContactInformationAU.fromJson(Map<String, dynamic> json) => _$FamilyContactInformationAUFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyContactInformationAUToJson(this);

  @override
  List<Object> get props => [''];
}

@JsonSerializable()
class EmergencyContactInformationAU extends Equatable {
  final String? emergency_contact1_name;
  final String? emergency_contact1_pri_phone;
  final String? emergency_contact1_sec_phone;
  final String? emergency_contact1_email;
  final String? emergency_contact2_name;
  final String? emergency_contact2_pri_phone;
  final String? emergency_contact2_sec_phone;
  final String? emergency_contact2_email;
  EmergencyContactInformationAU(
    this.emergency_contact1_name,
    this.emergency_contact1_pri_phone,
    this.emergency_contact1_sec_phone,
    this.emergency_contact1_email,
    this.emergency_contact2_name,
    this.emergency_contact2_pri_phone,
    this.emergency_contact2_sec_phone,
    this.emergency_contact2_email,
  );

  factory EmergencyContactInformationAU.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactInformationAUFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactInformationAUToJson(this);

  @override
  List<Object> get props => [''];
}

@JsonSerializable()
class MedicalInformationAU extends Equatable {
  final String? allergies;
  final String? medication_taken;
  final String? medical_conditions;
  final String? special_medical_instructions;
  final String? notes;

  MedicalInformationAU(
    this.allergies,
    this.medication_taken,
    this.medical_conditions,
    this.special_medical_instructions,
    this.notes,
  );

  factory MedicalInformationAU.fromJson(Map<String, dynamic> json) => _$MedicalInformationAUFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInformationAUToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class SatsangInformationAU extends Equatable {
  final String? t_shirt_size;
  final String? current_wing;
  final String? user_personal_wing;
  final String? year_of_entered_in_satsang;
  final String? school_year;
  final GenderStatus gender;
  final String? group;
  final String? primary_seva_wing;
  final String? primary_seva;
  final String? secondary_seva_wing;
  final String? secondary_seva;
  final String? undergraduate_school;
  final String? student_type;
  final String? major_expected_major;
  final String? career_interest;
  final String? bst_kst_member;
  final String? networking_target;
  final String? expected_graduation_term;

  SatsangInformationAU(
    this.t_shirt_size,
    this.current_wing,
    this.user_personal_wing,
    this.year_of_entered_in_satsang,
    this.school_year,
    this.gender,
    this.group,
    this.primary_seva_wing,
    this.primary_seva,
    this.secondary_seva_wing,
    this.secondary_seva,
    this.undergraduate_school,
    this.student_type,
    this.major_expected_major,
    this.career_interest,
    this.bst_kst_member,
    this.networking_target,
    this.expected_graduation_term,
  );

  factory SatsangInformationAU.fromJson(Map<String, dynamic> json) => _$SatsangInformationAUFromJson(json);

  Map<String, dynamic> toJson() => _$SatsangInformationAUToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class SocialMediaInformationAU extends Equatable {
  final String? facebook_id;
  final String? twitter_id;
  final String? instagram_id;
  final String? snapchat_id;
  final String? linkedin_id;

  SocialMediaInformationAU(
    this.facebook_id,
    this.twitter_id,
    this.instagram_id,
    this.snapchat_id,
    this.linkedin_id,
  );

  factory SocialMediaInformationAU.fromJson(Map<String, dynamic> json) => _$SocialMediaInformationAUFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaInformationAUToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class UserWiseGroupRequest /*extends Equatable*/ {
  final int bkms_id;
  final String schoolyear;
  final String dob;
  final GenderStatus gender;

  UserWiseGroupRequest(
    this.bkms_id,
    this.schoolyear,
    this.dob,
    this.gender,
  );

  factory UserWiseGroupRequest.fromJson(Map<String, dynamic> json) => _$UserWiseGroupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserWiseGroupRequestToJson(this);

/*@override
  List<Object> get props => [user_id];*/
}
