import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:customerloan/common/widgets/horizontal_spacer.dart';
import 'package:customerloan/common/widgets/text_view.dart';
import 'package:customerloan/common/widgets/vertical_spacer.dart';
import 'package:customerloan/constant/asset_path_constant.dart';
import 'package:customerloan/constant/color_constant.dart';
import 'package:customerloan/route/routes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../common/widgets/input_text_field.dart';
import '../../../../common/widgets/primary_button.dart';
import '../../../../common/widgets/progeress_indicator.dart';
import '../../../../constant/string_constant.dart';
import '../../../kyc_screen/selfie_page/selfie_controller.dart';
import '../../../kyc_screen/selfie_page/selfie_screen.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(
          init: Get.find<HomeController>(),
          builder: (controller) => Stack(
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
                      const TextView(
                        text: "Welcome",
                        style: TextStyle(
                          color: ColorConstant.whiteColor,
                          fontSize: 19,
                        ),
                      ),
                      const HorizontalSpacer(
                        spacing: 6,
                      ),
                      Obx(
                        () => TextView(
                          text: controller.name.value,
                          style: const TextStyle(
                            color: ColorConstant.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: ColorConstant.whiteColor,
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              spreadRadius: 2.5,
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 5.75),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(AssetPathConstant.card),
                            ),
                            Positioned(
                              top: 28,
                              left: 87,
                              child: Obx(
                                () => TextView(
                                  text: controller.getStatusResponse.value!
                                          .data!.cards![0].cardNumber ,
                                  style: const TextStyle(
                                      color: ColorConstant.cardNumberColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width / 1.4,
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  height: 25,
                                  AssetPathConstant.visibilityOff,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 52,
                              left: 87,
                              child: Obx(
                                () => TextView(
                                  text: controller.getStatusResponse.value?.data
                                      ?.customer?.identity?.name
                                      .toString(),
                                  style: const TextStyle(
                                      color: ColorConstant.cardNumberColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalSpacer(
                      spacing: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Row(
                        children: [
                          const TextView(
                            text: "Available Limit :",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Obx(
                            () => TextView(
                              text: " ₹ ${controller.avilableLimit.value}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacer(),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: PregressIndicator(
                          totalStep: 100,
                          currentStep: controller.avilableLimit.value ?? 0,
                        ),
                      ),
                    ),
                    const VerticalSpacer(
                      spacing: 20,
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    const VerticalSpacer(
                      spacing: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() => controller.getStatusResponse.value!.data!
                                      .cards![0].softApproval ==
                                  false
                              ? completeKyc(controller, context)
                              : Container()),
                          const VerticalSpacer(
                            spacing: 27,
                          ),
                          Obx(() => controller.getStatusResponse.value!.data!
                                      .cards![0].softApproval ==
                                  true
                              ? CardActivation(controller, context)
                              : Container()),
                          const TextView(
                            text: StringConstant.advanceMediclaimLabel,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.titleBlackColor),
                          ),
                          const VerticalSpacer(
                            spacing: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 44.0,
                                  right: 44.0,
                                  bottom: 24.0,
                                  top: 24.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    AssetPathConstant.advanceMediclaimImage,
                                  ),
                                  const VerticalSpacer(
                                    spacing: 12,
                                  ),
                                  const Center(
                                    child: TextView(
                                      text: StringConstant.uploadLabel,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConstant.blueMainColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const VerticalSpacer(
                                    spacing: 18,
                                  ),
                                  PrimaryButton(
                                      text: "Upload Policy", onPressed: () {})
                                ],
                              ),
                            ),
                          ),
                          const VerticalSpacer(
                            spacing: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextView(
                                text: StringConstant.insuranceOnEmiLabel,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConstant.titleBlackColor),
                              ),
                              Image.asset(
                                AssetPathConstant.emiIcon,
                                height: 25,
                              ),
                            ],
                          ),
                          const VerticalSpacer(
                            spacing: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 44.0,
                                  right: 44.0,
                                  bottom: 10.0,
                                  top: 24.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    AssetPathConstant.insuranceIcon,
                                  ),
                                  const VerticalSpacer(
                                    spacing: 12,
                                  ),
                                  const Center(
                                    child: TextView(
                                      text: StringConstant.buyEmiLabel,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConstant.blueMainColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const VerticalSpacer(
                                    spacing: 18,
                                  ),
                                  PrimaryButton(
                                    text: "Request A Call Back",
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const TextView(
                                      text: "Know More",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConstant.blueMainColor,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const VerticalSpacer(
                            spacing: 31,
                          ),
                          const TextView(
                            text: StringConstant.healthShowLabel,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.titleBlackColor,
                            ),
                          ),
                          const VerticalSpacer(
                            spacing: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextView(
                                        text: "Expert advice from our doctors",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: ColorConstant.blueMainColor,
                                        ),
                                      ),
                                      Image.asset(
                                        AssetPathConstant.youtubeIcon,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                  const VerticalSpacer(
                                    spacing: 14,
                                  ),
                                  CarouselSlider.builder(
                                    itemCount: 15,
                                    itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) =>
                                        ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      child: YoutubePlayer(
                                        controller:
                                            controller.youtubeController,
                                        showVideoProgressIndicator: true,
                                      ),
                                    ),
                                    options: CarouselOptions(
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      autoPlayInterval: const Duration(
                                        seconds: 5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacer(
                      spacing: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget kycWidget(
      {String? iconImage,
      title,
      trailingIcon,
      HomeController? controller,
      void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 22),
          child: Row(
            children: [
              Image.asset(
                iconImage!,
                height: 20,
              ),
              const HorizontalSpacer(
                spacing: 12,
              ),
              TextView(
                text: title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal),
              ),
              const Spacer(),
              Image.asset(
                trailingIcon!,
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget completeKyc(HomeController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextView(
          text: StringConstant.completeKYCLabel,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorConstant.titleBlackColor),
        ),
        const VerticalSpacer(
          spacing: 10,
        ),

        ///Email kyc
        kycExpansionWidget(
          errorIcons:controller.emailverify==true ? AssetPathConstant.checkIcon:AssetPathConstant.errorIcon,
          title: 'Email ID',
          controller: controller,
          initiallyExpanded: true,
          trailing: Obx(
            () => controller.isEmailExpansionClick.value
                ? Image.asset(
                    AssetPathConstant.downArrowIcon,
                    height: 9,
                  )
                : Image.asset(
                    AssetPathConstant.forwardArrowIcon,
                    height: 15,
                  ),
          ),
          onExpansionChanged: (value) {
            controller.showUserAccountsFromMobile();
            controller.isEmailExpansionClick.value = value;
          },
          childrenWidget: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 11.0,
            ),
            child: Obx(
              () => controller.isEmailNo.isFalse
                  ? Column(
                      children: [
                        Row(
                          children: [
                            const TextView(
                              text: "Is your Email ID: ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextView(
                              text: controller.userEmail.value,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal),
                            ),
                          ],
                        ),
                        const VerticalSpacer(
                          spacing: 11,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                text: StringConstant.yesLabel,
                                onPressed: () {},
                              ),
                            ),
                            const HorizontalSpacer(
                              spacing: 10.0,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1.2,
                                        color: ColorConstant.blueMainColor),
                                  ),
                                  onPressed: () {
                                    controller.isEmailNo.value = true;
                                  },
                                  child: const TextView(
                                    text: StringConstant.noLabel,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: ColorConstant.blueMainColor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : Column(
                      children: [
                        const InputTextField(
                          hintText: StringConstant.emailLabel,
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const VerticalSpacer(
                          spacing: 10,
                        ),
                        PrimaryButton(
                            text: "Submit",
                            onPressed: () {
                              controller.isEmailNo.value = false;
                            })
                      ],
                    ),
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 10,
        ),

        /// Aadhaar kyc
        kycExpansionWidget(
          controller: controller,
          trailing: Obx(
            () => controller.isAadharExpansionClick.value
                ? Image.asset(
                    AssetPathConstant.downArrowIcon,
                    height: 9,
                  )
                : Image.asset(
                    AssetPathConstant.forwardArrowIcon,
                    height: 15,
                  ),
          ),
          onExpansionChanged: (value) {
            print("valuevaluevaluevaluevalue");
            print(value);
            controller.isAadharExpansionClick.value = value;
          },
          errorIcons: controller.aadhaarverify==true ? AssetPathConstant.checkIcon: AssetPathConstant.errorIcon,
          title: "Aadhaar",
          childrenWidget: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 11.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InputTextField(
                  textEditingController:
                      controller.aadhaarNumberEditingController,
                  textInputAction: TextInputAction.go,
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 12) {
                      controller.aadhaarNumber.value = value;

                    }
                    else
                      {
                        print("valuevaluevaluevalue");
                        print(value.length);
                        controller.aadhaarNumber.value = value;

                        controller.otpText.value=false;
                      }
                  },
                  hintText: "Aadhaar number",
                ),
                const VerticalSpacer(
                  spacing: 18,
                ),
                Obx(
                  () =>  controller.otpText.value==true && controller.generateAadhaarOtpData.value!.status == true
                      ? InputTextField(
                          textEditingController:
                              controller.aadhaarOtpEditingController,
                          textInputAction: TextInputAction.go,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.length == 6) {
                              controller.aadhaarOtp.value = value;
                            }
                          },
                          hintText: "Aadhaar OTP",
                        )
                      : Container(),
                ),

                Obx(()=>controller.generateAadhaarOtpData.value!.status == true ?resendOTPFiled(controller):Container()),
                Obx(
                  () =>   controller.otpText.value ==true && controller.generateAadhaarOtpData.value!.status == true
                      ? PrimaryButton(
                          enabled: controller.aadhaarOtp.value.length == 6
                              ? true
                              : false,
                          text: "Submit",
                          onPressed: () {
                            controller.aadhaarVerifyOTP();
                          },
                        )
                      : Obx(()=>
                        PrimaryButton(
                            enabled: controller.aadhaarNumber.value.length==12
                                ? true
                                : false,
                            text: "Verify",
                            onPressed: () {
                              controller.aadhaarGenrateOTP();
                              controller.otpText.value=true;
                            },
                          ),
                      ),
                ),
                const VerticalSpacer(
                  spacing: 12,
                ),
                const Center(
                  child: TextView(
                    text: "OR",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueMainColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const VerticalSpacer(
                  spacing: 12,
                ),
                const TextView(
                  text: "Upload aadhaar",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: ColorConstant.blueMainColor),
                ),
                const VerticalSpacer(
                  spacing: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: DottedBorder(
                        strokeWidth: 1,
                        dashPattern: const [8, 10],
                        color: ColorConstant.blueBanner,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Row(
                            children: [
                              Container(
                                decoration: DottedDecoration(
                                  strokeWidth: 1,
                                  dash: const [8, 10],
                                  color: Colors.blue,
                                  shape: Shape.line,
                                  linePosition: LinePosition.right,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: SvgPicture.asset(
                                    AssetPathConstant.uploadIcon,
                                    color: ColorConstant.blueMainColor,
                                    height: 20,
                                  ),
                                ),
                              ),
                              const HorizontalSpacer(
                                spacing: 15,
                              ),
                              const Expanded(
                                child: TextView(
                                  text: "Upload Aadhaar Front",
                                  style: TextStyle(
                                      color: ColorConstant.blueMainColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const HorizontalSpacer(
                      spacing: 10.0,
                    ),
                    Expanded(
                      child: DottedBorder(
                        strokeWidth: 1,
                        dashPattern: const [8, 10],
                        color: ColorConstant.blueBanner,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Row(
                            children: [
                              Container(
                                decoration: DottedDecoration(
                                  strokeWidth: 1,
                                  dash: const [8, 10],
                                  color: Colors.blue,
                                  shape: Shape.line,
                                  linePosition: LinePosition.right,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: SvgPicture.asset(
                                    AssetPathConstant.uploadIcon,
                                    color: ColorConstant.blueMainColor,
                                    height: 20,
                                  ),
                                ),
                              ),
                              const HorizontalSpacer(
                                spacing: 15,
                              ),
                              const Expanded(
                                child: TextView(
                                  text: "Upload Aadhaar Back",
                                  style: TextStyle(
                                      color: ColorConstant.blueMainColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpacer(),
                const TextView(
                  text: "Maximum file size 5 MB (png, jpeg, jpg, pdf)",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const VerticalSpacer(
                  spacing: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorConstant.blueMainColor,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AssetPathConstant.aadharDataIcon,
                                  height: 80,
                                ),
                                const HorizontalSpacer(),
                                SvgPicture.asset(
                                  AssetPathConstant.closeIcon,
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const VerticalSpacer(),
                        const TextView(
                          text: "Aadharfront.jpg",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.blueMainColor),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorConstant.blueMainColor,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AssetPathConstant.aadharDataIcon,
                                  height: 80,
                                ),
                                const HorizontalSpacer(),
                                SvgPicture.asset(
                                  AssetPathConstant.closeIcon,
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const VerticalSpacer(),
                        const TextView(
                          text: "Aadharback.jpg",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.blueMainColor),
                        ),
                      ],
                    ),
                  ],
                ),
                const VerticalSpacer(
                  spacing: 24,
                ),
                const InputTextField(
                  hintText: "Aadhaar Address",
                ),
                const VerticalSpacer(
                  spacing: 24.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        activeColor: ColorConstant.blueMainColor,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: controller.isAuthorize.value,
                        onChanged: (val) {
                          controller.isAuthorize.value = val!;
                        },
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 12.0),
                          children: <TextSpan>[
                            TextSpan(text: StringConstant.iAuthorizedLabel),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpacer(
                  spacing: 24.0,
                ),
                PrimaryButton(text: "Submit", onPressed: () {}),
                const VerticalSpacer(
                  spacing: 24.0,
                ),
              ],
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 10,
        ),

        /// current Address
        kycExpansionWidget(
          controller: controller,
          errorIcons: controller.addressverify==true ? AssetPathConstant.checkIcon: AssetPathConstant.errorIcon,
          title: "Current Address",
          trailing: Obx(
            () => controller.isCurrentExpansionClick.value
                ? Image.asset(
                    AssetPathConstant.downArrowIcon,
                    height: 9,
                  )
                : Image.asset(
                    AssetPathConstant.forwardArrowIcon,
                    height: 15,
                  ),
          ),
          onExpansionChanged: (value) {
            controller.isCurrentExpansionClick.value = value;
          },
          initiallyExpanded: true,
          childrenWidget: Padding(
            padding: const EdgeInsets.only(top: 13, right: 17, left: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TextView(
                  text: "My Current Address is same as Aadhar",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: ColorConstant.blueMainColor),
                ),
                const VerticalSpacer(
                  spacing: 12,
                ),
                Row(
                  children: [
                    addAddressRadioButton(0, "Yes"),
                    const HorizontalSpacer(
                      spacing: 56,
                    ),
                    addAddressRadioButton(1, "No"),
                  ],
                ),
                const VerticalSpacer(
                  spacing: 18,
                ),
                const InputTextField(
                  hintText: "Current Address",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VerticalSpacer(
                  spacing: 18,
                ),
                DottedBorder(
                  strokeWidth: 1,
                  dashPattern: const [8, 10],
                  color: ColorConstant.blueBanner,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  child: Container(
                    color: Colors.blue.shade50,
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          decoration: DottedDecoration(
                              strokeWidth: 1,
                              dash: const [8, 10],
                              color: Colors.blue,
                              shape: Shape.line,
                              linePosition: LinePosition.right,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: SvgPicture.asset(
                              AssetPathConstant.uploadIcon,
                              color: ColorConstant.blueMainColor,
                              height: 20,
                            ),
                          ),
                        ),
                        const HorizontalSpacer(
                          spacing: 15,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                TextView(
                                  text: "Upload current address proof",
                                  style: TextStyle(
                                      color: ColorConstant.blueMainColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                VerticalSpacer(),
                                TextView(
                                  text:
                                      "Maximum file size 5 MB (png, jpeg, jpg, pdf)",
                                  style: TextStyle(
                                      color: ColorConstant.blueMainColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstant.blueMainColor,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AssetPathConstant.aadharDataIcon,
                              height: 80,
                            ),
                            const HorizontalSpacer(),
                            SvgPicture.asset(
                              AssetPathConstant.closeIcon,
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalSpacer(),
                    const TextView(
                      text: "addressproof.jpg",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.blueMainColor),
                    )
                  ],
                ),
                const VerticalSpacer(
                  spacing: 24,
                ),
                PrimaryButton(text: "Submit", onPressed: () {}),
                const VerticalSpacer(
                  spacing: 24,
                ),
              ],
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 10,
        ),


        /// Bank Statment
        kycExpansionWidget(
          controller: controller,
          errorIcons: controller.banksatetmentverify==true ? AssetPathConstant.checkIcon: AssetPathConstant.errorIcon,
          title: "Bank Statement",
          trailing: Obx(
            () => controller.isBankStatementExpansionClick.value
                ? Image.asset(
                    AssetPathConstant.downArrowIcon,
                    height: 9,
                  )
                : Image.asset(
                    AssetPathConstant.forwardArrowIcon,
                    height: 15,
                  ),
          ),
          onExpansionChanged: (value) {
            controller.isBankStatementExpansionClick.value = value;
          },
          initiallyExpanded: true,
          childrenWidget: Padding(
            padding: const EdgeInsets.only(
                top: 18.0, left: 16.0, right: 16.0, bottom: 18.0),
            child: Column(
              children: [
                PrimaryButton(
                    text: "Verify Online Statement", onPressed: () {}),
                const VerticalSpacer(
                  spacing: 12,
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      side: const BorderSide(
                          width: 1.5, color: ColorConstant.blueMainColor),
                    ),
                    onPressed: () {},
                    child: const TextView(
                      text: "Upload Bank Statement",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: ColorConstant.blueMainColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 10,
        ),

        /// selfie upload
        GetBuilder<SelfieController>(
          init: Get.find<SelfieController>(),
          builder: (selfirController) => kycExpansionWidget(
            controller: controller,
            errorIcons: controller.selfieverify==true ? AssetPathConstant.checkIcon: AssetPathConstant.errorIcon,
            title: "Selfie",
            trailing: Obx(
              () => controller.isSelfieExpansionClick.value
                  ? Image.asset(
                      AssetPathConstant.downArrowIcon,
                      height: 9,
                    )
                  : Image.asset(
                      AssetPathConstant.forwardArrowIcon,
                      height: 15,
                    ),
            ),
            initiallyExpanded: true,
            onExpansionChanged: (value) {
              controller.isSelfieExpansionClick.value = value;
            },
            childrenWidget: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 18.0),
              child: Column(
                children: [
                  Obx(
                    () => selfirController.isSelfieClick.isFalse
                        ? PrimaryButton(
                            text: "Click Your Selfie",
                            onPressed: () {
                              Get.toNamed(Routes.selfiePage.name);
                            },
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const TextView(
                                text: "11:16, 29 Apr 2022",
                                style: TextStyle(fontSize: 10),
                              ),
                              const VerticalSpacer(
                                spacing: 14,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  File(
                                      selfirController.selectedImagePath.value),
                                  width: 110.0,
                                  height: 110.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.selfiePage.name);
                                  },
                                  child: const TextView(
                                    text: 'Retake Selfie',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstant.blueMainColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: ColorConstant.blueMainColor),
                                  ),
                                  onPressed: () {},
                                  child: const TextView(
                                    text: "Upload Selfie",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: ColorConstant.blueMainColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const VerticalSpacer(
          spacing: 10,
        ),

        ///Vkyc
        kycExpansionWidget(
          controller: controller,
          errorIcons: controller.vkycverify==true ? AssetPathConstant.checkIcon: AssetPathConstant.errorIcon,
          title: "V-KYC",
          trailing: Obx(
            () => controller.isVKycExpansionClick.value
                ? Image.asset(
                    AssetPathConstant.downArrowIcon,
                    height: 9,
                  )
                : Image.asset(
                    AssetPathConstant.forwardArrowIcon,
                    height: 15,
                  ),
          ),
          initiallyExpanded: true,
          onExpansionChanged: (value) {
            controller.isVKycExpansionClick.value = value;
          },
          childrenWidget: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 18.0),
            child: Column(
              children: [PrimaryButton(text: "Submit V-KYC", onPressed: () {})],
            ),
          ),
        ),

        const VerticalSpacer(
          spacing: 10,
        ),

        /// Bank Details
        kycExpansionWidget(
          controller: controller,
          errorIcons: controller.bankdetailverify==true ? AssetPathConstant.checkIcon: AssetPathConstant.errorIcon,
          title: "Bank Details",
          trailing: Obx(
            () => controller.isBankDetailsExpansionClick.value
                ? Image.asset(
                    AssetPathConstant.downArrowIcon,
                    height: 9,
                  )
                : Image.asset(
                    AssetPathConstant.forwardArrowIcon,
                    height: 15,
                  ),
          ),
          initiallyExpanded: true,
          onExpansionChanged: (value) {
            controller.isBankDetailsExpansionClick.value = value;
          },
          childrenWidget: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextView(
                  text:
                      "Let us know in which Bank Account you will like to recieve funds",
                  style: TextStyle(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    AssetPathConstant.helpIcon,
                    height: 20,
                  ),
                ),
                const VerticalSpacer(),
                const InputTextField(
                  labelText: "Enter your Bank Account number",
                ),
                const VerticalSpacer(),
                const InputTextField(
                  labelText: "Enter your IFSC Code",
                ),
                const VerticalSpacer(
                  spacing: 14,
                ),
                const TextView(
                  text: "Select Account Type",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.blueMainColor),
                ),
                const VerticalSpacer(
                  spacing: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addAccountTypeRadioButton(0, "Savings"),
                      addAccountTypeRadioButton(1, "Current"),
                    ],
                  ),
                ),
                const VerticalSpacer(
                  spacing: 24,
                ),
                const TextView(
                  text: "Select Payment Mode",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.blueMainColor),
                ),
                const VerticalSpacer(
                  spacing: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addPaymentTypeRadioButton(0, "Debit Card"),
                      addPaymentTypeRadioButton(1, "Net Banking"),
                    ],
                  ),
                ),
                const VerticalSpacer(
                  spacing: 23,
                ),
                PrimaryButton(text: "Send me ₹1", onPressed: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget resendOTPFiled(HomeController controller) {
    return GetX<HomeController>(
      builder: (controller) => controller.otpText.value
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
                    controller.aadhaarGenrateOTP();
                    controller.otpText.value=true;
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

  Widget CardActivation(HomeController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextView(
          text: StringConstant.cardActivationLabel,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorConstant.titleBlackColor),
        ),
        const VerticalSpacer(
          spacing: 10,
        ),
        kycExpansionWidget(
          controller: controller,
          errorIcons: AssetPathConstant.errorIcon,
          title: "E-Nach",
          trailing: Obx(
            () => controller.isENachExpansionClick.value
                ? Image.asset(
                    AssetPathConstant.downArrowIcon,
                    height: 9,
                  )
                : Image.asset(
                    AssetPathConstant.forwardArrowIcon,
                    height: 15,
                  ),
          ),
          initiallyExpanded: true,
          onExpansionChanged: (value) {
            controller.isENachExpansionClick.value = value;
          },
          childrenWidget: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 18.0),
            child: Column(
              children: [PrimaryButton(text: "eNach", onPressed: () {})],
            ),
          ),
        ),
        const VerticalSpacer(
          spacing: 32,
        ),

/*
        kycExpansionWidget(
          controller: controller,
          errorIcons: AssetPathConstant.errorIcon,
          title: "E-Sign",
          trailing: Obx(
                () => controller.isESignExpansionClick.value
                ? Image.asset(
              AssetPathConstant.downArrowIcon,
              height: 9,
            )
                : Image.asset(
              AssetPathConstant.forwardArrowIcon,
              height: 15,
            ),
          ),
          initiallyExpanded: true,
          onExpansionChanged: (value) {
            controller.isESignExpansionClick.value = value;
          },
          childrenWidget: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 18.0),
            child: Column(
              children: [
                PrimaryButton(
                    text: "Sign Agreement", onPressed: () {})
              ],
            ),
          ),
        ),

        const VerticalSpacer(
          spacing: 23,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: const BorderRadius.all(
                  Radius.circular(20))),
          margin: const EdgeInsets.all(10.0),
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image.asset(
                  AssetPathConstant.bellIcon,
                  height: 50,
                ),
                const HorizontalSpacer(
                  spacing: 24.0,
                ),
                const Expanded(
                  child: TextView(
                    text: StringConstant.banner1Label,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
*/
      ],
    );
  }

  Widget cardActivationWidget(
      {String? iconImage,
      title,
      trailingIcon,
      HomeController? controller,
      void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 22),
          child: Row(
            children: [
              Image.asset(
                iconImage!,
                height: 20,
              ),
              const HorizontalSpacer(
                spacing: 12,
              ),
              TextView(
                text: title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal),
              ),
              const Spacer(),
              Image.asset(
                trailingIcon!,
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget kycExpansionWidget(
      {HomeController? controller,
      String? errorIcons,
      title,
      Widget? childrenWidget,
      Widget? trailing,
      bool? initiallyExpanded,
      void Function(bool)? onExpansionChanged}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          trailing: trailing,
          onExpansionChanged: onExpansionChanged,
          iconColor: ColorConstant.blueMainColor,
          collapsedIconColor: ColorConstant.blueMainColor,
          initiallyExpanded: initiallyExpanded = false,
          title: Row(
            children: [
              Image.asset(
                errorIcons!,
                height: 20,
              ),
              const HorizontalSpacer(
                spacing: 13,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: ColorConstant.blueMainColor,
                ),
              ),
            ],
          ),
          children: [childrenWidget!],
        ),
      ),
    );
  }

  /// Address Radio button
  Widget addAddressRadioButton(int btnIndex, String title) {
    return Row(
      children: <Widget>[
        GetBuilder<HomeController>(
          builder: (controller) => Radio(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: controller.address[btnIndex],
            groupValue: controller.selectedAddress,
            onChanged: (value) {
              controller.onAddressRadioButton(value);
            },
          ),
        ),
        const HorizontalSpacer(),
        TextView(
          text: title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorConstant.blueMainColor),
        ),
      ],
    );
  }

  /// Account Type Radio button
  Widget addAccountTypeRadioButton(int btnIndex, String title) {
    return Row(
      children: <Widget>[
        GetBuilder<HomeController>(
          builder: (controller) => Radio(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: controller.accountType[btnIndex],
            groupValue: controller.selectedAccountType,
            onChanged: (value) {
              controller.onAccountTypeRadioButton(value);
            },
          ),
        ),
        const HorizontalSpacer(),
        TextView(
          text: title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorConstant.blueMainColor),
        ),
      ],
    );
  }

  /// Payment Mode Type Radio button
  Widget addPaymentTypeRadioButton(int btnIndex, String title) {
    return Row(
      children: <Widget>[
        GetBuilder<HomeController>(
          builder: (controller) => Radio(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: controller.paymentMode[btnIndex],
            groupValue: controller.selectedPaymentMode,
            onChanged: (value) {
              controller.onPaymentMoedRadioButton(value);
            },
          ),
        ),
        const HorizontalSpacer(),
        TextView(
          text: title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorConstant.blueMainColor),
        ),
      ],
    );
  }
}
