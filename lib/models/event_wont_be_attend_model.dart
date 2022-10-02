import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_wont_be_attend_model.g.dart';
@JsonSerializable()
class EventWontBeAttendModel /*extends Equatable*/
 {

  EventWontBeAttendModel();

  factory EventWontBeAttendModel.fromJson(Map<String, dynamic> json) => _$EventWontBeAttendModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventWontBeAttendModelToJson(this);

/*@override
  List<Object> get props => [name];*/
}