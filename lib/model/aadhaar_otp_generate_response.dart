import 'package:json_annotation/json_annotation.dart';

part 'aadhaar_otp_generate_response.g.dart';

@JsonSerializable()
class AadhaarOtpGenerateResponse {
  AadhaarOtpGenerateResponse({this.status = false, this.data});

  final bool? status;
  final String? data;

  factory AadhaarOtpGenerateResponse.fromJson(Map<String, dynamic> json) =>
      _$AadhaarOtpGenerateResponseFromJson(json);
}
