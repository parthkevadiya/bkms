import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_transportation_details_model.g.dart';

@JsonSerializable()
class SubmitTransportationsDetailsModel /*extends Equatable*/ {
  final int? id;

  SubmitTransportationsDetailsModel(
      this.id
  );

  factory SubmitTransportationsDetailsModel.fromJson(Map<String, dynamic> json) => _$SubmitTransportationsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitTransportationsDetailsModelToJson(this);

  /*@override
  List<Object> get props => [bkms_id];*/
}