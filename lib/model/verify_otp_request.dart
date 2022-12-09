import 'package:json_annotation/json_annotation.dart';
part 'verify_otp_request.g.dart';

@JsonSerializable()
class VerifyOTPRequest {
  VerifyOTPRequest({
    this.mobile,
    this.mobileotp,
  });

  final String? mobile;
  final String? mobileotp;

  Map<String, dynamic> toJson() => _$VerifyOTPRequestToJson(this);

}
