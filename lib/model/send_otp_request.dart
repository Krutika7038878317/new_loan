import 'package:json_annotation/json_annotation.dart';
part 'send_otp_request.g.dart';

@JsonSerializable()
class SendOTPRequest {
  SendOTPRequest({
    this.mobile,
  });

  final String? mobile;

  Map<String, dynamic> toJson() => _$SendOTPRequestToJson(this);

}
