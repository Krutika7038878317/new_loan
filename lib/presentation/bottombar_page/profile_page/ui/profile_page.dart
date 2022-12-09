import 'package:flutter/material.dart';

import '../../../../common/widgets/text_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextView(
          text: "This is Profile Page",
        ),
      ),
    );
  }
}
