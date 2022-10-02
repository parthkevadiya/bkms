import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_interaction_details_model.g.dart';

@JsonSerializable()
class CreateInteractionDetailsModel /*extends Equatable*/ {
  final bool? has_error;
  final NetworkingDataModel? networking_data;

  CreateInteractionDetailsModel(this.has_error, this.networking_data);

  factory CreateInteractionDetailsModel.fromJson(Map<String, dynamic> json) => _$CreateInteractionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInteractionDetailsModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class NetworkingDataModel {
  final String? user_role_type;
  final String? user_region_id;
  final String? user_center_id;
  final List<CNERegionItems?>? regions;
  final List<CNECentersItems?>? centers;

  NetworkingDataModel(this.user_role_type, this.user_region_id,
      this.user_center_id, this.regions, this.centers);

  factory NetworkingDataModel.fromJson(Map<String, dynamic> json) => _$NetworkingDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkingDataModelToJson(this);
}

@JsonSerializable()
class CNERegionItems {
  final int? id;
  final String? RegionName;

  CNERegionItems(this.id, this.RegionName);

  factory CNERegionItems.fromJson(Map<String, dynamic> json) => _$CNERegionItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CNERegionItemsToJson(this);
}

@JsonSerializable()
class CNECentersItems {
  final int? id;
  final String? CenterName;
  final String? RegionId;

  CNECentersItems(this.id, this.CenterName, this.RegionId);

  factory CNECentersItems.fromJson(Map<String, dynamic> json) => _$CNECentersItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CNECentersItemsToJson(this);
}