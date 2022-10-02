import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'standardResponse.g.dart';

@JsonSerializable()
class StandardResponse extends Equatable {
  final int status;
  final String message;
  final dynamic data;

  StandardResponse(this.status, this.message, this.data);
  factory StandardResponse.fromJson(Map<String, dynamic> json) =>
      _$StandardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StandardResponseToJson(this);

  @override
  List<Object> get props => [status];
}
