import 'package:customerloan/constant/string_constant.dart';
import 'package:customerloan/model/pan_request.dart';
import 'package:customerloan/route/routes.dart';
import 'package:customerloan/util/preference_util.dart';
import 'package:customerloan/util/snack_bar_util.dart';
import 'package:customerloan/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../model/customer_dob_request.dart';
import '../../../model/customer_dob_response.dart';
import '../../../model/pan_response.dart';
import '../../../repository/registration_repository.dart';

class RegistrationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RegistrationController({required this.repository});

  ///repository
  final RegistrationRepository repository;

  ///valueNotifer
  final ValueNotifier<double> headerNegativeOffset = ValueNotifier<double>(0);
  final ValueNotifier<bool> appbarShadow = ValueNotifier<bool>(false);

  ///Device height and width
  final double maxHeaderHeight = 170.0;
  final double minHeaderHeight = 100.0;
  final double bodyContentRatioMin = 0.91;
  final double bodyContentRatioMax = 1.0;
  final double bodyContentRatioParallax = .9;

  ///Key
  final GlobalKey<FormState> registrationFormKey =
      GlobalKey<FormState>(debugLabel: "registrationFormKey");

  ///controller
  final panTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  final dobTextEditingController = TextEditingController();
  final monthlySalaryTextEditingController = TextEditingController();
  final requiredAmountTextEditingController = TextEditingController();
  final pinCodeTextEditingController = TextEditingController();

  ///Gender
  String? selectedGender;
  final List<String> gender = ["Male", "Female"];
  RxString? genderData = "".obs;

  ///Finacial details
  String? selectedFinancial;
  final List<String> financial = ["Salaried", "Self-employed"];
  String? selectedDetails;

  ///Checkbox
  RxBool iAgreeCheck = false.obs;
  RxBool isConsent = false.obs;

  ///Date
  DateTime? selectedDate;

  ///Pan Data response
  Rx<PanResponse?> panData = PanResponse().obs;
  RxBool isNameDobGenderVisible = false.obs;

  Rx<CustomerDobResponse?> customerDobData = CustomerDobResponse().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    headerNegativeOffset.dispose();
    appbarShadow.dispose();
    super.dispose();
  }

  ///Finacial value
  void onFinancialRadioButton(value) {
    print(value);
    selectedDetails = value;
    update();
  }

  /// Varifypan data
  Future<void> varifyPanNumber() async {
    if (StringUtil.validatePan(panTextEditingController.text) == false) {
      Utils.showToast(StringConstant.errorPanLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      final preference = PreferenceUtil.getInstance();
      final mobile =
          preference.getValue<String>(PreferenceKey.mobile.name) ?? "";

      final model = PanRequest(
          mobile: "91" + mobile, pan_number: panTextEditingController.text);
      repository.checkPanNumber(model).then((value) async {
        EasyLoading.dismiss();
        panData.value = value!;
        genderData!.value = panData.value!.data!.gender!;
        print(panData.value);
        isNameDobGenderVisible.value = true;
      }).catchError((error) {
        Utils.showToast(error.toString());
        EasyLoading.dismiss();
        Utils.showToast(error.toString());
      });
    }
  }

  /// dob data
  Future<void> customerDobNumber() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    final preference = PreferenceUtil.getInstance();
    final mobile = preference.getValue<String>(PreferenceKey.mobile.name) ?? "";
    final model = CustomerDobRequest(
      mobile: "91" + mobile,
      dob: panData.value?.data?.dob.toString(),
      gender: panData.value?.data?.gender.toString(),
      pincode: int.parse(pinCodeTextEditingController.text),
      loan_amount: int.parse(requiredAmountTextEditingController.text),
      email: "",
      income: int.parse(monthlySalaryTextEditingController.text),
    );
    repository.checkCustomerDob(model).then((value) async {
      EasyLoading.dismiss();
      customerDobData.value = value!;
      final preference = PreferenceUtil.getInstance();
      preference.putValue(
          PreferenceKey.token.name, customerDobData.value!.token.toString());

      Get.offAndToNamed(Routes.creatempin.name);
    }).catchError((error) {
      Utils.showToast(error.toString());
      EasyLoading.dismiss();
      Utils.showToast(error.toString());
    });
  }

  ///Existing Dob
  /// dob data
  Future<void> existingCustomerDobNumber() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    final preference = PreferenceUtil.getInstance();
    final mobile = preference.getValue<String>(PreferenceKey.mobile.name) ?? "";
    final dob = preference.getValue<String>(PreferenceKey.panDob.name) ?? "";
    final gender = preference.getValue<String>(PreferenceKey.panGender.name) ?? "";
    final pinCode = preference.getValue<String>(PreferenceKey.panPincode.name) ?? "";
    final loanAmount = preference.getValue<String>(PreferenceKey.loanAmount.name) ?? "";
    final email = preference.getValue<String>(PreferenceKey.panEmail.name) ?? "";
    final income = preference.getValue<String>(PreferenceKey.monthlyIncome.name) ?? "";

    final model = CustomerDobRequest(
      mobile: "91" + mobile,
      dob: dob,
      gender: gender,
      pincode: int.parse(pinCode),
      loan_amount: int.parse(loanAmount),
      email: email,
      income: int.parse(income),
    );
    repository.checkCustomerDob(model).then((value) async {
      EasyLoading.dismiss();
      customerDobData.value = value!;
      final preference = PreferenceUtil.getInstance();
      preference.putValue(
          PreferenceKey.token.name, customerDobData.value!.token.toString());

      Get.offAndToNamed(Routes.creatempin.name);
    }).catchError((error) {
      Utils.showToast(error.toString());
      EasyLoading.dismiss();
      Utils.showToast(error.toString());
    });
  }
}
