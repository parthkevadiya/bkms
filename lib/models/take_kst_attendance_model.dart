import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'take_kst_attendance_model.g.dart';

@JsonSerializable()
class TakeKSTAttendanceModel /*extends Equatable*/ {
  final bool? has_error;

  TakeKSTAttendanceModel(this.has_error);

  factory TakeKSTAttendanceModel.fromJson(Map<String, dynamic> json) => _$TakeKSTAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TakeKSTAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
