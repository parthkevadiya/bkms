  import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_model.g.dart';

@JsonSerializable()
class UpdateProfileModel /*extends Equatable*/ {


  UpdateProfileModel(
     );

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}