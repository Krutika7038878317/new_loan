import 'package:json_annotation/json_annotation.dart';

part 'get_status_response.g.dart';

@JsonSerializable()
class GetStatusResponse {

  final bool? status;
  final StatusData? data;

  GetStatusResponse({
    this.status = false,
    this.data
  });

  factory GetStatusResponse.fromJson(Map<String, dynamic> json) => _$GetStatusResponseFromJson(json);

}


@JsonSerializable()
class StatusData {

  final CustomerData? customer;
  final List<Cards>? cards;


  StatusData({
    this.customer,
    this.cards,
  });

  factory StatusData.fromJson(Map<String, dynamic> json) => _$StatusDataFromJson(json);

}

@JsonSerializable()
class CustomerData {


  final IdentityData? identity;

  @JsonKey(name: 'credit_score')
  final CreditScoreData? creditScoreData;

  @JsonKey(name: 'device')
  final DeviceData? deviceData;


  final String? id;
  @JsonKey(name: 'email_id')
  final String? emailId;
  @JsonKey(name: 'is_discrepancy')
  final bool? isDiscrepancy;
  final int? mobile;

  CustomerData({

    this.identity,
    this.creditScoreData,
    this.deviceData,

    this.id,
    this.emailId,
    this.isDiscrepancy,
    this.mobile,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => _$CustomerDataFromJson(json);

}


@JsonSerializable()
class IdentityData {

  @JsonKey(name: 'poa_details')
  final PoaDetails? poaDetails;
  final String? name;
  final String? gender;
  final String? dob;


  IdentityData({
    this.poaDetails,
    this.name,
    this.gender,
    this.dob,
  });

  factory IdentityData.fromJson(Map<String, dynamic> json) => _$IdentityDataFromJson(json);

}

@JsonSerializable()
class PoaDetails {

  @JsonKey(name: 'aadhar_details')
  final AadharDetails? aadharDetails;
  @JsonKey(name: 'pan_details')
  final PanDetails? panDetails;

  PoaDetails({
    this.aadharDetails,
    this.panDetails
  });

  factory PoaDetails.fromJson(Map<String, dynamic> json) => _$PoaDetailsFromJson(json);

}
@JsonSerializable()
class AadharDetails {

  @JsonKey(name: 'is_aadhar_verified')
  final bool? isAadharVerified;

  AadharDetails({
    this.isAadharVerified,
  });

  factory AadharDetails.fromJson(Map<String, dynamic> json) => _$AadharDetailsFromJson(json);

}

@JsonSerializable()
class PanDetails {

  @JsonKey(name: 'is_pan_verified')
  final bool? isPanVerified;

  PanDetails({
    this.isPanVerified,
  });

  factory PanDetails.fromJson(Map<String, dynamic> json) => _$PanDetailsFromJson(json);

}


@JsonSerializable()
class CreditScoreData {

  final String? score;
  final String? score_date;

  CreditScoreData({
    this.score,
    this.score_date,
  });

  factory CreditScoreData.fromJson(Map<String, dynamic> json) => _$CreditScoreDataFromJson(json);

}

@JsonSerializable()
class DeviceData {

  final int? mpin;

  DeviceData({
    this.mpin,
  });

  factory DeviceData.fromJson(Map<String, dynamic> json) => _$DeviceDataFromJson(json);

}


@JsonSerializable()
class Cards {

  @JsonKey(name: '_id')
  final String? cardId;

  final String? cardNumber;

  final String? status;

  @JsonKey(name: 'card_active')
  final bool? cardActive;

  final bool? softApproval;
  final bool? autoSoftApproval;
  final String? cardToken;


  @JsonKey(name: 'limit')
  final LimitData? limitData;

  @JsonKey(name: 'mandate')
  final MandateData? mandateData;

  @JsonKey(name: 'selfie')
  final SelfieData? selfieData;

  @JsonKey(name: 'bank_details')
  final BankDetails? bankDetails;

  @JsonKey(name: 'card_active_checks')
  final List<CardActiveChecks>? cardActiveChecks;


  @JsonKey(name: 'type')
  final TypeData? typeData;


  Cards({
    this.cardId,
    this.cardNumber,
    this.status,
    this.cardActive,
    this.softApproval,
    this.autoSoftApproval,
    this.cardToken,
    this.limitData,
    this.mandateData,
    this.selfieData,
    this.bankDetails,
    this.cardActiveChecks,
    this.typeData,
  });

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);

}


@JsonSerializable()
class LimitData {

  final bool? limit;
  final int? total;
  final int? utilized;

  final bool? mediclaim;
  final int? mediclaimLimit;
  final int? mediclaimUtilized;

  final bool? withdrawal;
  final int? withdrawalLimit;
  final int? withdrawalUtilized;

  LimitData({
    this.limit,
    this.total,
    this.utilized,
    this.mediclaim,
    this.mediclaimLimit,
    this.mediclaimUtilized,
    this.withdrawal,
    this.withdrawalLimit,
    this.withdrawalUtilized,
  });

  factory LimitData.fromJson(Map<String, dynamic> json) => _$LimitDataFromJson(json);

}


@JsonSerializable()
class MandateData {

  final bool? is_created;

  MandateData({
    this.is_created,
  });

  factory MandateData.fromJson(Map<String, dynamic> json) => _$MandateDataFromJson(json);

}


@JsonSerializable()
class SelfieData {

  final String? link;
  final bool? is_uploaded;
  final bool? is_verified;

  SelfieData({
    this.link,
    this.is_uploaded,
    this.is_verified,
  });

  factory SelfieData.fromJson(Map<String, dynamic> json) => _$SelfieDataFromJson(json);

}

@JsonSerializable()
class BankDetails {

  final String? account_no;
  final bool? bank_verified;

  BankDetails({
    this.account_no,
    this.bank_verified
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) => _$BankDetailsFromJson(json);

}

@JsonSerializable()
class CardActiveChecks {

  final String? name;
  final int? sort;
  final bool? required;
  final bool? uploaded;
  final bool? verified;
  final bool? kyc_check;
  final String? description;
  final String? updated_at;
  final String? id;

  CardActiveChecks({
    this.name,
    this.sort,
    this.required,
    this.uploaded,
    this.verified,
    this.kyc_check,
    this.description,
    this.updated_at,
    this.id
  });

  factory CardActiveChecks.fromJson(Map<String, dynamic> json) => _$CardActiveChecksFromJson(json);

}


@JsonSerializable()
class TypeData {

  final String? id;
  final int? type;
  final String? name;
  final String? card_image;

  TypeData({
    this.id,
    this.type,
    this.name,
    this.card_image,
  });

  factory TypeData.fromJson(Map<String, dynamic> json) => _$TypeDataFromJson(json);

}
