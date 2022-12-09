// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfoRequest _$DeviceInfoRequestFromJson(Map<String, dynamic> json) =>
    DeviceInfoRequest(
      id: json['id'] as String?,
      model: json['model'] as String?,
      version_id: json['version_id'] as String?,
      version: json['version'] as String?,
      name: json['name'] as String?,
      notification_id: json['notification_id'] as String?,
      ip: json['ip'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      fingerprint: json['fingerprint'] as bool?,
    );

Map<String, dynamic> _$DeviceInfoRequestToJson(DeviceInfoRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'version_id': instance.version_id,
      'version': instance.version,
      'name': instance.name,
      'notification_id': instance.notification_id,
      'ip': instance.ip,
      'lat': instance.lat,
      'lng': instance.lng,
      'fingerprint': instance.fingerprint,
    };
