import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/gender_status.dart';
import '../utils/student_type.dart';

part 'update_profile_request_model.g.dart';

@JsonSerializable()
class UpdateProfileRequestModel extends Equatable {
  final int bkms_id;
  final String record_id;
  String login_user_type;
  String login_parent_type;
  String user_role_type;
  final ContactInformationUP contact_information;
  final FamilyContactInformationUP family_contact_information;
  final EmergencyContactInformationUP emergency_contact_information;
  final MedicalInformationUP medical_information;
  final SatsangInformationUP satsang_information;
  final SocialMediaInformationUP social_media_information;

  UpdateProfileRequestModel(
    this.bkms_id,
    this.record_id,
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

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestModelToJson(this);

  @override
  List<Object> get props => [bkms_id];
}

@JsonSerializable()
class ContactInformationUP extends Equatable {
  final String? f_name;
  final String? m_name;
  final String? l_name;
  final String? email;
  final String? date_of_birth;
  final String? password;
  final String? parents_password;
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

  ContactInformationUP(
    this.f_name,
    this.m_name,
    this.l_name,
    this.email,
    this.date_of_birth,
    this.password,
    this.parents_password,
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

  factory ContactInformationUP.fromJson(Map<String, dynamic> json) => _$ContactInformationUPFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInformationUPToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class FamilyContactInformationUP extends Equatable {
  final String? father_name;
  final String? father_cellphone;
  final String? father_email;
  final String? mother_name;
  final String? mother_cellphone;
  final String? mother_email;
  FamilyContactInformationUP(
    this.father_name,
    this.father_cellphone,
    this.father_email,
    this.mother_name,
    this.mother_cellphone,
    this.mother_email,
  );

  factory FamilyContactInformationUP.fromJson(Map<String, dynamic> json) => _$FamilyContactInformationUPFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyContactInformationUPToJson(this);

  @override
  List<Object> get props => [''];
}

@JsonSerializable()
class EmergencyContactInformationUP extends Equatable {
  final String? emergency_contact1_name;
  final String? emergency_contact1_pri_phone;
  final String? emergency_contact1_sec_phone;
  final String? emergency_contact1_email;
  final String? emergency_contact2_name;
  final String? emergency_contact2_pri_phone;
  final String? emergency_contact2_sec_phone;
  final String? emergency_contact2_email;
  EmergencyContactInformationUP(
    this.emergency_contact1_name,
    this.emergency_contact1_pri_phone,
    this.emergency_contact1_sec_phone,
    this.emergency_contact1_email,
    this.emergency_contact2_name,
    this.emergency_contact2_pri_phone,
    this.emergency_contact2_sec_phone,
    this.emergency_contact2_email,
  );

  factory EmergencyContactInformationUP.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactInformationUPFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactInformationUPToJson(this);

  @override
  List<Object> get props => [''];
}

@JsonSerializable()
class MedicalInformationUP extends Equatable {
  final String? allergies;
  final String? medication_taken;
  final String? medical_conditions;
  final String? special_medical_instructions;
  final String? notes;

  MedicalInformationUP(
    this.allergies,
    this.medication_taken,
    this.medical_conditions,
    this.special_medical_instructions,
    this.notes,
  );

  factory MedicalInformationUP.fromJson(Map<String, dynamic> json) => _$MedicalInformationUPFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInformationUPToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class SatsangInformationUP extends Equatable {
  final String? t_shirt_size;
  final String? current_wing;
  final String? user_personal_wing;
  final String? year_of_entered_in_satsang;
  final String? school_year;
  final GenderStatus gender;
  final String? group;
  final String? sub_group;
  final String? primary_seva_wing;
  final String? primary_seva;
  final String? secondary_seva_wing;
  final String? secondary_seva;
  final String? undergraduate_school;
  final StudentType? student_type;
  final String? major_expected_major;
  final String? career_interest;
  final String? bst_kst_member;
  final String? networking_target;
  final String? expected_graduation_term;
  @JsonKey(defaultValue: [])
  final List<int> assign_campus;
  @JsonKey(defaultValue: [])
  final List<int> multiple_region;
  @JsonKey(defaultValue: [])
  final List<int> multiple_center;

  SatsangInformationUP(
    this.t_shirt_size,
    this.current_wing,
    this.user_personal_wing,
    this.year_of_entered_in_satsang,
    this.school_year,
    this.gender,
    this.group,
    this.sub_group,
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
    this.assign_campus,
    this.multiple_region,
    this.multiple_center,
  );

  factory SatsangInformationUP.fromJson(Map<String, dynamic> json) => _$SatsangInformationUPFromJson(json);

  Map<String, dynamic> toJson() => _$SatsangInformationUPToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class SocialMediaInformationUP extends Equatable {
  final String? facebook_id;
  final String? twitter_id;
  final String? instagram_id;
  final String? snapchat_id;
  final String? linkedin_id;

  SocialMediaInformationUP(
    this.facebook_id,
    this.twitter_id,
    this.instagram_id,
    this.snapchat_id,
    this.linkedin_id,
  );

  factory SocialMediaInformationUP.fromJson(Map<String, dynamic> json) => _$SocialMediaInformationUPFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaInformationUPToJson(this);

  @override
  List<Object> get props => [];
}
