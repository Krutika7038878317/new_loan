import 'package:json_annotation/json_annotation.dart';
part 'pan_request.g.dart';
@JsonSerializable()
class PanRequest {
  PanRequest({this.mobile, this.pan_number});

  final String? mobile;
  final String? pan_number;

  Map<String, dynamic> toJson() => _$PanRequestToJson(this);
}
