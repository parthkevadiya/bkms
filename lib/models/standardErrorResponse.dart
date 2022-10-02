import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'standardErrorResponse.g.dart';

@JsonSerializable()
class StandardErrorResponse /*extends Equatable*/ {
  final int status;
  final String message;

  StandardErrorResponse(this.status, this.message);
  factory StandardErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$StandardErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StandardErrorResponseToJson(this);

  /*@override
  List<Object> get props => [status];*/
}