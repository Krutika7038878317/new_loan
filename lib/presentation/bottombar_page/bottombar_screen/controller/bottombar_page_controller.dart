import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../contact_us_page/ui/contact_us_page.dart';
import '../../home/ui/home_screen.dart';
import '../../my_bills_page/ui/my_bills_page.dart';
import '../../pay_page/ui/pay_page.dart';
import '../../profile_page/ui/profile_page.dart';



class BottomBarPageController extends GetxController {
  final pages = [
    const HomeScreen(),
    const ProfilePage(),
    const PayPage(),
    const MyBillsPage(),
    const ContactUsPage(),
  ];

  final globalKey = GlobalKey<ScaffoldState>();

  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentPage = const HomeScreen();
  RxInt tabIndex = 0.obs;

  void changeIndex(int index){
    tabIndex.value=index;
  }
}
