// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pan_cibil_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanCibilRequest _$PanCibilRequestFromJson(Map<String, dynamic> json) =>
    PanCibilRequest(
      mobile: json['mobile'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      pincode: json['pincode'] as String?,
      loan_amount: json['loan_amount'] as String?,
      email: json['email'] as String?,
      income: json['income'] as String?,
    );

Map<String, dynamic> _$PanCibilRequestToJson(PanCibilRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'dob': instance.dob,
      'gender': instance.gender,
      'pincode': instance.pincode,
      'loan_amount': instance.loan_amount,
      'email': instance.email,
      'income': instance.income,
    };
