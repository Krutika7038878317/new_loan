import 'package:json_annotation/json_annotation.dart';
part 'aadhaar_verify_otp_request.g.dart';

@JsonSerializable()
class AadhaarVerifyOTPRequest{
  AadhaarVerifyOTPRequest({this.aadharotp});

  final String? aadharotp;
  Map<String, dynamic> toJson() => _$AadhaarVerifyOTPRequestToJson(this);
}