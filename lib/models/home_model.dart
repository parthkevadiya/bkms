import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel /*extends Equatable*/
{
  final dynamic total_event_count;
  final dynamic total_my_surveys;
  final dynamic total_my_upcoming_birthdays;
  final dynamic upcoming_birthdays_permission;
  final dynamic is_survey_permission;
  final dynamic is_event_permission;
  final List<MyEvent?>? my_event;
  final List<MySurveys?>? my_survey;
  final List<UpcomingBirthdays?>? upcoming_birthdays;

  HomeModel(
      this.total_event_count,
      this.total_my_surveys,
      this.total_my_upcoming_birthdays,
      this.my_event,
      this.my_survey,
      this.upcoming_birthdays,
      this.upcoming_birthdays_permission,
      this.is_survey_permission,
      this.is_event_permission);

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

/*@override
  List<Object> get props => [name];*/
}

@JsonSerializable()
class MyEvent {
  final dynamic id;
  final String name;
  final String? image;
  final dynamic description;
  final String country;
  final String? date_time;
  final dynamic registration_status;
  final String? is_open;
  final String? user_type;
  final String? is_expired;
  final String registration_fee = "99";
  String? userevent_id;
  String? basic_registration_status;
  String? liability_form_status;

  MyEvent(
      this.id,
      this.name,
      this.image,
      this.description,
      this.country,
      this.date_time,
      this.registration_status,
      this.is_open,
      this.user_type,
      this.is_expired);

  factory MyEvent.fromJson(Map<String, dynamic> json) =>
      _$MyEventFromJson(json);

  Map<String, dynamic> toJson() => _$MyEventToJson(this);
}

@JsonSerializable()
class MySurveys {
  final dynamic id;
  final String name;
  final String due_date;

  MySurveys(this.id, this.name, this.due_date);

  factory MySurveys.fromJson(Map<String, dynamic> json) =>
      _$MySurveysFromJson(json);

  Map<String, dynamic> toJson() => _$MySurveysToJson(this);
}

@JsonSerializable()
class UpcomingBirthdays {
  final dynamic id;
  final String name;
  final String? image;
  final String birth_date;
  final String regional;
  final String role;

  UpcomingBirthdays(this.id, this.name, this.image, this.birth_date,
      this.regional, this.role);

  factory UpcomingBirthdays.fromJson(Map<String, dynamic> json) =>
      _$UpcomingBirthdaysFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingBirthdaysToJson(this);
}
