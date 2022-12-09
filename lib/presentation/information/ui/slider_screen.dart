import 'package:customerloan/constant/asset_path_constant.dart';
import 'package:customerloan/constant/color_constant.dart';
import 'package:customerloan/route/routes.dart';
import 'package:customerloan/util/preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        // title: "CITY",
        styleTitle: const TextStyle(
            color: ColorConstant.textColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Instant Cash for your medical \nexpenses in No-Cost EMI \n(0% interest )",
        maxLineTextDescription: 3,
        styleDescription: const TextStyle(
            color: ColorConstant.textColor,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway'),
        heightImage: 400,
        widthImage: 300,
        pathImage: AssetPathConstant.info1Icon,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        styleTitle: const TextStyle(
            color: ColorConstant.textColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Advance against your insurance \npolicy for medical expenses ",
        styleDescription: const TextStyle(
            color: ColorConstant.textColor,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway'),
        heightImage: 400,
        widthImage: 300,
        pathImage: AssetPathConstant.info3Icon,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        styleTitle: const TextStyle(
            color: ColorConstant.textColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Emergency Cash",
        styleDescription: const TextStyle(
            color: ColorConstant.textColor,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway'),
        heightImage: 400,
        widthImage: 300,
        pathImage: AssetPathConstant.info2Icon,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
        onCenterItemPress: () {},
      ),
    );
  }

  void onDonePress() {
    print("ppp");
    final preference = PreferenceUtil.getInstance();
    preference.putValue(PreferenceKey.isLoggedIn.name, "true");

    Get.offAndToNamed(Routes.login.name);

  }

  Widget renderNextBtn() {
    return  Text(
      "Next",
      style: TextStyle(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        background: Paint()
          ..color = ColorConstant.textColor
          ..strokeWidth = 20
          ..strokeJoin = StrokeJoin.round
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,


      ),
    );
  }

  Widget renderDoneBtn() {
    return  Text(
      "Login",
      style: TextStyle(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        background: Paint()
          ..color = ColorConstant.textColor
          ..strokeWidth = 20
          ..strokeJoin = StrokeJoin.round
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,


      ),
    );
  }

  Widget renderSkipBtn() {
    return const Text(
      "Skip",
      style: TextStyle(
        fontSize: 16,
        color: ColorConstant.textColor,
      ),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(ColorConstant.whiteColor),
      overlayColor: MaterialStateProperty.all<Color>(ColorConstant.whiteColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: this.slides,
      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),
      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),
      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),
      // Dot indicator
      colorDot: Color(0xFF9C9A9A),
      colorActiveDot: Color(0xFF144791),
      sizeDot: 8.0,
      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.white,
      // Scrollbar
      // verticalScrollbarBehavior: scrollle
    );
  }
}
