
import 'package:customerloan/model/new_user_otp_verify_response.dart';
import 'package:customerloan/model/send_otp_request.dart';
import 'package:customerloan/model/send_otp_response.dart';
import 'package:customerloan/model/verify_otp_request.dart';
import 'package:customerloan/model/verify_otp_response.dart';
import 'package:customerloan/provider/login_provider.dart';

class LoginRepository {

  LoginRepository({required this.provider});

  final LoginProvider provider;

  /// check user exist or not
  Future<SendOTPResponse?> checkCustomerExist(SendOTPRequest otp) async {
    return await provider.checkCustomerExist(otp);
  }

  /// new  user Generate OTP
  Future<SendOTPResponse?> newCustomerSendOTP(SendOTPRequest otp) async {
    return await provider.newCustomerSendOTP(otp);
  }


  /// old user Generate OTP
  Future<SendOTPResponse?> oldCustomersendOTP(SendOTPRequest otp) async {
    return await provider.oldCustomersendOTP(otp);
  }


  ///new user verify OTP
  Future<NewUserOTPVerifyResponse?> newCustomerVerifyOTP(VerifyOTPRequest otp) async {
    return await provider.newCustomerVerifyOTP(otp);
  }


  ///old user verify OTP
  Future<VerifyOTPResponse?> oldCustomerVerifyOTP(VerifyOTPRequest otp) async {
    return await provider.oldCustomerVerifyOTP(otp);
  }



}