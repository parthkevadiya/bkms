import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_goshthi_held_status_model.g.dart';

@JsonSerializable()
class UpdateGoshthiHeldStatusModel /*extends Equatable*/ {
  final bool? has_error;

  UpdateGoshthiHeldStatusModel(this.has_error);

  factory UpdateGoshthiHeldStatusModel.fromJson(Map<String, dynamic> json) => _$UpdateGoshthiHeldStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateGoshthiHeldStatusModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}