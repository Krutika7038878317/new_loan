import 'package:json_annotation/json_annotation.dart';

part 'pan_response.g.dart';

@JsonSerializable()
class PanResponse {
  PanResponse({this.status, this.data});
  final bool? status;
  final PanData? data;
  factory PanResponse.fromJson(Map<String, dynamic> json) => _$PanResponseFromJson(json);
}

@JsonSerializable()
class PanData {
  PanData({this.name, this.gender, this.dob});
  final String? name;
  final String? gender;
  final String? dob;
  factory PanData.fromJson(Map<String, dynamic> json) => _$PanDataFromJson(json);
}
