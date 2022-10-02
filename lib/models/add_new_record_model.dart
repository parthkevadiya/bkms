import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_new_record_model.g.dart';

@JsonSerializable()
class AddNewRecordModel /*extends Equatable*/ {
  AddNewRecordModel();

  factory AddNewRecordModel.fromJson(Map<String, dynamic> json) => _$AddNewRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewRecordModelToJson(this);

  /*@override
  List<Object> get props => [''];*/
}

@JsonSerializable()
class UserWiseGroup /*extends Equatable*/ {
  final WingData wing_data;
  final GroupData group_data;
  final bool has_error;
  final List<UserSeva> seva;
  UserWiseGroup(
    this.wing_data,
    this.group_data,
    this.has_error,
    this.seva,
  );

  factory UserWiseGroup.fromJson(Map<String, dynamic> json) => _$UserWiseGroupFromJson(json);

  Map<String, dynamic> toJson() => _$UserWiseGroupToJson(this);

  /*@override
  List<Object> get props => [''];*/
}

@JsonSerializable()
class WingData /*extends Equatable*/ {
  final String? wing_id;
  final String? wing_name;

  WingData(
    this.wing_id,
    this.wing_name,
  );

  factory WingData.fromJson(Map<String, dynamic> json) => _$WingDataFromJson(json);

  Map<String, dynamic> toJson() => _$WingDataToJson(this);

  /*@override
  List<Object> get props => [''];*/
}

@JsonSerializable()
class GroupData /*extends Equatable*/ {
  final int? group_id;
  final String? group_name;

  GroupData(
    this.group_id,
    this.group_name,
  );

  factory GroupData.fromJson(Map<String, dynamic> json) => _$GroupDataFromJson(json);

  Map<String, dynamic> toJson() => _$GroupDataToJson(this);

  /*@override
  List<Object> get props => [''];*/
}

@JsonSerializable()
class UserSeva /*extends Equatable*/ {
  final int? id;
  final String? sevaName;

  UserSeva(
    this.id,
    this.sevaName,
  );

  factory UserSeva.fromJson(Map<String, dynamic> json) => _$UserSevaFromJson(json);

  Map<String, dynamic> toJson() => _$UserSevaToJson(this);

  /*@override
  List<Object> get props => [''];*/
}
