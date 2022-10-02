import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kst_education_mentoring_list_model.g.dart';

@JsonSerializable()
class KSTEducationMentoringListModel /*extends Equatable*/ {
  final bool? has_error;
  final String? screen_title;
  final KEMResultModel? result;

  KSTEducationMentoringListModel(this.has_error, this.screen_title, this.result);

  factory KSTEducationMentoringListModel.fromJson(Map<String, dynamic> json) => _$KSTEducationMentoringListModelFromJson(json);

  Map<String, dynamic> toJson() => _$KSTEducationMentoringListModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class KEMResultModel {
  final List<KEMDataModel?>? data;
  final int? total;

  KEMResultModel(this.data, this.total,);

  factory KEMResultModel.fromJson(Map<String, dynamic> json) => _$KEMResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$KEMResultModelToJson(this);
}

@JsonSerializable()
class KEMDataModel {
  final String? id;
  final String? region_id;
  final String? center_id;
  final String? kst_center_report_id;
  final String? kst_fallspring_report_id;
  final String? kst_report_type;
  final String? interaction_type;
  final String? interaction_date;
  final String? interaction_session;
  final String? submitted_for_name;
  final String? reported_by;

  KEMDataModel(
      this.id,
      this.region_id,
      this.center_id,
      this.kst_center_report_id,
      this.kst_fallspring_report_id,
      this.kst_report_type,
      this.interaction_type,
      this.interaction_date,
      this.interaction_session,
      this.submitted_for_name,
      this.reported_by);

  factory KEMDataModel.fromJson(Map<String, dynamic> json) => _$KEMDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$KEMDataModelToJson(this);
}