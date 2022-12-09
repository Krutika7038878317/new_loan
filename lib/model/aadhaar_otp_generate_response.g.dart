// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aadhaar_otp_generate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AadhaarOtpGenerateResponse _$AadhaarOtpGenerateResponseFromJson(
        Map<String, dynamic> json) =>
    AadhaarOtpGenerateResponse(
      status: json['status'] as bool? ?? false,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$AadhaarOtpGenerateResponseToJson(
        AadhaarOtpGenerateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
