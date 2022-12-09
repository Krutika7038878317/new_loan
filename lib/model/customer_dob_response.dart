import 'package:json_annotation/json_annotation.dart';
part 'customer_dob_response.g.dart';

@JsonSerializable()
class CustomerDobResponse {
  CustomerDobResponse({this.status, this.data, this.token});

  final bool? status;
  final String? data;
  final String? token;
  factory CustomerDobResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerDobResponseFromJson(json);
}
