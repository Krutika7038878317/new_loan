import 'package:json_annotation/json_annotation.dart';

part 'new_user_otp_verify_response.g.dart';

@JsonSerializable()
class NewUserOTPVerifyResponse {

  final bool? status;
  final String? data;
  @JsonKey(name: 'cust')
  final CustomerHspData? customerHspData;

  NewUserOTPVerifyResponse({
    this.status = false,
    this.data ,
    this.customerHspData,
  });

  factory NewUserOTPVerifyResponse.fromJson(Map<String, dynamic> json) => _$NewUserOTPVerifyResponseFromJson(json);

}

@JsonSerializable()
class CustomerHspData {

  @JsonKey(name: 'pan_details')
  final PanDetails? panDetails;

  @JsonKey(name: 'employment')
  final EmploymentDetails? employmentDetails;


  @JsonKey(name: 'current_address_pincode')
  final String? pincode;
  @JsonKey(name: 'loan_amount')
  final int? loanAmount;
  @JsonKey(name: 'email_id')
  final String? emailID;


  CustomerHspData({
    this.panDetails,
    this.employmentDetails,
    this.pincode,
    this.loanAmount,
    this.emailID
  });

  factory CustomerHspData.fromJson(Map<String, dynamic> json) => _$CustomerHspDataFromJson(json);

}


@JsonSerializable()
class PanDetails {


  @JsonKey(name: 'pan_entered')
  final String? panNumber;
  @JsonKey(name: 'name')
  final String? panName;

  @JsonKey(name: 'pan_data')
  final PanData? panData;


  PanDetails({
    this.panNumber,
    this.panName,
    this.panData
  });

  factory PanDetails.fromJson(Map<String, dynamic> json) => _$PanDetailsFromJson(json);

}


@JsonSerializable()
class PanData {


  final String? gender;
  final String? dob;

  PanData({
    this.gender,
    this.dob,
  });

  factory PanData.fromJson(Map<String, dynamic> json) => _$PanDataFromJson(json);

}

@JsonSerializable()
class EmploymentDetails {


  @JsonKey(name: 'type')
  final String? employmentType;
  @JsonKey(name: 'net_income')
  final int? income;

  EmploymentDetails({
    this.employmentType,
    this.income,
  });

  factory EmploymentDetails.fromJson(Map<String, dynamic> json) => _$EmploymentDetailsFromJson(json);

}
