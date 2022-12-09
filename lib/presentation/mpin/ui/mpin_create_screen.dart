import 'dart:math';

import 'package:customerloan/common/widgets/primary_button.dart';
import 'package:customerloan/common/widgets/vertical_spacer.dart';
import 'package:customerloan/constant/asset_path_constant.dart';
import 'package:customerloan/constant/color_constant.dart';
import 'package:customerloan/constant/string_constant.dart';
import 'package:customerloan/presentation/mpin/controller/mpin_controller.dart';
import 'package:customerloan/util/snack_bar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class CreateMpinScreen extends StatelessWidget {
  const CreateMpinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MpinController>(
        init: Get.find<MpinController>(),
        builder: (controller) => (
            Scaffold(
              backgroundColor: ColorConstant.appBackgroundColor,
              body: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: const BoxDecoration(
                        color: ColorConstant.lightGrey,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorConstant.blueDark,
                            ColorConstant.blueLightGradient
                          ],
                        )),
                  ),

                  ListView(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 9,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          AssetPathConstant.logoIcons,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 12, right: 12),
                        child: Card(
                          color: ColorConstant.appBarWhite,
                          elevation: 4,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildOTPField(context, controller),
                                _buildReOTPField(context, controller),
                                _buildCheckboxField(context, controller),
                                _buildButtonField(context, controller),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), //Positioned
                ],
              ),
            )
        )
    );
  }

  Widget _buildOTPField(BuildContext context, MpinController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8, left: 8),
          child: Text(
            StringConstant.CreateLabel,
            style: TextStyle(
                color: ColorConstant.black,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 8),
          child: Text(
            StringConstant.setMpinLabel,
            style: TextStyle(
              color: ColorConstant.blueDarkLogin,
              fontSize: 16,
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 8),
          child: Text(
            StringConstant.enterMpinLabel,
            style: TextStyle(
              color: ColorConstant.blueDarkLogin,
              fontSize: 16,
            ),
          ),
        ),
        OTPTextField(
            // controller: otpController,
            length: 4,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 60,
            fieldStyle: FieldStyle.underline,
            style: const TextStyle(fontSize: 17),
            onChanged: (pin) {
              controller.mpin.value = pin;
              if (pin.length == 4) {
                if (controller.rempin.value.length == 4) {
                  controller.isButtonEnable.value = true;
                } else {
                  controller.isButtonEnable.value = false;
                }
              } else {
                controller.isButtonEnable.value = false;
              }
            },
            onCompleted: (pin) {
              controller.mpin.value = pin;
              if (pin.length == 4) {
                if (controller.rempin.value.length == 4) {
                  controller.isButtonEnable.value = true;
                } else {
                  controller.isButtonEnable.value = false;
                }
              } else {
                controller.isButtonEnable.value = false;
              }
            }),
        const VerticalSpacer(
          spacing: 15,
        ),
      ],
    );
  }

  Widget _buildReOTPField(BuildContext context, MpinController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 8),
          child: Text(
            StringConstant.reenterMpinLabel,
            style: TextStyle(
              color: ColorConstant.blueDarkLogin,
              fontSize: 16,
            ),
          ),
        ),
        OTPTextField(
            // controller: otpController,
            length: 4,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 60,
            fieldStyle: FieldStyle.underline,
            style: const TextStyle(fontSize: 17),
            onChanged: (pin) {
              controller.rempin.value = pin;
              if (pin.length == 4) {
                if (controller.mpin.value.length == 4) {
                  controller.isButtonEnable.value = true;
                } else {
                  controller.isButtonEnable.value = false;
                }
              } else {
                controller.isButtonEnable.value = false;
              }
            },
            onCompleted: (pin) {
              controller.rempin.value = pin;
              if (pin.length == 4) {
                if (controller.mpin.value.length == 4) {
                  controller.isButtonEnable.value = true;
                } else {
                  controller.isButtonEnable.value = false;
                }
              } else {
                controller.isButtonEnable.value = false;
              }
            }),
        const VerticalSpacer(
          spacing: 15,
        ),
      ],
    );
  }

  Widget _buildCheckboxField(BuildContext context, MpinController controller) {
    return Obx(
      () => Row(
        children: [
          Checkbox(
              value: controller.checkBoxChange.value,
              activeColor: ColorConstant.textColor,
              onChanged: (newValue) {
                controller.checkBoxChange.value = newValue!;
              }),
          const Text(
            StringConstant.checkBoxLabel,
            style: TextStyle(
              color: ColorConstant.greysubtitle,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonField(BuildContext context, MpinController controller) {
    return GetX<MpinController>(
        builder: (controller) => (Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryButton(
                    text: StringConstant.createbtnLabel,
                    enabled: controller.isButtonEnable.value,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (controller.mpin.value == controller.rempin.value) {
                        controller.createMpin();
                      } else {
                        Utils.showToast(StringConstant.mpinErrorLabel);
                      }
                    },
                  ),
                ],
              ),
            )));
  }
}
