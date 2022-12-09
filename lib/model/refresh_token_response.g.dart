// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResponse _$RefreshTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponse(
      status: json['status'] as bool?,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : CustomerData.fromJson(json['data'] as Map<String, dynamic>),
      appversion: json['appversion'] as String?,
    );

Map<String, dynamic> _$RefreshTokenResponseToJson(
        RefreshTokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'data': instance.data,
      'appversion': instance.appversion,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      name: json['name'] as String?,
      mobile: json['mobile'] as int?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'dob': instance.dob,
    };
