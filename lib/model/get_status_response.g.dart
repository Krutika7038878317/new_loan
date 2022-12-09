// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatusResponse _$GetStatusResponseFromJson(Map<String, dynamic> json) =>
    GetStatusResponse(
      status: json['status'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : StatusData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStatusResponseToJson(GetStatusResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

StatusData _$StatusDataFromJson(Map<String, dynamic> json) => StatusData(
      customer: json['customer'] == null
          ? null
          : CustomerData.fromJson(json['customer'] as Map<String, dynamic>),
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => Cards.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatusDataToJson(StatusData instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'cards': instance.cards,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      identity: json['identity'] == null
          ? null
          : IdentityData.fromJson(json['identity'] as Map<String, dynamic>),
      creditScoreData: json['credit_score'] == null
          ? null
          : CreditScoreData.fromJson(
              json['credit_score'] as Map<String, dynamic>),
      deviceData: json['device'] == null
          ? null
          : DeviceData.fromJson(json['device'] as Map<String, dynamic>),
      id: json['id'] as String?,
      emailId: json['email_id'] as String?,
      isDiscrepancy: json['is_discrepancy'] as bool?,
      mobile: json['mobile'] as int?,
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'credit_score': instance.creditScoreData,
      'device': instance.deviceData,
      'id': instance.id,
      'email_id': instance.emailId,
      'is_discrepancy': instance.isDiscrepancy,
      'mobile': instance.mobile,
    };

IdentityData _$IdentityDataFromJson(Map<String, dynamic> json) => IdentityData(
      poaDetails: json['poa_details'] == null
          ? null
          : PoaDetails.fromJson(json['poa_details'] as Map<String, dynamic>),
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$IdentityDataToJson(IdentityData instance) =>
    <String, dynamic>{
      'poa_details': instance.poaDetails,
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob,
    };

PoaDetails _$PoaDetailsFromJson(Map<String, dynamic> json) => PoaDetails(
      aadharDetails: json['aadhar_details'] == null
          ? null
          : AadharDetails.fromJson(
              json['aadhar_details'] as Map<String, dynamic>),
      panDetails: json['pan_details'] == null
          ? null
          : PanDetails.fromJson(json['pan_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PoaDetailsToJson(PoaDetails instance) =>
    <String, dynamic>{
      'aadhar_details': instance.aadharDetails,
      'pan_details': instance.panDetails,
    };

AadharDetails _$AadharDetailsFromJson(Map<String, dynamic> json) =>
    AadharDetails(
      isAadharVerified: json['is_aadhar_verified'] as bool?,
    );

Map<String, dynamic> _$AadharDetailsToJson(AadharDetails instance) =>
    <String, dynamic>{
      'is_aadhar_verified': instance.isAadharVerified,
    };

PanDetails _$PanDetailsFromJson(Map<String, dynamic> json) => PanDetails(
      isPanVerified: json['is_pan_verified'] as bool?,
    );

Map<String, dynamic> _$PanDetailsToJson(PanDetails instance) =>
    <String, dynamic>{
      'is_pan_verified': instance.isPanVerified,
    };

CreditScoreData _$CreditScoreDataFromJson(Map<String, dynamic> json) =>
    CreditScoreData(
      score: json['score'] as String?,
      score_date: json['score_date'] as String?,
    );

Map<String, dynamic> _$CreditScoreDataToJson(CreditScoreData instance) =>
    <String, dynamic>{
      'score': instance.score,
      'score_date': instance.score_date,
    };

DeviceData _$DeviceDataFromJson(Map<String, dynamic> json) => DeviceData(
      mpin: json['mpin'] as int?,
    );

Map<String, dynamic> _$DeviceDataToJson(DeviceData instance) =>
    <String, dynamic>{
      'mpin': instance.mpin,
    };

Cards _$CardsFromJson(Map<String, dynamic> json) => Cards(
      cardId: json['_id'] as String?,
      cardNumber: json['cardNumber'] as String?,
      status: json['status'] as String?,
      cardActive: json['card_active'] as bool?,
      softApproval: json['softApproval'] as bool?,
      autoSoftApproval: json['autoSoftApproval'] as bool?,
      cardToken: json['cardToken'] as String?,
      limitData: json['limit'] == null
          ? null
          : LimitData.fromJson(json['limit'] as Map<String, dynamic>),
      mandateData: json['mandate'] == null
          ? null
          : MandateData.fromJson(json['mandate'] as Map<String, dynamic>),
      selfieData: json['selfie'] == null
          ? null
          : SelfieData.fromJson(json['selfie'] as Map<String, dynamic>),
      bankDetails: json['bank_details'] == null
          ? null
          : BankDetails.fromJson(json['bank_details'] as Map<String, dynamic>),
      cardActiveChecks: (json['card_active_checks'] as List<dynamic>?)
          ?.map((e) => CardActiveChecks.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeData: json['type'] == null
          ? null
          : TypeData.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardsToJson(Cards instance) => <String, dynamic>{
      '_id': instance.cardId,
      'cardNumber': instance.cardNumber,
      'status': instance.status,
      'card_active': instance.cardActive,
      'softApproval': instance.softApproval,
      'autoSoftApproval': instance.autoSoftApproval,
      'cardToken': instance.cardToken,
      'limit': instance.limitData,
      'mandate': instance.mandateData,
      'selfie': instance.selfieData,
      'bank_details': instance.bankDetails,
      'card_active_checks': instance.cardActiveChecks,
      'type': instance.typeData,
    };

LimitData _$LimitDataFromJson(Map<String, dynamic> json) => LimitData(
      limit: json['limit'] as bool?,
      total: json['total'] as int?,
      utilized: json['utilized'] as int?,
      mediclaim: json['mediclaim'] as bool?,
      mediclaimLimit: json['mediclaimLimit'] as int?,
      mediclaimUtilized: json['mediclaimUtilized'] as int?,
      withdrawal: json['withdrawal'] as bool?,
      withdrawalLimit: json['withdrawalLimit'] as int?,
      withdrawalUtilized: json['withdrawalUtilized'] as int?,
    );

Map<String, dynamic> _$LimitDataToJson(LimitData instance) => <String, dynamic>{
      'limit': instance.limit,
      'total': instance.total,
      'utilized': instance.utilized,
      'mediclaim': instance.mediclaim,
      'mediclaimLimit': instance.mediclaimLimit,
      'mediclaimUtilized': instance.mediclaimUtilized,
      'withdrawal': instance.withdrawal,
      'withdrawalLimit': instance.withdrawalLimit,
      'withdrawalUtilized': instance.withdrawalUtilized,
    };

MandateData _$MandateDataFromJson(Map<String, dynamic> json) => MandateData(
      is_created: json['is_created'] as bool?,
    );

Map<String, dynamic> _$MandateDataToJson(MandateData instance) =>
    <String, dynamic>{
      'is_created': instance.is_created,
    };

SelfieData _$SelfieDataFromJson(Map<String, dynamic> json) => SelfieData(
      link: json['link'] as String?,
      is_uploaded: json['is_uploaded'] as bool?,
      is_verified: json['is_verified'] as bool?,
    );

Map<String, dynamic> _$SelfieDataToJson(SelfieData instance) =>
    <String, dynamic>{
      'link': instance.link,
      'is_uploaded': instance.is_uploaded,
      'is_verified': instance.is_verified,
    };

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
      account_no: json['account_no'] as String?,
      bank_verified: json['bank_verified'] as bool?,
    );

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'account_no': instance.account_no,
      'bank_verified': instance.bank_verified,
    };

CardActiveChecks _$CardActiveChecksFromJson(Map<String, dynamic> json) =>
    CardActiveChecks(
      name: json['name'] as String?,
      sort: json['sort'] as int?,
      required: json['required'] as bool?,
      uploaded: json['uploaded'] as bool?,
      verified: json['verified'] as bool?,
      kyc_check: json['kyc_check'] as bool?,
      description: json['description'] as String?,
      updated_at: json['updated_at'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CardActiveChecksToJson(CardActiveChecks instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sort': instance.sort,
      'required': instance.required,
      'uploaded': instance.uploaded,
      'verified': instance.verified,
      'kyc_check': instance.kyc_check,
      'description': instance.description,
      'updated_at': instance.updated_at,
      'id': instance.id,
    };

TypeData _$TypeDataFromJson(Map<String, dynamic> json) => TypeData(
      id: json['id'] as String?,
      type: json['type'] as int?,
      name: json['name'] as String?,
      card_image: json['card_image'] as String?,
    );

Map<String, dynamic> _$TypeDataToJson(TypeData instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'card_image': instance.card_image,
    };
