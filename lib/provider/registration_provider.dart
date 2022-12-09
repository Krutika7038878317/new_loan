import 'package:customerloan/api/api_path.dart';
import 'package:customerloan/api/rest_client.dart';
import 'package:customerloan/model/pan_request.dart';
import 'package:customerloan/model/pan_response.dart';

import '../model/customer_dob_request.dart';
import '../model/customer_dob_response.dart';

class RegistrationProvider extends RestClient {
  /// check pan Data
  Future<PanResponse?> varifyPanData(PanRequest pan) async {
    final requestBody = pan.toJson();
    final response = await post(
      APIPath.panCustomerUrl,
      requestBody,
    );
    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return PanResponse.fromJson(json);
    }
    return null;
  }

  /// customer Dob Data
  Future<CustomerDobResponse?> customerDobData(CustomerDobRequest dob) async {
    final requestBody = dob.toJson();
    final response = await post(
      APIPath.customerDobUrl,
      requestBody,
    );
    final json = response.body as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return CustomerDobResponse.fromJson(json);
    }
    return null;
  }
}
