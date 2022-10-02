import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_config.g.dart';

@JsonSerializable()
@Default(null)
class RemoteConfigModel /*extends Equatable*/ {
  final String base_url;
  final String publish_key;

  RemoteConfigModel(
    this.base_url,
    this.publish_key,
  );

  static RemoteConfigModel fromConfig(Map<String, RemoteConfigValue> config) {
    return RemoteConfigModel(
      config['base_url']!.asString(),
      config['publish_key']?.asString() ?? "",
    );
  }

  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) => _$RemoteConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteConfigModelToJson(this);

/*@override
  List<Object> get props => [bkms_id];*/
}
