import 'package:json_annotation/json_annotation.dart';
part 'create_mpin_request.g.dart';

@JsonSerializable()
class CreateMpinRequest {
  CreateMpinRequest({
    this.mpin,
    this.device_login
  });

  final String? mpin;
  final bool? device_login;

  Map<String, dynamic> toJson() => _$CreateMpinRequestToJson(this);

}
