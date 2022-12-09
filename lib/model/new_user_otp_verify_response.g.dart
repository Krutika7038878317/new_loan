// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_otp_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUserOTPVerifyResponse _$NewUserOTPVerifyResponseFromJson(
        Map<String, dynamic> json) =>
    NewUserOTPVerifyResponse(
      status: json['status'] as bool? ?? false,
      data: json['data'] as String?,
      customerHspData: json['cust'] == null
          ? null
          : CustomerHspData.fromJson(json['cust'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewUserOTPVerifyResponseToJson(
        NewUserOTPVerifyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'cust': instance.customerHspData,
    };

CustomerHspData _$CustomerHspDataFromJson(Map<String, dynamic> json) =>
    CustomerHspData(
      panDetails: json['pan_details'] == null
          ? null
          : PanDetails.fromJson(json['pan_details'] as Map<String, dynamic>),
      employmentDetails: json['employment'] == null
          ? null
          : EmploymentDetails.fromJson(
              json['employment'] as Map<String, dynamic>),
      pincode: json['current_address_pincode'] as String?,
      loanAmount: json['loan_amount'] as int?,
      emailID: json['email_id'] as String?,
    );

Map<String, dynamic> _$CustomerHspDataToJson(CustomerHspData instance) =>
    <String, dynamic>{
      'pan_details': instance.panDetails,
      'employment': instance.employmentDetails,
      'current_address_pincode': instance.pincode,
      'loan_amount': instance.loanAmount,
      'email_id': instance.emailID,
    };

PanDetails _$PanDetailsFromJson(Map<String, dynamic> json) => PanDetails(
      panNumber: json['pan_entered'] as String?,
      panName: json['name'] as String?,
      panData: json['pan_data'] == null
          ? null
          : PanData.fromJson(json['pan_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PanDetailsToJson(PanDetails instance) =>
    <String, dynamic>{
      'pan_entered': instance.panNumber,
      'name': instance.panName,
      'pan_data': instance.panData,
    };

PanData _$PanDataFromJson(Map<String, dynamic> json) => PanData(
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$PanDataToJson(PanData instance) => <String, dynamic>{
      'gender': instance.gender,
      'dob': instance.dob,
    };

EmploymentDetails _$EmploymentDetailsFromJson(Map<String, dynamic> json) =>
    EmploymentDetails(
      employmentType: json['type'] as String?,
      income: json['net_income'] as int?,
    );

Map<String, dynamic> _$EmploymentDetailsToJson(EmploymentDetails instance) =>
    <String, dynamic>{
      'type': instance.employmentType,
      'net_income': instance.income,
    };
