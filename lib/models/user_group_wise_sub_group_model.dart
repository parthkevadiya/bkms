import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_group_wise_sub_group_model.g.dart';

@JsonSerializable()
class UserGroupWiseSubGroupModel /*extends Equatable*/ {
  final bool? has_error;
  final int? subgroups_count;
  final List<String?>? subgroups;

  UserGroupWiseSubGroupModel(this.has_error, this.subgroups_count, this.subgroups);

  factory UserGroupWiseSubGroupModel.fromJson(Map<String, dynamic> json) => _$UserGroupWiseSubGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserGroupWiseSubGroupModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}