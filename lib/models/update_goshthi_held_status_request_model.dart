import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_goshthi_held_status_request_model.g.dart';

@JsonSerializable()
class UpdateGoshthiHeldStatusRequestModel /*extends Equatable*/ {
  final String login_user_type;
  final String login_parent_type;
  final String user_role_type;
  final String bkms_id;
  final String karyakar_goshti_sabha_id;
  final String selected_center;
  final String selected_region;
  final String goshthi_status;
  final String sabha_date;
  final String sabha_label;
  final String sabha_wing;
  final String total_datatable_records;
  final List<StatusArrayModel> status_array;

  UpdateGoshthiHeldStatusRequestModel(
      this.login_user_type,
      this.login_parent_type,
      this.user_role_type,
      this.bkms_id,
      this.karyakar_goshti_sabha_id,
      this.selected_center,
      this.selected_region,
      this.goshthi_status,
      this.sabha_date,
      this.sabha_label,
      this.sabha_wing,
      this.total_datatable_records,
      this.status_array);

  factory UpdateGoshthiHeldStatusRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateGoshthiHeldStatusRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateGoshthiHeldStatusRequestModelToJson(this);

/*@override
  List<Object> get props => [total_reocrds];*/
}

@JsonSerializable()
class StatusArrayModel {
  final String? id;
  final String? value;

  StatusArrayModel(this.id, this.value,);

  factory StatusArrayModel.fromJson(Map<String, dynamic> json) => _$StatusArrayModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusArrayModelToJson(this);
}