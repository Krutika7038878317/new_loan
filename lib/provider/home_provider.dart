import 'package:customerloan/api/api_path.dart';
import 'package:customerloan/api/rest_client.dart';
import 'package:customerloan/model/aadhaar_otp_verify_respose.dart';
import 'package:customerloan/model/aadhaar_verify_otp_request.dart';
import 'package:customerloan/model/get_status_response.dart';
import 'package:customerloan/util/log.dart';

import '../model/aadhaar_otp_generate_response.dart';
import '../model/aadhar_otp_generate_request.dart';
import '../util/preference_util.dart';

class HomeProvider extends RestClient {
  ///get status data
  Future<GetStatusResponse?> getStatus() async {
    final response = await get(
      APIPath.getstatus,
      //  decoder: (dynamic json) => GetStatusResponse.fromJson(json)
    );
    Log.d(' getCountry response: ${response.bodyString}');
    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return GetStatusResponse.fromJson(json);
    }
    return null;
  }

  ///aadhaarGenrateOTP
  Future<AadhaarOtpGenerateResponse?> aadhaarGenrateOTP(
      AadhaarOtpGenerateRequest model) async {
    final requestBody = model.toJson();
    final response = await post(
      APIPath.aadhaarGenerateOTP,
      requestBody,
        decoder: (dynamic json) => AadhaarOtpGenerateResponse.fromJson(json));

    return response.body;


    // final json = response.body as Map<String, dynamic>;
    // if (response.statusCode == 200) {
    //   return AadhaarOtpGenerateResponse.fromJson(json);
    // }
    // return null;
  }

  ///aadhaar verify OTP
  Future<AadhaarOtpVerifyResponse?> aadhaarVerifyOTP(AadhaarVerifyOTPRequest model) async {
    final requestBody = model.toJson();
    final preference = PreferenceUtil.getInstance();
    final cardId = preference.getValue<String>(PreferenceKey.cardId.name) ?? "";

    final response = await post(
      APIPath.aadhaarVerifyOTP+cardId,
      requestBody,
        decoder: (dynamic json) => AadhaarOtpVerifyResponse.fromJson(json));

    return response.body;


  }
}
