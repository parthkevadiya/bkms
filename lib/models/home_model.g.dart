// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      json['total_event_count'],
      json['total_my_surveys'],
      json['total_my_upcoming_birthdays'],
      (json['my_event'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : MyEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['my_survey'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : MySurveys.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['upcoming_birthdays'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UpcomingBirthdays.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['upcoming_birthdays_permission'],
      json['is_survey_permission'],
      json['is_event_permission'],
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'total_event_count': instance.total_event_count,
      'total_my_surveys': instance.total_my_surveys,
      'total_my_upcoming_birthdays': instance.total_my_upcoming_birthdays,
      'upcoming_birthdays_permission': instance.upcoming_birthdays_permission,
      'is_survey_permission': instance.is_survey_permission,
      'is_event_permission': instance.is_event_permission,
      'my_event': instance.my_event,
      'my_survey': instance.my_survey,
      'upcoming_birthdays': instance.upcoming_birthdays,
    };

MyEvent _$MyEventFromJson(Map<String, dynamic> json) => MyEvent(
      json['id'],
      json['name'] as String,
      json['image'] as String?,
      json['description'],
      json['country'] as String,
      json['date_time'] as String?,
      json['registration_status'],
      json['is_open'] as String?,
      json['user_type'] as String?,
      json['is_expired'] as String?,
    )
      ..userevent_id = json['userevent_id'] as String?
      ..basic_registration_status = json['basic_registration_status'] as String?
      ..liability_form_status = json['liability_form_status'] as String?;

Map<String, dynamic> _$MyEventToJson(MyEvent instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'country': instance.country,
      'date_time': instance.date_time,
      'registration_status': instance.registration_status,
      'is_open': instance.is_open,
      'user_type': instance.user_type,
      'is_expired': instance.is_expired,
      'userevent_id': instance.userevent_id,
      'basic_registration_status': instance.basic_registration_status,
      'liability_form_status': instance.liability_form_status,
    };

MySurveys _$MySurveysFromJson(Map<String, dynamic> json) => MySurveys(
      json['id'],
      json['name'] as String,
      json['due_date'] as String,
    );

Map<String, dynamic> _$MySurveysToJson(MySurveys instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'due_date': instance.due_date,
    };

UpcomingBirthdays _$UpcomingBirthdaysFromJson(Map<String, dynamic> json) =>
    UpcomingBirthdays(
      json['id'],
      json['name'] as String,
      json['image'] as String?,
      json['birth_date'] as String,
      json['regional'] as String,
      json['role'] as String,
    );

Map<String, dynamic> _$UpcomingBirthdaysToJson(UpcomingBirthdays instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'birth_date': instance.birth_date,
      'regional': instance.regional,
      'role': instance.role,
    };
