// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vkyc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VKycResponse _$VKycResponseFromJson(Map<String, dynamic> json) => VKycResponse(
      status: json['status'] as bool?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$VKycResponseToJson(VKycResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
