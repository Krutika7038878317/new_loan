// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_mpin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMpinRequest _$CreateMpinRequestFromJson(Map<String, dynamic> json) =>
    CreateMpinRequest(
      mpin: json['mpin'] as String?,
      device_login: json['device_login'] as bool?,
    );

Map<String, dynamic> _$CreateMpinRequestToJson(CreateMpinRequest instance) =>
    <String, dynamic>{
      'mpin': instance.mpin,
      'device_login': instance.device_login,
    };
