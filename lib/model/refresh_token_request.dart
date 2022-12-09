import 'package:json_annotation/json_annotation.dart';
part 'refresh_token_request.g.dart';
@JsonSerializable()
class RefreshTokenRequest {
  RefreshTokenRequest({this.mobile, this.mpin});

  final String? mobile;
  final String? mpin;

  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}
