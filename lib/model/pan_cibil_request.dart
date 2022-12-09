import 'package:json_annotation/json_annotation.dart';
part 'pan_cibil_request.g.dart';

@JsonSerializable()
class PanCibilRequest {
  PanCibilRequest({
    this.mobile,
    this.dob,
    this.gender,
    this.pincode,
    this.loan_amount,
    this.email,
    this.income,
  });

  final String? mobile;
  final String? dob;
  final String? gender;
  final String? pincode;
  final String? loan_amount;
  final String? email;
  final String? income;

  Map<String, dynamic> toJson() => _$PanCibilRequestToJson(this);

}
