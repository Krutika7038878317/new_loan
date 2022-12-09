import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/horizontal_spacer.dart';
import '../../../common/widgets/input_text_field.dart';
import '../../../common/widgets/primary_button.dart';
import '../../../common/widgets/text_view.dart';
import '../../../common/widgets/vertical_spacer.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../util/preference_util.dart';
import '../../../util/string_util.dart';
import '../../login/controller/login_controller.dart';
import '../controller/registration_controller.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preference = PreferenceUtil.getInstance();

    return GetBuilder<RegistrationController>(
      init: Get.find<RegistrationController>(),
      builder: (controllerr) => Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    spreadRadius: 2.5,
                    color: Colors.black54,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 5.75),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    ColorConstant.topBannerColor,
                    ColorConstant.topBanner1Color
                  ],
                ),
              ),
              height: 200.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                    const TextView(
                      text: StringConstant.registrationLabel,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.whiteColor),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 160.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.25,
                width: double.infinity,
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      spreadRadius: 2.5,
                      color: Colors.black54,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 5.75),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: GetBuilder<LoginController>(
                  builder: (loginController) =>
                      loginController.isCustomerExist.isFalse
                          ? newUserRegistration(controllerr, context)
                          : existingUserRegistration(
                              controllerr, loginController, context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget existingUserRegistration(RegistrationController controllerr,
      LoginController loginController, BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const VerticalSpacer(
                spacing: 18,
              ),
              const TextView(
                text: StringConstant.personalDetailsLabel,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const VerticalSpacer(
                spacing: 21,
              ),

              ///pan Text field data
              InputTextField(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                readOnly: true,
                labelStyle: const TextStyle(
                    color: ColorConstant.labelColor,
                    fontWeight: FontWeight.w500),
                textEditingController: controllerr.nameTextEditingController,
                hintText: loginController.newUserVerifyOtpResponseData.value
                    ?.customerHspData?.panDetails?.panNumber
                    .toString(),
                hintStyle: const TextStyle(
                    color: ColorConstant.hintLabelColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                labelText: StringConstant.panLabel,
              ),
              const VerticalSpacer(
                spacing: 12,
              ),

              ///Name DOB and Gender data
              Column(
                children: [
                  Obx(
                    () => InputTextField(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      readOnly: true,
                      labelStyle: const TextStyle(
                          color: ColorConstant.labelColor,
                          fontWeight: FontWeight.w500),
                      textEditingController:
                          controllerr.nameTextEditingController,
                      hintText: loginController.newUserVerifyOtpResponseData
                          .value?.customerHspData?.panDetails?.panName
                          .toString(),
                      hintStyle: const TextStyle(
                          color: ColorConstant.hintLabelColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      labelText: StringConstant.nameLabel,
                    ),
                  ),
                  const VerticalSpacer(
                    spacing: 12,
                  ),
                  Obx(
                    () => InputTextField(
                      readOnly: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      textEditingController:
                          controllerr.dobTextEditingController,
                      hintText: loginController.newUserVerifyOtpResponseData
                          .value?.customerHspData?.panDetails?.panData?.dob
                          .toString(),
                      hintStyle: const TextStyle(
                          color: ColorConstant.hintLabelColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      labelText: StringConstant.dobLabel,
                      labelStyle: const TextStyle(
                          color: ColorConstant.labelColor,
                          fontWeight: FontWeight.w500),
                      suffixIcon: const Icon(
                        Icons.calendar_month,
                        color: ColorConstant.blueMainColor,
                      ),
                    ),
                  ),
                  const VerticalSpacer(
                    spacing: 12,
                  ),
                  Row(
                    children: [
                      const TextView(
                        text: StringConstant.genderLabel,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const HorizontalSpacer(
                        spacing: 15,
                      ),
                      addExistingGenderRadioButton(
                          btnIndex: 0,
                          title: "Male",
                          groupValue: loginController
                                      .newUserVerifyOtpResponseData
                                      .value
                                      ?.customerHspData
                                      ?.panDetails
                                      ?.panData
                                      ?.gender ==
                                  "male"
                              ? controllerr.gender[0]
                              : ""),
                      addExistingGenderRadioButton(
                          btnIndex: 1,
                          title: "Female",
                          groupValue: loginController
                                      .newUserVerifyOtpResponseData
                                      .value
                                      ?.customerHspData
                                      ?.panDetails
                                      ?.panData
                                      ?.gender ==
                                  "female"
                              ? controllerr.gender[1]
                              : ""),
                    ],
                  ),
                ],
              ),

              const TextView(
                text: StringConstant.finacialLabel,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  addExistingFinancialRadioButton(
                      btnIndex: 0,
                      title: "Salaried",
                      groupValue: loginController
                                  .newUserVerifyOtpResponseData
                                  .value
                                  ?.customerHspData
                                  ?.employmentDetails
                                  ?.employmentType ==
                              "salaried"
                          ? controllerr.financial[0]
                          : ""),
                  addExistingFinancialRadioButton(
                      btnIndex: 1,
                      title: "Self-employed",
                      groupValue: loginController
                                  .newUserVerifyOtpResponseData
                                  .value
                                  ?.customerHspData
                                  ?.employmentDetails
                                  ?.employmentType ==
                              "self-employed"
                          ? controllerr.financial[1]
                          : ""),
                ],
              ),
              const VerticalSpacer(
                spacing: 12,
              ),
              InputTextField(
                readOnly: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                textEditingController: controllerr.dobTextEditingController,
                hintText: loginController.newUserVerifyOtpResponseData.value
                    ?.customerHspData?.employmentDetails?.income
                    .toString(),
                hintStyle: const TextStyle(
                    color: ColorConstant.hintLabelColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                labelText: StringConstant.salaryLabel,
                labelStyle: const TextStyle(
                    color: ColorConstant.labelColor,
                    fontWeight: FontWeight.w500),
              ),
              const VerticalSpacer(
                spacing: 12,
              ),
              InputTextField(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                readOnly: true,
                labelStyle: const TextStyle(
                    color: ColorConstant.labelColor,
                    fontWeight: FontWeight.w500),
                textEditingController: controllerr.nameTextEditingController,
                hintText: loginController.newUserVerifyOtpResponseData.value
                    ?.customerHspData?.loanAmount
                    .toString(),
                hintStyle: const TextStyle(
                    color: ColorConstant.hintLabelColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                labelText: StringConstant.amountLabel,
              ),

              const VerticalSpacer(
                spacing: 12,
              ),
              InputTextField(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                readOnly: true,
                labelStyle: const TextStyle(
                    color: ColorConstant.labelColor,
                    fontWeight: FontWeight.w500),
                textEditingController: controllerr.nameTextEditingController,
                hintText: loginController.newUserVerifyOtpResponseData.value
                    ?.customerHspData?.pincode
                    .toString(),
                hintStyle: const TextStyle(
                    color: ColorConstant.hintLabelColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                labelText: StringConstant.pincodehintLabel,
              ),

              const VerticalSpacer(
                spacing: 18,
              ),
              const TextView(text: StringConstant.termcanditionLabel),
              const VerticalSpacer(
                spacing: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: ColorConstant.blueMainColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: controllerr.iAgreeCheck.value,
                      onChanged: (val) {
                        controllerr.iAgreeCheck.value = val!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black, fontSize: 12.0),
                        children: <TextSpan>[
                          const TextSpan(text: StringConstant.Iagree1Label),
                          TextSpan(
                              text: StringConstant.Iagree2Label,
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms of Service"');
                                }),
                          const TextSpan(text: ' & '),
                          TextSpan(
                              text: StringConstant.Iagree3Label,
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Privacy Policy"');
                                }),
                          const TextSpan(text: StringConstant.Iagree4Label),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(
                spacing: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: ColorConstant.blueMainColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: controllerr.isConsent.value,
                      onChanged: (val) {
                        controllerr.isConsent.value = val!;
                        print(controllerr.isConsent.value);
                      },
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: StringConstant.checkBoxCandition2Label),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(
                spacing: 50,
              ),
              _buildExitingButtonField(context, controllerr),
              const VerticalSpacer(
                spacing: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget newUserRegistration(
      RegistrationController controllerr, BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const VerticalSpacer(
                spacing: 18,
              ),
              const TextView(
                text: StringConstant.personalDetailsLabel,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const VerticalSpacer(
                spacing: 21,
              ),

              ///pan Text field data
              InputTextField(
                /* inputFormatters: [
                                                    UpperCaseTextFormatter(),
                                                  ],*/
                textCapitalization: TextCapitalization.characters,
                autofocus: false,
                focusNode: FocusNode(),
                maxLength: 10,
                keyboardType: TextInputType.text,
                onChanged: (val) {
                  if (controllerr.panTextEditingController.text !=
                          val.toUpperCase() &&
                      controllerr.panTextEditingController.text.length == 10) {
                    controllerr.panTextEditingController.value = controllerr
                        .panTextEditingController.value
                        .copyWith(text: val.toUpperCase());
                    controllerr.varifyPanNumber();
                  }

                  /*  if(controllerr.panTextEditingController.text.length==10 ){
                                                      controllerr.varifyPanNumber();
                                                    }*/
                },
                validator: (value) {
                  StringUtil.validatePan(value!);
                },
                textEditingController: controllerr.panTextEditingController,
                hintText: StringConstant.panHintLabel,
                labelText: StringConstant.panLabel,
              ),
              const VerticalSpacer(
                spacing: 12,
              ),

              ///Name DOB and Gender data
              Obx(
                () => controllerr.isNameDobGenderVisible.value != false
                    ? nameDobGenderWidget(controllerr)
                    : Container(),
              ),
              const TextView(
                text: StringConstant.finacialLabel,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  addFinancialRadioButton(0, "Salaried"),
                  addFinancialRadioButton(1, "Self-employed"),
                ],
              ),
              const VerticalSpacer(
                spacing: 12,
              ),
              InputTextField(
                keyboardType: TextInputType.number,
                textEditingController:
                    controllerr.monthlySalaryTextEditingController,
                hintText: StringConstant.salaryHintLabel,
                labelText: StringConstant.salaryLabel,
              ),
              const VerticalSpacer(
                spacing: 12,
              ),
              InputTextField(
                keyboardType: TextInputType.number,
                textEditingController:
                    controllerr.requiredAmountTextEditingController,
                hintText: StringConstant.amounthintLabel,
                labelText: StringConstant.amountLabel,
              ),
              const VerticalSpacer(
                spacing: 12,
              ),
              InputTextField(
                keyboardType: TextInputType.number,
                textEditingController: controllerr.pinCodeTextEditingController,
                hintText: StringConstant.pincodeLabel,
                maxLength: 6,
                labelText: StringConstant.pincodehintLabel,
              ),
              const VerticalSpacer(
                spacing: 18,
              ),
              const TextView(text: StringConstant.termcanditionLabel),
              const VerticalSpacer(
                spacing: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: ColorConstant.blueMainColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: controllerr.iAgreeCheck.value,
                      onChanged: (val) {
                        controllerr.iAgreeCheck.value = val!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black, fontSize: 12.0),
                        children: <TextSpan>[
                          const TextSpan(text: StringConstant.Iagree1Label),
                          TextSpan(
                              text: StringConstant.Iagree2Label,
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms of Service"');
                                }),
                          const TextSpan(text: ' & '),
                          TextSpan(
                              text: StringConstant.Iagree3Label,
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Privacy Policy"');
                                }),
                          const TextSpan(text: StringConstant.Iagree4Label),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(
                spacing: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: ColorConstant.blueMainColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: controllerr.isConsent.value,
                      onChanged: (val) {
                        controllerr.isConsent.value = val!;
                        print(controllerr.isConsent.value);
                      },
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: StringConstant.checkBoxCandition2Label),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(
                spacing: 50,
              ),
              _buildButtonField(context, controllerr),
              const VerticalSpacer(
                spacing: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// submit button
  Widget _buildButtonField(
      BuildContext context, RegistrationController controller) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => PrimaryButton(
              text: StringConstant.submitLabel,
              enabled: controller.isConsent.value != false &&
                  controller.iAgreeCheck.value != false &&
                  controller.panTextEditingController.text.isNotEmpty &&
                  controller
                      .monthlySalaryTextEditingController.text.isNotEmpty &&
                  controller
                      .requiredAmountTextEditingController.text.isNotEmpty &&
                  controller.pinCodeTextEditingController.text.isNotEmpty &&
                  controller.selectedFinancial != "",
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.customerDobNumber();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExitingButtonField(
      BuildContext context, RegistrationController controller) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => PrimaryButton(
              text: StringConstant.submitLabel,
              enabled: controller.isConsent.value != false &&
                  controller.iAgreeCheck.value != false,
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.existingCustomerDobNumber();
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Gender Radio button
  Widget addGenderRadioButton(int btnIndex, String title) {
    return Row(
      children: <Widget>[
        GetBuilder<RegistrationController>(
          builder: (registrationController) => Obx(
            () => Radio(
              value: registrationController.gender[btnIndex],
              groupValue: registrationController.genderData?.value == "male"
                  ? registrationController.gender[0]
                  : registrationController.genderData?.value == "female"
                      ? registrationController.gender[1]
                      : "",
              onChanged: (value) {},
            ),
          ),
        ),
        TextView(
          text: title,
        ),
      ],
    );
  }

  /// Gender Radio button
  Widget addExistingGenderRadioButton(
      {int? btnIndex, String? title, groupValue}) {
    return Row(
      children: <Widget>[
        GetBuilder<RegistrationController>(
          builder: (registrationController) => Radio(
            value: registrationController.gender[btnIndex!],
            groupValue: groupValue,
            onChanged: (value) {},
          ),
        ),
        TextView(
          text: title,
        ),
      ],
    );
  }

  ///Financial Radio button
  Widget addExistingFinancialRadioButton(
      {int? btnIndex, String? title, groupValue}) {
    return Row(
      children: <Widget>[
        GetBuilder<RegistrationController>(
          builder: (registrationController) => Radio(
            value: registrationController.financial[btnIndex!],
            groupValue: groupValue,
            onChanged: (value) {},
          ),
        ),
        TextView(
          text: title,
        )
      ],
    );
  }

  ///Financial Radio button
  Widget addFinancialRadioButton(int btnIndex, String title) {
    return Row(
      children: <Widget>[
        GetBuilder<RegistrationController>(
          builder: (registrationController) => Radio(
            value: registrationController.financial[btnIndex],
            groupValue: registrationController.selectedDetails,
            onChanged: (value) {
              registrationController.onFinancialRadioButton(value);
            },
          ),
        ),
        TextView(
          text: title,
        )
      ],
    );
  }

  Widget nameDobGenderWidget(RegistrationController controllerr) {
    return Column(
      children: [
        Obx(
          () => InputTextField(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            readOnly: true,
            labelStyle: const TextStyle(
                color: ColorConstant.labelColor, fontWeight: FontWeight.w500),
            textEditingController: controllerr.nameTextEditingController,
            hintText: controllerr.panData.value?.data?.name.toString(),
            hintStyle: const TextStyle(
                color: ColorConstant.hintLabelColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            labelText: StringConstant.nameLabel,
          ),
        ),
        const VerticalSpacer(
          spacing: 12,
        ),
        Obx(
          () => InputTextField(
            readOnly: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            textEditingController: controllerr.dobTextEditingController,
            hintText: controllerr.panData.value?.data?.dob.toString(),
            hintStyle: const TextStyle(
                color: ColorConstant.hintLabelColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            labelText: StringConstant.dobLabel,
            labelStyle: const TextStyle(
                color: ColorConstant.labelColor, fontWeight: FontWeight.w500),
            suffixIcon: const Icon(
              Icons.calendar_month,
              color: ColorConstant.blueMainColor,
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 12,
        ),
        Row(
          children: [
            const TextView(
              text: StringConstant.genderLabel,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const HorizontalSpacer(
              spacing: 15,
            ),
            addGenderRadioButton(0, "Male"),
            addGenderRadioButton(1, "Female"),
          ],
        ),
      ],
    );
  }
}
