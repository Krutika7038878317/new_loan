import 'package:json_annotation/json_annotation.dart';
part 'aadhar_otp_generate_request.g.dart';

@JsonSerializable()
class AadhaarOtpGenerateRequest{
  AadhaarOtpGenerateRequest({this.aadhar_number});

  final String? aadhar_number;
  Map<String, dynamic> toJson() => _$AadhaarOtpGenerateRequestToJson(this);
}