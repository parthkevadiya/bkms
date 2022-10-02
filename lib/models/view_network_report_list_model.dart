import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'view_network_report_list_model.g.dart';

@JsonSerializable()
class ViewNetworkingReportListModel /*extends Equatable*/ {
  final bool? has_error;
  final NetworkingListModel? networking_list;

  ViewNetworkingReportListModel(this.has_error, this.networking_list);

  factory ViewNetworkingReportListModel.fromJson(Map<String, dynamic> json) => _$ViewNetworkingReportListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewNetworkingReportListModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class NetworkingListModel {
  final int? current_page;
  final int? total;
  final List<NetworkingListDataModel?>? data;

  NetworkingListModel(this.current_page, this.total, this.data);

  factory NetworkingListModel.fromJson(Map<String, dynamic> json) => _$NetworkingListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingListModelToJson(this);
}

@JsonSerializable()
class NetworkingListDataModel {
  final String? user_id;
  final String? user_name;
  final String? total_user_interaction;
  final String? total_parent_interaction;
  final String? current_networking_user;

  NetworkingListDataModel(
      this.user_id,
      this.user_name,
      this.total_user_interaction,
      this.total_parent_interaction,
      this.current_networking_user);

  factory NetworkingListDataModel.fromJson(Map<String, dynamic> json) => _$NetworkingListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingListDataModelToJson(this);
}