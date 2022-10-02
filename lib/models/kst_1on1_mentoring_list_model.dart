import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kst_1on1_mentoring_list_model.g.dart';

@JsonSerializable()
class KST1On1MentoringListModel /*extends Equatable*/ {
  final bool? has_error;
  final K1On1MResultModel? result;

  KST1On1MentoringListModel(this.has_error, this.result);

  factory KST1On1MentoringListModel.fromJson(Map<String, dynamic> json) => _$KST1On1MentoringListModelFromJson(json);

  Map<String, dynamic> toJson() => _$KST1On1MentoringListModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class K1On1MResultModel {
  final List<K1On1MDataModel?>? data;
  final int? total;

  K1On1MResultModel(this.data, this.total,);

  factory K1On1MResultModel.fromJson(Map<String, dynamic> json) => _$K1On1MResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$K1On1MResultModelToJson(this);
}

@JsonSerializable()
class K1On1MDataModel {
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

  K1On1MDataModel(
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

  factory K1On1MDataModel.fromJson(Map<String, dynamic> json) => _$K1On1MDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$K1On1MDataModelToJson(this);
}