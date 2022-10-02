import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stripe_info_model.g.dart';

@JsonSerializable()
class StripeInfoModel /*extends Equatable*/ {
  final String client_id;
  final String client_secret;
  final String payment_type;
  final String event_id;
  final String user_id;
  final int myevent_id;
  final List<RegistrationFeesModel?>? registration_fees;
  final CurrentStateRecordModel? current_state_record;
  final CurrentCountryRecordModel? current_country_record;
  final List<PaymentCountryModel?>? payment_country;
  final List<PaymentStateModel?>? payment_state;
  final LateFeeModel late_fee;
  final MainEventDataModel main_event_data;
  final int payable_amonunt;

  StripeInfoModel(
      this.client_id,
      this.client_secret,
      this.payment_type,
      this.event_id,
      this.user_id,
      this.myevent_id,
      this.registration_fees,
      this.current_state_record,
      this.current_country_record,
      this.payment_country,
      this.payment_state,
      this.late_fee,
      this.main_event_data,
      this.payable_amonunt);

  factory StripeInfoModel.fromJson(Map<String, dynamic> json) => _$StripeInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$StripeInfoModelToJson(this);

/*@override
  List<Object> get props => [''];*/
}

@JsonSerializable()
class RegistrationFeesModel {
  final String id;
  final String event_id;
  final String fee_type;
  final String description;
  final String early_fee;
  final String regular_fee;
  final String max_attendee;
  final String family_room;
  final String status;
  final String? created_at;
  final String? updated_at;
  final String total_paid_users;

  RegistrationFeesModel(this.id, this.event_id, this.fee_type, this.description, this.early_fee, this.regular_fee,
      this.max_attendee, this.family_room, this.status, this.created_at, this.updated_at, this.total_paid_users);

  factory RegistrationFeesModel.fromJson(Map<String, dynamic> json) => _$RegistrationFeesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationFeesModelToJson(this);
}

@JsonSerializable()
class CurrentStateRecordModel {
  final String id;
  final String state_code;
  final String name;
  final String country_id;

  CurrentStateRecordModel(this.id, this.state_code, this.name, this.country_id);

  factory CurrentStateRecordModel.fromJson(Map<String, dynamic> json) => _$CurrentStateRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentStateRecordModelToJson(this);
}

@JsonSerializable()
class CurrentCountryRecordModel {
  final int id;
  final String country_name;
  final String payment_gateway;

  CurrentCountryRecordModel(this.id, this.country_name, this.payment_gateway);

  factory CurrentCountryRecordModel.fromJson(Map<String, dynamic> json) => _$CurrentCountryRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentCountryRecordModelToJson(this);
}

@JsonSerializable()
class PaymentCountryModel {
  final String id;
  final String country_name;
  final String? created_at;
  final String? updated_at;

  PaymentCountryModel(this.id, this.country_name, this.created_at, this.updated_at);

  factory PaymentCountryModel.fromJson(Map<String, dynamic> json) => _$PaymentCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCountryModelToJson(this);
}

@JsonSerializable()
class PaymentStateModel {
  final String id;
  final String name;
  final String country_id;

  PaymentStateModel(this.id, this.name, this.country_id);

  factory PaymentStateModel.fromJson(Map<String, dynamic> json) => _$PaymentStateModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentStateModelToJson(this);
}

@JsonSerializable()
class MainEventDataModel {
  final int id;
  final String early_reg_start_date;
  final String reg_start_date;
  final String reg_end_date;
  final String event_start_date;
  final String event_end_date;

  MainEventDataModel(this.id, this.early_reg_start_date, this.reg_start_date, this.reg_end_date, this.event_start_date,
      this.event_end_date);

  factory MainEventDataModel.fromJson(Map<String, dynamic> json) => _$MainEventDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainEventDataModelToJson(this);
}

@JsonSerializable()
class LateFeeModel {
  final String id;
  final String fee_type;
  final String description;
  final String regular_fee;

  LateFeeModel(this.id, this.fee_type, this.description, this.regular_fee);

  factory LateFeeModel.fromJson(Map<String, dynamic> json) => _$LateFeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$LateFeeModelToJson(this);
}
