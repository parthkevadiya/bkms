import 'package:equatable/equatable.dart';
import 'package:flutter_app/utils/gender_status.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/student_type.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel /*extends Equatable*/ {
  final dynamic is_edit;
  final dynamic user_id;
  final dynamic record_id;
  final String? role;
  final ContactInformation? contact_information;
  final SocialMediaInformation? social_media_information;
  final MedicalInformation? medical_information;
  final SatsangInformation? satsang_information;
  final FamilyContactInformation? family_contact_information;
  final EmergencyContactInformation? emergency_contact_information;
  @JsonKey(defaultValue: [])
  final List<StateUP?> state;
  @JsonKey(defaultValue: [])
  final List<Country?> country;
  @JsonKey(defaultValue: [])
  final List<Wing?> wing;
  @JsonKey(defaultValue: [])
  final List<TShirtSize?> tishirtsize;
  @JsonKey(defaultValue: [])
  final List<RoleType?> role_type;
  @JsonKey(defaultValue: [])
  final List<Seva?> seva;
  @JsonKey(defaultValue: [])
  final List<Region?> region;
  @JsonKey(defaultValue: [])
  final List<CenterUP?> center;
  @JsonKey(defaultValue: [])
  final List<SchoolYear?> school_year;
  @JsonKey(defaultValue: [])
  final List<GroupUP?> group;

  UserProfileModel(
      this.is_edit,
      this.user_id,
      this.record_id,
      this.role,
      this.contact_information,
      this.social_media_information,
      this.medical_information,
      this.satsang_information,
      this.family_contact_information,
      this.emergency_contact_information,
      this.state,
      this.country,
      this.wing,
      this.tishirtsize,
      this.role_type,
      this.seva,
      this.region,
      this.center,
      this.school_year,
      this.group);

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);

  /*@override
  List<Object> get props => [user_id];*/
}

@JsonSerializable()
class GroupUP extends Equatable {
  final int id;
  final String group_name;

  GroupUP(this.id, this.group_name);

  factory GroupUP.fromJson(Map<String, dynamic> json) => _$GroupUPFromJson(json);

  Map<String, dynamic> toJson() => _$GroupUPToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class Region extends Equatable {
  final int id;
  final String RegionName;

  Region(this.id, this.RegionName);

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class CenterUP extends Equatable {
  final int id;
  final String CenterName;
  final String RegionId;

  CenterUP(this.id, this.CenterName, this.RegionId);

  factory CenterUP.fromJson(Map<String, dynamic> json) => _$CenterUPFromJson(json);

  Map<String, dynamic> toJson() => _$CenterUPToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class SchoolYear extends Equatable {
  final int id;
  final String school_display_name;
  final String school_value;

  SchoolYear(this.id, this.school_display_name, this.school_value);

  factory SchoolYear.fromJson(Map<String, dynamic> json) => _$SchoolYearFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolYearToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class RoleType extends Equatable {
  final int id;
  final String name;

  RoleType(this.id, this.name);

  factory RoleType.fromJson(Map<String, dynamic> json) => _$RoleTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RoleTypeToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class TShirtSize extends Equatable {
  final int id;
  final String size;

  TShirtSize(this.id, this.size);

  factory TShirtSize.fromJson(Map<String, dynamic> json) => _$TShirtSizeFromJson(json);

  Map<String, dynamic> toJson() => _$TShirtSizeToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class Wing extends Equatable {
  final int id;
  final String wingName;
  final String gender;

  Wing(this.id, this.wingName, this.gender);

  factory Wing.fromJson(Map<String, dynamic> json) => _$WingFromJson(json);

  Map<String, dynamic> toJson() => _$WingToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class Country extends Equatable {
  final int id;
  final String country_name;

  Country(this.id, this.country_name);

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class StateUP extends Equatable {
  final int id;
  final String name;
  final String country_id;

  StateUP(this.id, this.name, this.country_id);

  factory StateUP.fromJson(Map<String, dynamic> json) => _$StateUPFromJson(json);

  Map<String, dynamic> toJson() => _$StateUPToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class EmergencyContactInformation extends Equatable {
  final String? emergency_contact1_name;
  final String? emergency_contact1_pri_phone;
  dynamic get emergencyContact1PriPhone {
    if (emergency_contact1_pri_phone == null) {
      return "";
    } else {
      return number(emergency_contact1_pri_phone);
    }
  }

  final String? emergency_contact1_sec_phone;
  dynamic get emergencyContact1SecPhone {
    if (emergency_contact1_sec_phone == null) {
      return "";
    } else {
      return number(emergency_contact1_sec_phone);
    }
  }

  final String? emergency_contact1_email;
  final String? emergency_contact2_name;
  final String? emergency_contact2_pri_phone;
  dynamic get emergencyContact2PriPhone {
    if (emergency_contact2_pri_phone == null) {
      return "";
    } else {
      return number(emergency_contact2_pri_phone);
    }
  }

  final String? emergency_contact2_sec_phone;
  dynamic get emergencyContact2SecPhone {
    if (emergency_contact2_sec_phone == null) {
      return "";
    } else {
      return number(emergency_contact2_sec_phone);
    }
  }

  final String? emergency_contact2_email;

  number(num) {
    String _phone = "";
    String phoneNumber = num.toString().replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "").replaceAll("-", "");
    print(phoneNumber);
    for (int i = 0; i < phoneNumber.length; i++) {
      _phone += phoneNumber[i];
      if (i == 0) {
        _phone = "(" + _phone;
      }
      if (i == 2) {
        _phone += ") ";
      }
      if (i == 5) {
        _phone += "-";
      }
    }
    return _phone;
  }

  EmergencyContactInformation(
    this.emergency_contact1_name,
    this.emergency_contact1_pri_phone,
    this.emergency_contact1_sec_phone,
    this.emergency_contact1_email,
    this.emergency_contact2_name,
    this.emergency_contact2_pri_phone,
    this.emergency_contact2_sec_phone,
    this.emergency_contact2_email,
  );

  factory EmergencyContactInformation.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactInformationFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactInformationToJson(this);

  @override
  List<Object> get props => [''];
}

@JsonSerializable()
class Seva extends Equatable {
  final int id;
  final String sevaName;

  Seva(this.id, this.sevaName);

  factory Seva.fromJson(Map<String, dynamic> json) => _$SevaFromJson(json);

  Map<String, dynamic> toJson() => _$SevaToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class FamilyContactInformation extends Equatable {
  final String? father_name;
  final String? father_cellphone;
  dynamic get fatherCellPhone {
    if (father_cellphone == null) {
      return "";
    } else {
      return number(father_cellphone);
    }
  }

  final String? father_email;
  final String? mother_name;
  final String? mother_cellphone;
  dynamic get motherCellPhone {
    if (mother_cellphone == null) {
      return "";
    } else {
      return number(mother_cellphone);
    }
  }

  final String? mother_email;

  number(num) {
    String _phone = "";
    String phoneNumber = num.toString().replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "").replaceAll("-", "");
    print(phoneNumber);
    for (int i = 0; i < phoneNumber.length; i++) {
      _phone += phoneNumber[i];
      if (i == 0) {
        _phone = "(" + _phone;
      }
      if (i == 2) {
        _phone += ") ";
      }
      if (i == 5) {
        _phone += "-";
      }
    }
    return _phone;
  }

  FamilyContactInformation(
    this.father_name,
    this.father_cellphone,
    this.father_email,
    this.mother_name,
    this.mother_cellphone,
    this.mother_email,
  );

  factory FamilyContactInformation.fromJson(Map<String, dynamic> json) => _$FamilyContactInformationFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyContactInformationToJson(this);

  @override
  List<Object> get props => [''];
}

@JsonSerializable()
class SatsangInformation extends Equatable {
  final dynamic t_shirt_size;
  final dynamic t_shirt_size_id;
  final dynamic current_wing;
  final dynamic current_wing_name;
  final dynamic year_of_entered_in_satsang;
  final dynamic school_year;
  final GenderStatus gender;
  final dynamic group;
  final dynamic primary_seva_wing;
  final dynamic primary_seva_wing_name;
  final dynamic primary_seva;
  final dynamic primary_seva_name;
  final dynamic secondary_seva_wing;
  final dynamic secondary_seva_wing_name;
  final dynamic secondary_seva;
  final dynamic secondary_seva_name;
  final dynamic undergraduate_school;
  final StudentType? student_type;
  final dynamic major_expected_major;
  dynamic career_interest;
  dynamic bst_kst_member;
  bool get bstKstMember {
    if (bst_kst_member == "1") {
      return true;
    } else {
      return false;
    }
  }

  final dynamic networking_target;
  bool get networkingTarget {
    if (networking_target == "1") {
      return true;
    } else {
      return false;
    }
  }

  final dynamic sub_group;

  SatsangInformation(
    this.t_shirt_size,
    this.t_shirt_size_id,
    this.current_wing,
    this.current_wing_name,
    this.year_of_entered_in_satsang,
    this.school_year,
    this.gender,
    this.group,
    this.primary_seva_wing,
    this.primary_seva_wing_name,
    this.primary_seva,
    this.primary_seva_name,
    this.secondary_seva_wing,
    this.secondary_seva_wing_name,
    this.secondary_seva,
    this.secondary_seva_name,
    this.undergraduate_school,
    this.student_type,
    this.major_expected_major,
    this.career_interest,
    this.bst_kst_member,
    this.networking_target,
    this.sub_group,
  );

  factory SatsangInformation.fromJson(Map<String, dynamic> json) => _$SatsangInformationFromJson(json);

  Map<String, dynamic> toJson() => _$SatsangInformationToJson(this);

  @override
  List<Object> get props => [current_wing];
}

@JsonSerializable()
class MedicalInformation extends Equatable {
  final String? allergies;
  final String? medication_taken;
  final String? medical_conditions;
  final String? special_medical_instructions;
  final String? notes;

  MedicalInformation(
    this.allergies,
    this.medication_taken,
    this.medical_conditions,
    this.special_medical_instructions,
    this.notes,
  );

  factory MedicalInformation.fromJson(Map<String, dynamic> json) => _$MedicalInformationFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInformationToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class ContactInformation extends Equatable {
  final dynamic f_name;
  final dynamic m_name;
  final dynamic l_name;
  final dynamic email;
  final dynamic date_of_birth;
  final dynamic user_id;
  final dynamic region_id;
  final dynamic region_name;
  final dynamic center_id;
  final dynamic center_name;
  final dynamic home_address;
  final dynamic apartment;
  final dynamic city;
  final dynamic state;
  final dynamic state_name;
  final dynamic country;
  final dynamic country_name;
  final dynamic zip_code;
  final dynamic home_phone;

  dynamic get homePhone {
    if (home_phone == null) {
      return "";
    } else {
      return number(home_phone);
    }
  }

  final dynamic cell_phone;
  dynamic get cellPhone {
    if (cell_phone == null) {
      return "";
    } else {
      return number(cell_phone);
    }
  }

  number(num) {
    String _phone = "";
    String phoneNumber = num.toString().replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "").replaceAll("-", "");
    print(phoneNumber);
    for (int i = 0; i < phoneNumber.length; i++) {
      _phone += phoneNumber[i];
      if (i == 0) {
        _phone = "(" + _phone;
      }
      if (i == 2) {
        _phone += ") ";
      }
      if (i == 5) {
        _phone += "-";
      }
    }
    return _phone;
  }

  ContactInformation(
      this.f_name,
      this.m_name,
      this.l_name,
      this.email,
      this.date_of_birth,
      this.user_id,
      this.region_id,
      this.region_name,
      this.center_id,
      this.center_name,
      this.home_address,
      this.apartment,
      this.city,
      this.state,
      this.state_name,
      this.country,
      this.country_name,
      this.zip_code,
      this.home_phone,
      this.cell_phone);

  factory ContactInformation.fromJson(Map<String, dynamic> json) => _$ContactInformationFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInformationToJson(this);

  @override
  List<Object> get props => [home_address];
}

@JsonSerializable()
class SocialMediaInformation extends Equatable {
  final String? facebook_id;
  final String? twitter_id;
  final String? instagram_id;
  final String? snapchat_id;
  final String? linkedin_id;

  SocialMediaInformation(
    this.facebook_id,
    this.twitter_id,
    this.instagram_id,
    this.snapchat_id,
    this.linkedin_id,
  );

  factory SocialMediaInformation.fromJson(Map<String, dynamic> json) => _$SocialMediaInformationFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaInformationToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class PersonnelInformation extends Equatable {
  final dynamic f_name;
  final dynamic m_name;
  final dynamic l_name;
  final dynamic email;
  final dynamic date_of_birth;
  final dynamic user_id;
  final dynamic region_id;
  final dynamic region_name;
  final dynamic center_id;
  final dynamic center_name;

  PersonnelInformation(
    this.f_name,
    this.m_name,
    this.l_name,
    this.email,
    this.date_of_birth,
    this.user_id,
    this.region_id,
    this.region_name,
    this.center_id,
    this.center_name,
  );

  factory PersonnelInformation.fromJson(Map<String, dynamic> json) => _$PersonnelInformationFromJson(json);

  Map<String, dynamic> toJson() => _$PersonnelInformationToJson(this);

  @override
  List<Object> get props => [user_id];
}
