import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOTPResponse {

  final bool? status;
  final String? token;
  final CustomerData? data;
  final String? name;


  VerifyOTPResponse({
    this.status = false,
    this.token,
    this.data,
    this.name,
  });

  factory VerifyOTPResponse.fromJson(Map<String, dynamic> json) => _$VerifyOTPResponseFromJson(json);

}


@JsonSerializable()
class CustomerData {

  final String? name;
  final int? mobile;
  final String? gender;
  final String? dob;

  final CustomerDeviceData? device;

  CustomerData({
    this.name,
    this.mobile,
    this.gender,
    this.dob,
    this.device,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => _$CustomerDataFromJson(json);

}


@JsonSerializable()
class CustomerDeviceData {

  final int? mpin;
  final double? lat;
  final double? long;
  @JsonKey(name: 'device_login')
  final bool? deviceLogin;
  final bool? fingerprint;
  @JsonKey(name: 'id')
  final String? deviceId;
  @JsonKey(name: 'ip')
  final String? ipAddress;
  final String? model;
  final String? name;
  final String? version;
  @JsonKey(name: 'version_id')
  final String? versionId;


  CustomerDeviceData({
    this.mpin,
    this.lat,
    this.long,
    this.deviceLogin=false,
    this.fingerprint=false,
    this.deviceId,
    this.ipAddress,
    this.model,
    this.name,
    this.version,
    this.versionId,
  });

  factory CustomerDeviceData.fromJson(Map<String, dynamic> json) => _$CustomerDeviceDataFromJson(json);

}
