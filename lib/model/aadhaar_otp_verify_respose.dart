import 'package:json_annotation/json_annotation.dart';

part 'aadhaar_otp_verify_respose.g.dart';

@JsonSerializable()
class AadhaarOtpVerifyResponse {
  AadhaarOtpVerifyResponse({this.status = false, this.data});

  final bool? status;
  final AadharOTPVerify? data;

  factory AadhaarOtpVerifyResponse.fromJson(Map<String, dynamic> json) => _$AadhaarOtpVerifyResponseFromJson(json);
}

@JsonSerializable()
class AadharOTPVerify {
  AadharOTPVerify({
    this.name,
    this.address,
    this.pincode,
    this.is_aadhar_verified=false});

  final String? name;
  final String? address;
  final String? pincode;
  final bool? is_aadhar_verified;

  factory AadharOTPVerify.fromJson(Map<String, dynamic> json) =>
      _$AadharOTPVerifyFromJson(json);
}
