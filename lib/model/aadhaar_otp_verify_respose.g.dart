// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aadhaar_otp_verify_respose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AadhaarOtpVerifyResponse _$AadhaarOtpVerifyResponseFromJson(
        Map<String, dynamic> json) =>
    AadhaarOtpVerifyResponse(
      status: json['status'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : AadharOTPVerify.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AadhaarOtpVerifyResponseToJson(
        AadhaarOtpVerifyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

AadharOTPVerify _$AadharOTPVerifyFromJson(Map<String, dynamic> json) =>
    AadharOTPVerify(
      name: json['name'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      is_aadhar_verified: json['is_aadhar_verified'] as bool? ?? false,
    );

Map<String, dynamic> _$AadharOTPVerifyToJson(AadharOTPVerify instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'pincode': instance.pincode,
      'is_aadhar_verified': instance.is_aadhar_verified,
    };
