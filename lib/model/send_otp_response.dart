import 'package:json_annotation/json_annotation.dart';

part 'send_otp_response.g.dart';

@JsonSerializable()
class SendOTPResponse {

  final bool? status;

  SendOTPResponse({
    this.status = false,
  });

  factory SendOTPResponse.fromJson(Map<String, dynamic> json) => _$SendOTPResponseFromJson(json);

}

