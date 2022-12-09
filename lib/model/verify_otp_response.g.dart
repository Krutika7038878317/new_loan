// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOTPResponse _$VerifyOTPResponseFromJson(Map<String, dynamic> json) =>
    VerifyOTPResponse(
      status: json['status'] as bool? ?? false,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : CustomerData.fromJson(json['data'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$VerifyOTPResponseToJson(VerifyOTPResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'data': instance.data,
      'name': instance.name,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      name: json['name'] as String?,
      mobile: json['mobile'] as int?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      device: json['device'] == null
          ? null
          : CustomerDeviceData.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'dob': instance.dob,
      'device': instance.device,
    };

CustomerDeviceData _$CustomerDeviceDataFromJson(Map<String, dynamic> json) =>
    CustomerDeviceData(
      mpin: json['mpin'] as int?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      deviceLogin: json['device_login'] as bool? ?? false,
      fingerprint: json['fingerprint'] as bool? ?? false,
      deviceId: json['id'] as String?,
      ipAddress: json['ip'] as String?,
      model: json['model'] as String?,
      name: json['name'] as String?,
      version: json['version'] as String?,
      versionId: json['version_id'] as String?,
    );

Map<String, dynamic> _$CustomerDeviceDataToJson(CustomerDeviceData instance) =>
    <String, dynamic>{
      'mpin': instance.mpin,
      'lat': instance.lat,
      'long': instance.long,
      'device_login': instance.deviceLogin,
      'fingerprint': instance.fingerprint,
      'id': instance.deviceId,
      'ip': instance.ipAddress,
      'model': instance.model,
      'name': instance.name,
      'version': instance.version,
      'version_id': instance.versionId,
    };
