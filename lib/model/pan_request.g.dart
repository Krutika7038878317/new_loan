// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanRequest _$PanRequestFromJson(Map<String, dynamic> json) => PanRequest(
      mobile: json['mobile'] as String?,
      pan_number: json['pan_number'] as String?,
    );

Map<String, dynamic> _$PanRequestToJson(PanRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'pan_number': instance.pan_number,
    };
