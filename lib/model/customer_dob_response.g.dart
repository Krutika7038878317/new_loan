// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dob_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDobResponse _$CustomerDobResponseFromJson(Map<String, dynamic> json) =>
    CustomerDobResponse(
      status: json['status'] as bool?,
      data: json['data'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$CustomerDobResponseToJson(
        CustomerDobResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'token': instance.token,
    };
