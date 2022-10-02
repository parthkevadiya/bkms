import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collect_filters_request_model.g.dart';

@JsonSerializable()
class CollectFiltersRequestModel /*extends Equatable*/ {
  String login_user_type;
  String login_parent_type;
  final String bkms_id;

  CollectFiltersRequestModel(
      this.login_user_type,
      this.login_parent_type,
    this.bkms_id,
  );

  factory CollectFiltersRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CollectFiltersRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectFiltersRequestModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}
