import 'package:json_annotation/json_annotation.dart';
part 'customer_dob_request.g.dart';

@JsonSerializable()
class CustomerDobRequest{
  CustomerDobRequest({this.mobile,this.dob,this.gender,this.pincode,this.loan_amount,this.email,this.income});

  final String? mobile;
  final String? dob;
  final String? gender;
  final int? pincode;
  final int? loan_amount;
  final String? email;
  final int? income;

  Map<String, dynamic> toJson() => _$CustomerDobRequestToJson(this);
}