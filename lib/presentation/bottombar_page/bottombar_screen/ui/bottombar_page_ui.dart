import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:customerloan/constant/asset_path_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/color_constant.dart';
import '../controller/bottombar_page_controller.dart';

class BottomBarPage extends StatelessWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BottomBarPageController>(
      builder: (controller) => Scaffold(
        key: controller.globalKey,
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: controller.pages,
        ),
        bottomNavigationBar: DefaultTabController(
          length: controller.pages.length,
          child: ConvexAppBar(
            onTap: (val) {
              controller.changeIndex(val);
            },
            backgroundColor: ColorConstant.whiteColor,
            style: TabStyle.fixed,
            disableDefaultTabController: false,
            activeColor: ColorConstant.blueMainColor,
            color: ColorConstant.loginColor,
            cornerRadius: 10,
            items: [
              const TabItem(icon: Icons.home_rounded, title: 'Home'),
              const TabItem(
                  icon: Icons.account_circle_outlined, title: 'Profile'),
              TabItem(
                icon: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            AssetPathConstant.payIcon,
                          ),
                          fit: BoxFit.cover)),
                ),
                title: 'Pay',
              ),
              const TabItem(icon: Icons.my_library_books, title: 'My Bills'),
              const TabItem(icon: Icons.call, title: 'Call Us'),
            ],
          ),
        ),
      ),
    );
  }
}
