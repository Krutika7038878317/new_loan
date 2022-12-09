import 'package:customerloan/common/widgets/app_form_field.dart';
import 'package:customerloan/common/widgets/horizontal_spacer.dart';
import 'package:customerloan/common/widgets/input_text_field.dart';
import 'package:customerloan/common/widgets/primary_button.dart';
import 'package:customerloan/common/widgets/text_view.dart';
import 'package:customerloan/common/widgets/vertical_spacer.dart';
import 'package:customerloan/constant/color_constant.dart';
import 'package:customerloan/constant/string_constant.dart';
import 'package:customerloan/presentation/registraion_page/controller/registration_controller.dart';
import 'package:customerloan/util/string_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      init: Get.find<RegistrationController>(),
      builder: (controllerr) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0.0,
          ),
        ),
        body: Stack(
          children: <Widget>[
            Stack(
              children: [
                ValueListenableBuilder<double>(
                    valueListenable: controllerr.headerNegativeOffset,
                    builder: (context, offset, child) {
                      return Transform.translate(
                        offset: Offset(0, offset * -1),
                        child: SizedBox(
                          height: controllerr.maxHeaderHeight,
                          child: Container(
                            color: Colors.red,
                            child: AppBar(
                              flexibleSpace: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        ColorConstant.topBannerColor,
                                        ColorConstant.topBanner1Color
                                      ]),
                                ),
                              ),
                              leading: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                      Icons.arrow_back_ios_new_sharp)),
                              title: const TextView(
                                text: StringConstant.registrationLabel,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConstant.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    if (notification.extent ==
                        controllerr.bodyContentRatioMin) {
                      controllerr.appbarShadow.value = false;
                      controllerr.headerNegativeOffset.value = 0;
                    } else if (notification.extent ==
                        controllerr.bodyContentRatioMax) {
                      controllerr.appbarShadow.value = true;
                      controllerr.headerNegativeOffset.value =
                          controllerr.maxHeaderHeight -
                              controllerr.minHeaderHeight;
                    } else {
                      double newValue = (controllerr.maxHeaderHeight -
                              controllerr.minHeaderHeight) -
                          ((controllerr.maxHeaderHeight -
                                  controllerr.minHeaderHeight) *
                              ((controllerr.bodyContentRatioParallax -
                                      (notification.extent)) /
                                  (controllerr.bodyContentRatioMax -
                                      controllerr.bodyContentRatioParallax)));
                      controllerr.appbarShadow.value = false;
                      if (newValue >=
                          controllerr.maxHeaderHeight -
                              controllerr.minHeaderHeight) {
                        controllerr.appbarShadow.value = true;
                        newValue = controllerr.maxHeaderHeight -
                            controllerr.minHeaderHeight;
                      } else if (newValue < 0) {
                        controllerr.appbarShadow.value = false;
                        newValue = 0;
                      }
                      controllerr.headerNegativeOffset.value = newValue;
                    }

                    return true;
                  },
                  child: Stack(
                    children: <Widget>[
                      DraggableScrollableSheet(
                        initialChildSize: controllerr.bodyContentRatioMin,
                        minChildSize: controllerr.bodyContentRatioMin,
                        maxChildSize: controllerr.bodyContentRatioMax,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return Stack(
                            children: <Widget>[
                              Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 16.0),
                                child: Material(
                                  // type: MaterialType.canvas,
                                  color: Colors.white,
                                  // elevation: 2.0,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(21.0),
                                    child: AppForm(
                                      key: controllerr.registrationFormKey,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          const TextView(
                                            text: StringConstant
                                                .personalDetailsLabel,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const VerticalSpacer(
                                            spacing: 28,
                                          ),
                                          ///pan Text field data
                                          InputTextField(
                                            /* inputFormatters: [
                                              UpperCaseTextFormatter(),
                                            ],*/
                                            textCapitalization:
                                                TextCapitalization.characters,
                                            autofocus: false,
                                            focusNode: FocusNode(),
                                            maxLength: 10,
                                            keyboardType: TextInputType.text,
                                            onChanged: (val) {
                                              if (controllerr
                                                          .panTextEditingController
                                                          .text !=
                                                      val.toUpperCase() &&
                                                  controllerr
                                                          .panTextEditingController
                                                          .text
                                                          .length ==
                                                      10) {
                                                controllerr
                                                        .panTextEditingController
                                                        .value =
                                                    controllerr
                                                        .panTextEditingController
                                                        .value
                                                        .copyWith(
                                                            text: val
                                                                .toUpperCase());
                                                controllerr.varifyPanNumber();
                                              }

                                              /*  if(controllerr.panTextEditingController.text.length==10 ){
                                                controllerr.varifyPanNumber();
                                              }*/
                                            },
                                            validator: (value) {
                                              StringUtil.validatePan(value!);
                                            },
                                            textEditingController: controllerr
                                                .panTextEditingController,
                                            hintText:
                                                StringConstant.panHintLabel,
                                            labelText: StringConstant.panLabel,
                                          ),
                                          const VerticalSpacer(
                                            spacing: 12,
                                          ),
                                          /*  Container(
                                            height: 60,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              border: Border.all(
                                                width: 1,
                                                color: ColorConstant.blueMainColor,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Text(
                                                "Name: ${controllerr.panData.value?.data?.name.toString()}",
                                              ),
                                            ),
                                          ),*/

                                          ///Name DOB and Gender data
                                          Obx(
                                            () => controllerr
                                                        .isNameDobGenderVisible
                                                        .value !=
                                                    false
                                                ? nameDobGenderWidget(
                                                    controllerr)
                                                : Container(),
                                          ),
                                          const TextView(
                                            text: StringConstant.finacialLabel,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Row(
                                            children: [
                                              addFinancialRadioButton(
                                                  0, "Salaried"),
                                              addFinancialRadioButton(
                                                  1, "Self-employed"),
                                            ],
                                          ),
                                          const VerticalSpacer(
                                            spacing: 12,
                                          ),
                                          InputTextField(
                                            keyboardType: TextInputType.number,
                                            textEditingController: controllerr
                                                .monthlySalaryTextEditingController,
                                            hintText:
                                                StringConstant.salaryHintLabel,
                                            labelText:
                                                StringConstant.salaryLabel,
                                          ),
                                          const VerticalSpacer(
                                            spacing: 12,
                                          ),
                                          InputTextField(
                                            keyboardType: TextInputType.number,
                                            textEditingController: controllerr
                                                .requiredAmountTextEditingController,
                                            hintText:
                                                StringConstant.amounthintLabel,
                                            labelText:
                                                StringConstant.amountLabel,
                                          ),
                                          const VerticalSpacer(
                                            spacing: 12,
                                          ),
                                          InputTextField(
                                            keyboardType: TextInputType.number,
                                            textEditingController: controllerr
                                                .pinCodeTextEditingController,
                                            hintText:
                                                StringConstant.pincodeLabel,
                                            maxLength: 6,
                                            labelText:
                                                StringConstant.pincodehintLabel,
                                          ),
                                          const VerticalSpacer(
                                            spacing: 18,
                                          ),
                                          const TextView(
                                              text: StringConstant
                                                  .termcanditionLabel),
                                          const VerticalSpacer(
                                            spacing: 12,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => Checkbox(
                                                  activeColor: ColorConstant
                                                      .blueMainColor,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  value: controllerr
                                                      .iAgreeCheck.value,
                                                  onChanged: (val) {
                                                    controllerr.iAgreeCheck
                                                        .value = val!;
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.0),
                                                    children: <TextSpan>[
                                                      const TextSpan(
                                                          text: StringConstant
                                                              .Iagree1Label),
                                                      TextSpan(
                                                          text: StringConstant
                                                              .Iagree2Label,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  print(
                                                                      'Terms of Service"');
                                                                }),
                                                      const TextSpan(
                                                          text: ' & '),
                                                      TextSpan(
                                                          text: StringConstant
                                                              .Iagree3Label,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  print(
                                                                      'Privacy Policy"');
                                                                }),
                                                      const TextSpan(
                                                          text: StringConstant
                                                              .Iagree4Label),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => Checkbox(
                                                  activeColor: ColorConstant
                                                      .blueMainColor,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  value: controllerr
                                                      .isConsent.value,
                                                  onChanged: (val) {
                                                    controllerr
                                                        .isConsent.value = val!;
                                                    print(controllerr
                                                        .isConsent.value);
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RichText(
                                                  text: const TextSpan(
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.0),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: StringConstant
                                                              .checkBoxCandition2Label),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const VerticalSpacer(
                                            spacing: 50,
                                          ),
                                          _buildButtonField(
                                              context, controllerr),
                                          const VerticalSpacer(
                                            spacing: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
                // Get.toNamed(Routes.registration.name);
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
        ),
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
            labelStyle: const TextStyle(color: ColorConstant.labelColor,fontWeight: FontWeight.w500),
            textEditingController: controllerr.nameTextEditingController,
            hintText: controllerr.panData.value?.data?.name.toString(),
            hintStyle: const TextStyle(color: ColorConstant.hintLabelColor,fontSize: 14,fontWeight: FontWeight.w500),
            labelText: StringConstant.nameLabel,
            onChanged: (value) {
              controllerr.panTextEditingController.text = value;
            },
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
