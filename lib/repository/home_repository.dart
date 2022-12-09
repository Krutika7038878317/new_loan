import 'package:customerloan/model/aadhaar_otp_verify_respose.dart';
import 'package:customerloan/model/aadhaar_verify_otp_request.dart';
import 'package:customerloan/model/get_status_response.dart';
import 'package:customerloan/provider/home_provider.dart';

import '../model/aadhaar_otp_generate_response.dart';
import '../model/aadhar_otp_generate_request.dart';

class HomeRepository {

  HomeRepository({required this.provider});

  final HomeProvider provider;


  ///get status api
  Future<GetStatusResponse?> getStatus() async {
    return await provider.getStatus();
  }

  ///get aadhaar otp
  Future<AadhaarOtpGenerateResponse?> aadhaarGenrateOTP(AadhaarOtpGenerateRequest model) async {
    return await provider.aadhaarGenrateOTP(model);
  }
  ///verify aadhaar otp
  Future<AadhaarOtpVerifyResponse?> aadhaarVerifyOTP(AadhaarVerifyOTPRequest model) async {
    return await provider.aadhaarVerifyOTP(model);
  }

}