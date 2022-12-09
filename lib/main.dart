import 'package:customerloan/constant/color_constant.dart';
import 'package:customerloan/route/app_pages.dart';
import 'package:customerloan/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        baseColor: ColorConstant.neuMorphicBaseColor,
        lightSource: LightSource.topLeft,
        depth: 5,
        intensity: 0.9,
      ),
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: GetMaterialApp(
          theme: ThemeData(
            radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith(
                  (states) => ColorConstant.blueMainColor),
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.launch.name,
          getPages: AppPages.pages,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
