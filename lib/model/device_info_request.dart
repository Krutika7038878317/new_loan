import 'package:json_annotation/json_annotation.dart';
part 'device_info_request.g.dart';

@JsonSerializable()
class DeviceInfoRequest {
  DeviceInfoRequest({
    this.id,
    this.model,
    this.version_id,
    this.version,
    this.name,
    this.notification_id,
    this.ip,
    this.lat,
    this.lng,
    this.fingerprint,
  });

  final String? id;
  final String? model;
  final String? version_id;
  final String? version;
  final String? name;
  final String? notification_id;
  final String? ip;
  final String? lat;
  final String? lng;
  final bool? fingerprint;

  Map<String, dynamic> toJson() => _$DeviceInfoRequestToJson(this);

}
