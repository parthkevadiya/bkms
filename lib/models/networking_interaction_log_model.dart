import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'networking_interaction_log_model.g.dart';

@JsonSerializable()
class NetworkingInteractionLogModel /*extends Equatable*/ {
  final bool? has_error;
  final InteractionLogListModel? interaction_log_list;

  NetworkingInteractionLogModel(this.has_error, this.interaction_log_list);

  factory NetworkingInteractionLogModel.fromJson(Map<String, dynamic> json) => _$NetworkingInteractionLogModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingInteractionLogModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class InteractionLogListModel {
  final int? current_page;
  final int? total;
  final List<InteractionLogDataModel?>? data;

  InteractionLogListModel(this.current_page, this.total, this.data);

  factory InteractionLogListModel.fromJson(Map<String, dynamic> json) => _$InteractionLogListModelFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionLogListModelToJson(this);
}

@JsonSerializable()
class InteractionLogDataModel {
  final String? id;
  final String? FirstName;
  final String? LastName;
  final String? interaction_date;
  final String? interaction_type;
  final String? name;
  final String? event_name;
  final String? reportdate;

  InteractionLogDataModel(
      this.id,
      this.FirstName,
      this.LastName,
      this.interaction_date,
      this.interaction_type,
      this.name,
      this.event_name,
      this.reportdate
      );

  factory InteractionLogDataModel.fromJson(Map<String, dynamic> json) => _$InteractionLogDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionLogDataModelToJson(this);
}