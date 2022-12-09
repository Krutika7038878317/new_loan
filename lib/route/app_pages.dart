import 'package:customerloan/presentation/information/ui/slider_screen.dart';
import 'package:customerloan/presentation/login/binding/login_binding.dart';
import 'package:customerloan/presentation/login/ui/login_screen.dart';
import 'package:customerloan/presentation/mpin/binding/mpin_binding.dart';
import 'package:customerloan/presentation/mpin/ui/mpin_create_screen.dart';
import 'package:customerloan/presentation/mpin/ui/mpin_verify_screen.dart';
import 'package:customerloan/presentation/qrscanner/binding/qr_binding.dart';
import 'package:customerloan/presentation/qrscanner/ui/webview_screen.dart';
import 'package:customerloan/presentation/registraion_page/binding/registrationBinding.dart';
import 'package:customerloan/presentation/registraion_page/ui/registration_page.dart';
import 'package:customerloan/presentation/splash/binding/splash_screen_binding.dart';
import 'package:customerloan/presentation/splash/ui/splash_screen.dart';
import 'package:customerloan/route/routes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../presentation/bottombar_page/bottombar_screen/binding/bottombar_page_binding.dart';
import '../presentation/bottombar_page/bottombar_screen/ui/bottombar_page_ui.dart';
import '../presentation/bottombar_page/contact_us_page/binding/contact_us_page_binding.dart';
import '../presentation/bottombar_page/contact_us_page/ui/contact_us_page.dart';
import '../presentation/bottombar_page/home/binding/home_binding.dart';
import '../presentation/bottombar_page/home/ui/home_screen.dart';
import '../presentation/bottombar_page/my_bills_page/binding/my_bills_page_binding.dart';
import '../presentation/bottombar_page/my_bills_page/ui/my_bills_page.dart';
import '../presentation/bottombar_page/pay_page/binding/pay_page_binding.dart';
import '../presentation/bottombar_page/pay_page/ui/pay_page.dart';
import '../presentation/bottombar_page/profile_page/binding/profile_page_binding.dart';
import '../presentation/bottombar_page/profile_page/ui/profile_page.dart';
import '../presentation/kyc_screen/selfie_page/selfie_binding.dart';
import '../presentation/kyc_screen/selfie_page/selfie_screen.dart';
import '../presentation/qrscanner/ui/qr_scan_screen.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage<MaterialPageRoute>(
      name: Routes.launch.name,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.login.name,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.slider.name,
      page: () => const SliderScreen(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.qrscaner.name,
      page: () => const QrScanner(),
      binding: QrBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.webview.name,
      page: () => const WebviewScreen(),
      binding: QrBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.registration.name,
      page: () =>  RegistrationPage(),
      bindings: [RegistrationBinding(),LoginBinding()]
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.creatempin.name,
      page: () => const CreateMpinScreen(),
      binding: MpinBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.verifympin.name,
      page: () => const MpinVerifyScreen(),
      binding: MpinBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.homeScreen.name,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.bottomBar.name,
      page: () => const BottomBarPage(),
      bindings: [
        BottomBarPageBinding(),
        HomeBinding(),
        ProfilePageBinding(),
        PayPageBinding(),
        MyBillsPageBinding(),
        ContactUsPageBinding(),
        SelfieBinding(),
      ],
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.profilePage.name,
      page: () => const ProfilePage(),
      binding: ProfilePageBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.payPage.name,
      page: () => const PayPage(),
      binding: PayPageBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.myBillsPage.name,
      page: () => const MyBillsPage(),
      binding: MyBillsPageBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.callUsPage.name,
      page: () => const ContactUsPage(),
      binding: ContactUsPageBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.selfiePage.name,
      page: () => const SelfieScreen(),
      binding: SelfieBinding(),
    ),
  ];
}
