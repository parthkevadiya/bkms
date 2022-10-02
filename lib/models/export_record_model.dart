import 'package:json_annotation/json_annotation.dart';

part 'export_record_model.g.dart';

@JsonSerializable()
class ExportModel /*extends Equatable*/ {
  final dynamic file_url;

  ExportModel(
    this.file_url,
  );

  factory ExportModel.fromJson(Map<String, dynamic> json) =>
      _$ExportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExportModelToJson(this);

/*
  @override
  List<Object> get props => [total_reocrds];*/
}
