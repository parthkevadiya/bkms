// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      json['is_edit'],
      json['user_id'],
      json['record_id'],
      json['role'] as String?,
      json['contact_information'] == null
          ? null
          : ContactInformation.fromJson(
              json['contact_information'] as Map<String, dynamic>),
      json['social_media_information'] == null
          ? null
          : SocialMediaInformation.fromJson(
              json['social_media_information'] as Map<String, dynamic>),
      json['medical_information'] == null
          ? null
          : MedicalInformation.fromJson(
              json['medical_information'] as Map<String, dynamic>),
      json['satsang_information'] == null
          ? null
          : SatsangInformation.fromJson(
              json['satsang_information'] as Map<String, dynamic>),
      json['family_contact_information'] == null
          ? null
          : FamilyContactInformation.fromJson(
              json['family_contact_information'] as Map<String, dynamic>),
      json['emergency_contact_information'] == null
          ? null
          : EmergencyContactInformation.fromJson(
              json['emergency_contact_information'] as Map<String, dynamic>),
      (json['state'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : StateUP.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['country'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Country.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['wing'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Wing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['tishirtsize'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : TShirtSize.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['role_type'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : RoleType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['seva'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Seva.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['region'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Region.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['center'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : CenterUP.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['school_year'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : SchoolYear.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['group'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GroupUP.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'is_edit': instance.is_edit,
      'user_id': instance.user_id,
      'record_id': instance.record_id,
      'role': instance.role,
      'contact_information': instance.contact_information,
      'social_media_information': instance.social_media_information,
      'medical_information': instance.medical_information,
      'satsang_information': instance.satsang_information,
      'family_contact_information': instance.family_contact_information,
      'emergency_contact_information': instance.emergency_contact_information,
      'state': instance.state,
      'country': instance.country,
      'wing': instance.wing,
      'tishirtsize': instance.tishirtsize,
      'role_type': instance.role_type,
      'seva': instance.seva,
      'region': instance.region,
      'center': instance.center,
      'school_year': instance.school_year,
      'group': instance.group,
    };

GroupUP _$GroupUPFromJson(Map<String, dynamic> json) => GroupUP(
      json['id'] as int,
      json['group_name'] as String,
    );

Map<String, dynamic> _$GroupUPToJson(GroupUP instance) => <String, dynamic>{
      'id': instance.id,
      'group_name': instance.group_name,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      json['id'] as int,
      json['RegionName'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'RegionName': instance.RegionName,
    };

CenterUP _$CenterUPFromJson(Map<String, dynamic> json) => CenterUP(
      json['id'] as int,
      json['CenterName'] as String,
      json['RegionId'] as String,
    );

Map<String, dynamic> _$CenterUPToJson(CenterUP instance) => <String, dynamic>{
      'id': instance.id,
      'CenterName': instance.CenterName,
      'RegionId': instance.RegionId,
    };

SchoolYear _$SchoolYearFromJson(Map<String, dynamic> json) => SchoolYear(
      json['id'] as int,
      json['school_display_name'] as String,
      json['school_value'] as String,
    );

Map<String, dynamic> _$SchoolYearToJson(SchoolYear instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_display_name': instance.school_display_name,
      'school_value': instance.school_value,
    };

RoleType _$RoleTypeFromJson(Map<String, dynamic> json) => RoleType(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$RoleTypeToJson(RoleType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TShirtSize _$TShirtSizeFromJson(Map<String, dynamic> json) => TShirtSize(
      json['id'] as int,
      json['size'] as String,
    );

Map<String, dynamic> _$TShirtSizeToJson(TShirtSize instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
    };

Wing _$WingFromJson(Map<String, dynamic> json) => Wing(
      json['id'] as int,
      json['wingName'] as String,
      json['gender'] as String,
    );

Map<String, dynamic> _$WingToJson(Wing instance) => <String, dynamic>{
      'id': instance.id,
      'wingName': instance.wingName,
      'gender': instance.gender,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['id'] as int,
      json['country_name'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'country_name': instance.country_name,
    };

StateUP _$StateUPFromJson(Map<String, dynamic> json) => StateUP(
      json['id'] as int,
      json['name'] as String,
      json['country_id'] as String,
    );

Map<String, dynamic> _$StateUPToJson(StateUP instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.country_id,
    };

EmergencyContactInformation _$EmergencyContactInformationFromJson(
        Map<String, dynamic> json) =>
    EmergencyContactInformation(
      json['emergency_contact1_name'] as String?,
      json['emergency_contact1_pri_phone'] as String?,
      json['emergency_contact1_sec_phone'] as String?,
      json['emergency_contact1_email'] as String?,
      json['emergency_contact2_name'] as String?,
      json['emergency_contact2_pri_phone'] as String?,
      json['emergency_contact2_sec_phone'] as String?,
      json['emergency_contact2_email'] as String?,
    );

Map<String, dynamic> _$EmergencyContactInformationToJson(
        EmergencyContactInformation instance) =>
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

Seva _$SevaFromJson(Map<String, dynamic> json) => Seva(
      json['id'] as int,
      json['sevaName'] as String,
    );

Map<String, dynamic> _$SevaToJson(Seva instance) => <String, dynamic>{
      'id': instance.id,
      'sevaName': instance.sevaName,
    };

FamilyContactInformation _$FamilyContactInformationFromJson(
        Map<String, dynamic> json) =>
    FamilyContactInformation(
      json['father_name'] as String?,
      json['father_cellphone'] as String?,
      json['father_email'] as String?,
      json['mother_name'] as String?,
      json['mother_cellphone'] as String?,
      json['mother_email'] as String?,
    );

Map<String, dynamic> _$FamilyContactInformationToJson(
        FamilyContactInformation instance) =>
    <String, dynamic>{
      'father_name': instance.father_name,
      'father_cellphone': instance.father_cellphone,
      'father_email': instance.father_email,
      'mother_name': instance.mother_name,
      'mother_cellphone': instance.mother_cellphone,
      'mother_email': instance.mother_email,
    };

SatsangInformation _$SatsangInformationFromJson(Map<String, dynamic> json) =>
    SatsangInformation(
      json['t_shirt_size'],
      json['t_shirt_size_id'],
      json['current_wing'],
      json['current_wing_name'],
      json['year_of_entered_in_satsang'],
      json['school_year'],
      $enumDecode(_$GenderStatusEnumMap, json['gender']),
      json['group'],
      json['primary_seva_wing'],
      json['primary_seva_wing_name'],
      json['primary_seva'],
      json['primary_seva_name'],
      json['secondary_seva_wing'],
      json['secondary_seva_wing_name'],
      json['secondary_seva'],
      json['secondary_seva_name'],
      json['undergraduate_school'],
      $enumDecodeNullable(_$StudentTypeEnumMap, json['student_type']),
      json['major_expected_major'],
      json['career_interest'],
      json['bst_kst_member'],
      json['networking_target'],
      json['sub_group'],
    );

Map<String, dynamic> _$SatsangInformationToJson(SatsangInformation instance) =>
    <String, dynamic>{
      't_shirt_size': instance.t_shirt_size,
      't_shirt_size_id': instance.t_shirt_size_id,
      'current_wing': instance.current_wing,
      'current_wing_name': instance.current_wing_name,
      'year_of_entered_in_satsang': instance.year_of_entered_in_satsang,
      'school_year': instance.school_year,
      'gender': _$GenderStatusEnumMap[instance.gender],
      'group': instance.group,
      'primary_seva_wing': instance.primary_seva_wing,
      'primary_seva_wing_name': instance.primary_seva_wing_name,
      'primary_seva': instance.primary_seva,
      'primary_seva_name': instance.primary_seva_name,
      'secondary_seva_wing': instance.secondary_seva_wing,
      'secondary_seva_wing_name': instance.secondary_seva_wing_name,
      'secondary_seva': instance.secondary_seva,
      'secondary_seva_name': instance.secondary_seva_name,
      'undergraduate_school': instance.undergraduate_school,
      'student_type': _$StudentTypeEnumMap[instance.student_type],
      'major_expected_major': instance.major_expected_major,
      'career_interest': instance.career_interest,
      'bst_kst_member': instance.bst_kst_member,
      'networking_target': instance.networking_target,
      'sub_group': instance.sub_group,
    };

const _$GenderStatusEnumMap = {
  GenderStatus.male: 'male',
  GenderStatus.female: 'female',
};

const _$StudentTypeEnumMap = {
  StudentType.commuter: 'commuter',
  StudentType.away: 'away',
};

MedicalInformation _$MedicalInformationFromJson(Map<String, dynamic> json) =>
    MedicalInformation(
      json['allergies'] as String?,
      json['medication_taken'] as String?,
      json['medical_conditions'] as String?,
      json['special_medical_instructions'] as String?,
      json['notes'] as String?,
    );

Map<String, dynamic> _$MedicalInformationToJson(MedicalInformation instance) =>
    <String, dynamic>{
      'allergies': instance.allergies,
      'medication_taken': instance.medication_taken,
      'medical_conditions': instance.medical_conditions,
      'special_medical_instructions': instance.special_medical_instructions,
      'notes': instance.notes,
    };

ContactInformation _$ContactInformationFromJson(Map<String, dynamic> json) =>
    ContactInformation(
      json['f_name'],
      json['m_name'],
      json['l_name'],
      json['email'],
      json['date_of_birth'],
      json['user_id'],
      json['region_id'],
      json['region_name'],
      json['center_id'],
      json['center_name'],
      json['home_address'],
      json['apartment'],
      json['city'],
      json['state'],
      json['state_name'],
      json['country'],
      json['country_name'],
      json['zip_code'],
      json['home_phone'],
      json['cell_phone'],
    );

Map<String, dynamic> _$ContactInformationToJson(ContactInformation instance) =>
    <String, dynamic>{
      'f_name': instance.f_name,
      'm_name': instance.m_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'date_of_birth': instance.date_of_birth,
      'user_id': instance.user_id,
      'region_id': instance.region_id,
      'region_name': instance.region_name,
      'center_id': instance.center_id,
      'center_name': instance.center_name,
      'home_address': instance.home_address,
      'apartment': instance.apartment,
      'city': instance.city,
      'state': instance.state,
      'state_name': instance.state_name,
      'country': instance.country,
      'country_name': instance.country_name,
      'zip_code': instance.zip_code,
      'home_phone': instance.home_phone,
      'cell_phone': instance.cell_phone,
    };

SocialMediaInformation _$SocialMediaInformationFromJson(
        Map<String, dynamic> json) =>
    SocialMediaInformation(
      json['facebook_id'] as String?,
      json['twitter_id'] as String?,
      json['instagram_id'] as String?,
      json['snapchat_id'] as String?,
      json['linkedin_id'] as String?,
    );

Map<String, dynamic> _$SocialMediaInformationToJson(
        SocialMediaInformation instance) =>
    <String, dynamic>{
      'facebook_id': instance.facebook_id,
      'twitter_id': instance.twitter_id,
      'instagram_id': instance.instagram_id,
      'snapchat_id': instance.snapchat_id,
      'linkedin_id': instance.linkedin_id,
    };

PersonnelInformation _$PersonnelInformationFromJson(
        Map<String, dynamic> json) =>
    PersonnelInformation(
      json['f_name'],
      json['m_name'],
      json['l_name'],
      json['email'],
      json['date_of_birth'],
      json['user_id'],
      json['region_id'],
      json['region_name'],
      json['center_id'],
      json['center_name'],
    );

Map<String, dynamic> _$PersonnelInformationToJson(
        PersonnelInformation instance) =>
    <String, dynamic>{
      'f_name': instance.f_name,
      'm_name': instance.m_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'date_of_birth': instance.date_of_birth,
      'user_id': instance.user_id,
      'region_id': instance.region_id,
      'region_name': instance.region_name,
      'center_id': instance.center_id,
      'center_name': instance.center_name,
    };
