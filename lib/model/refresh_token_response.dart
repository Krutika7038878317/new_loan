import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshTokenResponse {
  RefreshTokenResponse({
    this.status,
    this.token,
    this.data,
    this.appversion
  });
  final bool? status;
  final String? token;
  final CustomerData? data;
  final String? appversion;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);
}

@JsonSerializable()
class CustomerData {
  CustomerData({this.name,this.mobile, this.gender, this.dob});
  final String? name;
  final int? mobile;
  final String? gender;
  final String? dob;
  factory CustomerData.fromJson(Map<String, dynamic> json) => _$CustomerDataFromJson(json);
}
