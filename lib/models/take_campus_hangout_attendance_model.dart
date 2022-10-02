import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'take_campus_hangout_attendance_model.g.dart';

@JsonSerializable()
class TakeCampusHangoutAttendanceModel /*extends Equatable*/ {
  final bool? has_error;
  final dynamic campus_hangout_id;

  TakeCampusHangoutAttendanceModel(this.has_error, this.campus_hangout_id);

  factory TakeCampusHangoutAttendanceModel.fromJson(Map<String, dynamic> json) => _$TakeCampusHangoutAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TakeCampusHangoutAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
