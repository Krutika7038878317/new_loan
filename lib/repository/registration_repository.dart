import 'package:customerloan/model/pan_request.dart';
import 'package:customerloan/model/pan_response.dart';
import 'package:customerloan/provider/registration_provider.dart';

import '../model/customer_dob_request.dart';
import '../model/customer_dob_response.dart';

class RegistrationRepository {
  RegistrationRepository({required this.provider});

  final RegistrationProvider provider;

  /// varify pan data
  Future<PanResponse?> checkPanNumber(PanRequest pan) async {
    return await provider.varifyPanData(pan);
  }

  /// dob data
  Future<CustomerDobResponse?> checkCustomerDob(CustomerDobRequest dob) async {
    return await provider.customerDobData(dob);
  }
}
