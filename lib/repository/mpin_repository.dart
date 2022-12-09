import 'package:customerloan/model/create_mpin_request.dart';
import 'package:customerloan/model/device_info_request.dart';
import 'package:customerloan/model/refresh_token_request.dart';
import 'package:customerloan/model/refresh_token_response.dart';
import 'package:customerloan/model/send_otp_response.dart';
import 'package:customerloan/provider/mpin_provider.dart';

class MpinRepository {

  MpinRepository({required this.provider});

  final MpinProvider provider;

  /// create mpin
  Future<SendOTPResponse?> createMpin(CreateMpinRequest model) async {
    return await provider.createMpin(model);
  }

  /// create mpin
  Future<SendOTPResponse?> deviceInfo(DeviceInfoRequest model) async {
    return await provider.deviceInfo(model);
  }

  /// refresh token
  Future<RefreshTokenResponse?> refreshToken(RefreshTokenRequest model) async {
    return await provider.refreshToken(model);
  }

}