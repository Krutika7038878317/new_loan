import 'package:customerloan/api/api_path.dart';
import 'package:customerloan/api/rest_client.dart';
import 'package:customerloan/model/new_user_otp_verify_response.dart';
import 'package:customerloan/model/send_otp_request.dart';
import 'package:customerloan/model/send_otp_response.dart';
import 'package:customerloan/model/verify_otp_request.dart';
import 'package:customerloan/model/verify_otp_response.dart';

class LoginProvider extends RestClient {


  /// check user exist or not
  Future<SendOTPResponse?> checkCustomerExist(SendOTPRequest otp) async {
    final requestBody = otp.toJson();
    final response = await post(
      APIPath.checkCustomerExistUrl,
      requestBody,
    );

    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return SendOTPResponse.fromJson(json);
    }
    return null;
  }

  /// new user send otp

  Future<SendOTPResponse?> newCustomerSendOTP(SendOTPRequest otp) async {
    final requestBody = otp.toJson();
    final response = await post(
      APIPath.sendOTPNewCustomerUrl,
      requestBody,
    );

    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return SendOTPResponse.fromJson(json);
    }
    return null;
  }

  /// old user send otp

  Future<SendOTPResponse?> oldCustomersendOTP(SendOTPRequest otp) async {
    final requestBody = otp.toJson();
    final response = await post(
      APIPath.sendOTPOldCustomerUrl,
      requestBody,
    );

    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return SendOTPResponse.fromJson(json);
    }
    return null;
  }


  /// new  user verify otp

  Future<NewUserOTPVerifyResponse?> newCustomerVerifyOTP(VerifyOTPRequest otp) async {
    final requestBody = otp.toJson();
    final response = await post(
      APIPath.verifOTPNewCustomerUrl,
      requestBody,
    );

    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return NewUserOTPVerifyResponse.fromJson(json);
    }
    return null;
  }

  /// old  user verify otp

  Future<VerifyOTPResponse?> oldCustomerVerifyOTP(VerifyOTPRequest otp) async {
    final requestBody = otp.toJson();
    final response = await post(
      APIPath.verifOTPOldCustomerUrl,
      requestBody,
    );

    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
       return VerifyOTPResponse.fromJson(json);
    }
     return null;
  }

}
