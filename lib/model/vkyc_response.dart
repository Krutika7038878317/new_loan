import 'package:json_annotation/json_annotation.dart';

part 'vkyc_response.g.dart';

@JsonSerializable()
class VKycResponse{
  VKycResponse({this.status,this.data});

  final bool? status;
  final String? data;
}