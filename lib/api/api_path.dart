class APIPath {


  static const String devBaseUrl = 'https://dev-card.gmoney.loans';
  static const String prodBaseUrl = 'https://dev-card.gmoney.loans';



  static const String checkCustomerExistUrl = '/api/card/customer/checkmobile';


  static const String sendOTPNewCustomerUrl = '/api/card/customer/sendotp';
  static const String sendOTPOldCustomerUrl = '/auth/customer/sendOtp';

  static const String verifOTPNewCustomerUrl = '/api/card/customer/verifyotp';
  static const String verifOTPOldCustomerUrl = '/auth/customer/verifyOtp';
  static const String panCustomerUrl = '/api/card/customer/verifypan';
  static const String customerDobUrl = '/api/card/customer/dob';

  static const String createMpin = '/customer/mpin/update';
  static const String deviceInfo = '/customer/device/update';
  static const String refreshToken = '/auth/customer/refreshToken';
  static const String getstatus = '/customer/status/fetch';
  static const String aadhaarGenerateOTP = '/customer/aadhaar/generateOtp';
  static const String aadhaarVerifyOTP = '/customer/aadhaar/verify/';


}