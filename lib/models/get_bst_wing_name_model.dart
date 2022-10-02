import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_bst_wing_name_model.g.dart';

@JsonSerializable()
class GetBSTWingNameModel /*extends Equatable*/ {
  final bool? has_error;
  final int? wing_count;
  final List<BSTWingModel?>? wing;

  GetBSTWingNameModel(this.has_error,this.wing_count,this.wing,);

  factory GetBSTWingNameModel.fromJson(Map<String, dynamic> json) => _$GetBSTWingNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetBSTWingNameModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class BSTWingModel {
  final String? wing_id;
  final String? wingName;

  BSTWingModel(this.wing_id, this.wingName);

  factory BSTWingModel.fromJson(Map<String, dynamic> json) => _$BSTWingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSTWingModelToJson(this);
}
