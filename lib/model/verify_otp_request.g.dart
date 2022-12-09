// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOTPRequest _$VerifyOTPRequestFromJson(Map<String, dynamic> json) =>
    VerifyOTPRequest(
      mobile: json['mobile'] as String?,
      mobileotp: json['mobileotp'] as String?,
    );

Map<String, dynamic> _$VerifyOTPRequestToJson(VerifyOTPRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'mobileotp': instance.mobileotp,
    };
