import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_in_model.g.dart';

@JsonSerializable()
class CheckInModel /*extends Equatable*/ {

  CheckInModel();

  factory CheckInModel.fromJson(Map<String, dynamic> json) => _$CheckInModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}