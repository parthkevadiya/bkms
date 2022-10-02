import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'take_bst_attendance_model.g.dart';

@JsonSerializable()
class TakeBSTAttendanceModel /*extends Equatable*/ {
  final bool? has_error;

  TakeBSTAttendanceModel(this.has_error);

  factory TakeBSTAttendanceModel.fromJson(Map<String, dynamic> json) => _$TakeBSTAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TakeBSTAttendanceModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}
