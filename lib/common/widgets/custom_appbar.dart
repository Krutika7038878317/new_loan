import 'package:customerloan/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, this.imagePath, required this.onPressed})
      : super(key: key);

  final String? imagePath;
  final VoidCallback onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstant.appBackgroundColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: SvgPicture.asset(
            imagePath!,
            color: ColorConstant.iconsButtonColor,
            height: 18,
            width: 10.5,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
