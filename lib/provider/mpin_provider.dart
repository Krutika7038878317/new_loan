import 'package:customerloan/api/api_path.dart';
import 'package:customerloan/api/rest_client.dart';
import 'package:customerloan/model/create_mpin_request.dart';
import 'package:customerloan/model/device_info_request.dart';
import 'package:customerloan/model/refresh_token_request.dart';
import 'package:customerloan/model/refresh_token_response.dart';
import 'package:customerloan/model/send_otp_response.dart';

class MpinProvider extends RestClient {

  /// create mpin
  Future<SendOTPResponse?> createMpin(CreateMpinRequest model) async {
    final requestBody = model.toJson();
    final response = await post(
      APIPath.createMpin,
      requestBody,
    );
    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return SendOTPResponse.fromJson(json);
    }
    return null;
  }
  /// device info
  Future<SendOTPResponse?> deviceInfo(DeviceInfoRequest model) async {
    final requestBody = model.toJson();
    final response = await post(
      APIPath.deviceInfo,
      requestBody,
    );
    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return SendOTPResponse.fromJson(json);
    }
    return null;
  }

  /// refresh token
  Future<RefreshTokenResponse?> refreshToken(RefreshTokenRequest model) async {
    final requestBody = model.toJson();
    final response = await post(
      APIPath.refreshToken,
      requestBody,
    );
    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return RefreshTokenResponse.fromJson(json);
    }
    return null;
  }

}
