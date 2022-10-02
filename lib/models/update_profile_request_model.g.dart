// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestModel _$UpdateProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequestModel(
      json['bkms_id'] as int,
      json['record_id'] as String,
      json['login_user_type'] as String,
      json['login_parent_type'] as String,
      json['user_role_type'] as String,
      ContactInformationUP.fromJson(
          json['contact_information'] as Map<String, dynamic>),
      FamilyContactInformationUP.fromJson(
          json['family_contact_information'] as Map<String, dynamic>),
      EmergencyContactInformationUP.fromJson(
          json['emergency_contact_information'] as Map<String, dynamic>),
      MedicalInformationUP.fromJson(
          json['medical_information'] as Map<String, dynamic>),
      SatsangInformationUP.fromJson(
          json['satsang_information'] as Map<String, dynamic>),
      SocialMediaInformationUP.fromJson(
          json['social_media_information'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProfileRequestModelToJson(
        UpdateProfileRequestModel instance) =>
    <String, dynamic>{
      'bkms_id': instance.bkms_id,
      'record_id': instance.record_id,
      'login_user_type': instance.login_user_type,
      'login_parent_type': instance.login_parent_type,
      'user_role_type': instance.user_role_type,
      'contact_information': instance.contact_information,
      'family_contact_information': instance.family_contact_information,
      'emergency_contact_information': instance.emergency_contact_information,
      'medical_information': instance.medical_information,
      'satsang_information': instance.satsang_information,
      'social_media_information': instance.social_media_information,
    };

ContactInformationUP _$ContactInformationUPFromJson(
        Map<String, dynamic> json) =>
    ContactInformationUP(
      json['f_name'] as String?,
      json['m_name'] as String?,
      json['l_name'] as String?,
      json['email'] as String?,
      json['date_of_birth'] as String?,
      json['password'] as String?,
      json['parents_password'] as String?,
      json['region_id'] as String?,
      json['center_id'] as String?,
      json['home_address'] as String?,
      json['apartment'] as String?,
      json['city'] as String?,
      json['state'] as String?,
      json['country'] as String?,
      json['zip_code'] as String?,
      json['home_phone'] as String?,
      json['cell_phone'] as String?,
      json['role_type'] as String?,
      json['permission_group'] as String?,
    );

Map<String, dynamic> _$ContactInformationUPToJson(
        ContactInformationUP instance) =>
    <String, dynamic>{
      'f_name': instance.f_name,
      'm_name': instance.m_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'date_of_birth': instance.date_of_birth,
      'password': instance.password,
      'parents_password': instance.parents_password,
      'region_id': instance.region_id,
      'center_id': instance.center_id,
      'home_address': instance.home_address,
      'apartment': instance.apartment,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zip_code': instance.zip_code,
      'home_phone': instance.home_phone,
      'cell_phone': instance.cell_phone,
      'role_type': instance.role_type,
      'permission_group': instance.permission_group,
    };

FamilyContactInformationUP _$FamilyContactInformationUPFromJson(
        Map<String, dynamic> json) =>
    FamilyContactInformationUP(
      json['father_name'] as String?,
      json['father_cellphone'] as String?,
      json['father_email'] as String?,
      json['mother_name'] as String?,
      json['mother_cellphone'] as String?,
      json['mother_email'] as String?,
    );

Map<String, dynamic> _$FamilyContactInformationUPToJson(
        FamilyContactInformationUP instance) =>
    <String, dynamic>{
      'father_name': instance.father_name,
      'father_cellphone': instance.father_cellphone,
      'father_email': instance.father_email,
      'mother_name': instance.mother_name,
      'mother_cellphone': instance.mother_cellphone,
      'mother_email': instance.mother_email,
    };

EmergencyContactInformationUP _$EmergencyContactInformationUPFromJson(
        Map<String, dynamic> json) =>
    EmergencyContactInformationUP(
      json['emergency_contact1_name'] as String?,
      json['emergency_contact1_pri_phone'] as String?,
      json['emergency_contact1_sec_phone'] as String?,
      json['emergency_contact1_email'] as String?,
      json['emergency_contact2_name'] as String?,
      json['emergency_contact2_pri_phone'] as String?,
      json['emergency_contact2_sec_phone'] as String?,
      json['emergency_contact2_email'] as String?,
    );

Map<String, dynamic> _$EmergencyContactInformationUPToJson(
        EmergencyContactInformationUP instance) =>
    <String, dynamic>{
      'emergency_contact1_name': instance.emergency_contact1_name,
      'emergency_contact1_pri_phone': instance.emergency_contact1_pri_phone,
      'emergency_contact1_sec_phone': instance.emergency_contact1_sec_phone,
      'emergency_contact1_email': instance.emergency_contact1_email,
      'emergency_contact2_name': instance.emergency_contact2_name,
      'emergency_contact2_pri_phone': instance.emergency_contact2_pri_phone,
      'emergency_contact2_sec_phone': instance.emergency_contact2_sec_phone,
      'emergency_contact2_email': instance.emergency_contact2_email,
    };

MedicalInformationUP _$MedicalInformationUPFromJson(
        Map<String, dynamic> json) =>
    MedicalInformationUP(
      json['allergies'] as String?,
      json['medication_taken'] as String?,
      json['medical_conditions'] as String?,
      json['special_medical_instructions'] as String?,
      json['notes'] as String?,
    );

Map<String, dynamic> _$MedicalInformationUPToJson(
        MedicalInformationUP instance) =>
    <String, dynamic>{
      'allergies': instance.allergies,
      'medication_taken': instance.medication_taken,
      'medical_conditions': instance.medical_conditions,
      'special_medical_instructions': instance.special_medical_instructions,
      'notes': instance.notes,
    };

SatsangInformationUP _$SatsangInformationUPFromJson(
        Map<String, dynamic> json) =>
    SatsangInformationUP(
      json['t_shirt_size'] as String?,
      json['current_wing'] as String?,
      json['user_personal_wing'] as String?,
      json['year_of_entered_in_satsang'] as String?,
      json['school_year'] as String?,
      $enumDecode(_$GenderStatusEnumMap, json['gender']),
      json['group'] as String?,
      json['sub_group'] as String?,
      json['primary_seva_wing'] as String?,
      json['primary_seva'] as String?,
      json['secondary_seva_wing'] as String?,
      json['secondary_seva'] as String?,
      json['undergraduate_school'] as String?,
      $enumDecodeNullable(_$StudentTypeEnumMap, json['student_type']),
      json['major_expected_major'] as String?,
      json['career_interest'] as String?,
      json['bst_kst_member'] as String?,
      json['networking_target'] as String?,
      json['expected_graduation_term'] as String?,
      (json['assign_campus'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      (json['multiple_region'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      (json['multiple_center'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
    );

Map<String, dynamic> _$SatsangInformationUPToJson(
        SatsangInformationUP instance) =>
    <String, dynamic>{
      't_shirt_size': instance.t_shirt_size,
      'current_wing': instance.current_wing,
      'user_personal_wing': instance.user_personal_wing,
      'year_of_entered_in_satsang': instance.year_of_entered_in_satsang,
      'school_year': instance.school_year,
      'gender': _$GenderStatusEnumMap[instance.gender],
      'group': instance.group,
      'sub_group': instance.sub_group,
      'primary_seva_wing': instance.primary_seva_wing,
      'primary_seva': instance.primary_seva,
      'secondary_seva_wing': instance.secondary_seva_wing,
      'secondary_seva': instance.secondary_seva,
      'undergraduate_school': instance.undergraduate_school,
      'student_type': _$StudentTypeEnumMap[instance.student_type],
      'major_expected_major': instance.major_expected_major,
      'career_interest': instance.career_interest,
      'bst_kst_member': instance.bst_kst_member,
      'networking_target': instance.networking_target,
      'expected_graduation_term': instance.expected_graduation_term,
      'assign_campus': instance.assign_campus,
      'multiple_region': instance.multiple_region,
      'multiple_center': instance.multiple_center,
    };

const _$GenderStatusEnumMap = {
  GenderStatus.male: 'male',
  GenderStatus.female: 'female',
};

const _$StudentTypeEnumMap = {
  StudentType.commuter: 'commuter',
  StudentType.away: 'away',
};

SocialMediaInformationUP _$SocialMediaInformationUPFromJson(
        Map<String, dynamic> json) =>
    SocialMediaInformationUP(
      json['facebook_id'] as String?,
      json['twitter_id'] as String?,
      json['instagram_id'] as String?,
      json['snapchat_id'] as String?,
      json['linkedin_id'] as String?,
    );

Map<String, dynamic> _$SocialMediaInformationUPToJson(
        SocialMediaInformationUP instance) =>
    <String, dynamic>{
      'facebook_id': instance.facebook_id,
      'twitter_id': instance.twitter_id,
      'instagram_id': instance.instagram_id,
      'snapchat_id': instance.snapchat_id,
      'linkedin_id': instance.linkedin_id,
    };
