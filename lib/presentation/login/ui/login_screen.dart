import 'package:customerloan/common/widgets/app_form_field.dart';
import 'package:customerloan/common/widgets/input_text_field.dart';
import 'package:customerloan/common/widgets/primary_button.dart';
import 'package:customerloan/common/widgets/text_view.dart';
import 'package:customerloan/common/widgets/vertical_spacer.dart';
import 'package:customerloan/constant/asset_path_constant.dart';
import 'package:customerloan/constant/color_constant.dart';
import 'package:customerloan/constant/string_constant.dart';
import 'package:customerloan/presentation/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: Get.find<LoginController>(),
        builder: (controllerr) => (
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
                                left: 24, right: 24, top: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildMobileNumberField(controllerr),
                                _buildOTPField(context, controllerr),
                                _resendOTPFiled(controllerr),
                                _buildButtonField(context, controllerr),
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

  Widget _buildMobileNumberField(LoginController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8, left: 8),
          child: Text(
            StringConstant.loginLabel,
            style: TextStyle(
              color: ColorConstant.blueDarkLogin,
              fontSize: 24,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4, left: 8),
          child: Text(
            StringConstant.loginHintLabel,
            style: TextStyle(
              color: ColorConstant.blueDarkLogin,
              fontSize: 16,
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 15,
        ),
        InputTextField(
          labelText: StringConstant.mobileLabel,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,

          textEditingController: controller.mobileNumberTextEditingController,
          onChanged: (val) {
            controller.mobile.value=val;
            print(val);
            if (controller.mobileNumberTextEditingController.text.length == 10) {
              controller.checkCustomerExist();
              if(controller.otpPin.value.length==4)
                {
                  controller.isButtonEnable.value = true;

                }
            }
            else
              {
                controller.isButtonEnable.value = false;

              }
          },
        )
      ],
    );
  }

  Widget _buildOTPField(BuildContext context, LoginController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8, left: 8),
          child: Text(
            StringConstant.otpHintLabel,
            style: TextStyle(
              color: ColorConstant.blueDarkLogin,
              fontSize: 16,
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 15,
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
              print("Changed: " + pin);
              controller.otpPin.value = pin;
              if (pin.length == 4) {
                if(controller.mobile.value.length == 10)
                  {
                    controller.isButtonEnable.value = true;
                  }
                else
                  {
                    controller.isButtonEnable.value = false;

                  }
              } else {
                controller.isButtonEnable.value = false;
              }
            },
            onCompleted: (pin) {
              print("Completed: " + pin);
              controller.otpPin.value = pin;
              if (pin.length == 4 ) {
                if(controller.mobile.value.length == 10)
                {
                  controller.isButtonEnable.value = true;
                }
                else
                {
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

  Widget _buildButtonField(BuildContext context, LoginController controller) {
    return GetX<LoginController>(
        builder: (controller) => (Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryButton(
                    text: StringConstant.loginLabel,
                    enabled: controller.isButtonEnable.value,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (controller.isCustomerExist.value == false) {
                        controller.newCustomerVerifyOTP();
                      } else {
                        controller.oldCustomerVerifyOTP();
                      }
                    },
                  ),
                ],
              ),
            )));
  }

  Widget _resendOTPFiled(LoginController controller) {
    return GetX<LoginController>(
      builder: (controller) => controller.isOTPFieldVisible.value
          ? controller.counter.value != 0
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      const VerticalSpacer(
                        spacing: 10,
                      ),
                      Center(
                        child: TextView(
                          text:
                              "Resend OTP( ${controller.counter.toString()} sec )",
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorConstant.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    if (controller.isCustomerExist.value == false) {
                      controller.newCustomerSendOTP();
                    } else {
                      controller.oldCustomerSendOTP();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: const [
                        VerticalSpacer(
                          spacing: 10,
                        ),
                        Center(
                          child: TextView(
                            text: "Resend OTP ?",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorConstant.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
          : Container(),
    );
  }
}
