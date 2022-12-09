// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanResponse _$PanResponseFromJson(Map<String, dynamic> json) => PanResponse(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : PanData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PanResponseToJson(PanResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

PanData _$PanDataFromJson(Map<String, dynamic> json) => PanData(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$PanDataToJson(PanData instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob,
    };
