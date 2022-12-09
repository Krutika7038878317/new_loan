// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dob_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDobRequest _$CustomerDobRequestFromJson(Map<String, dynamic> json) =>
    CustomerDobRequest(
      mobile: json['mobile'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      pincode: json['pincode'] as int?,
      loan_amount: json['loan_amount'] as int?,
      email: json['email'] as String?,
      income: json['income'] as int?,
    );

Map<String, dynamic> _$CustomerDobRequestToJson(CustomerDobRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'dob': instance.dob,
      'gender': instance.gender,
      'pincode': instance.pincode,
      'loan_amount': instance.loan_amount,
      'email': instance.email,
      'income': instance.income,
    };
