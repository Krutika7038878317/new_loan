import 'package:flutter/material.dart';

import '../../../../common/widgets/text_view.dart';

class MyBillsPage extends StatelessWidget {
  const MyBillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextView(
          text: "This is My Bills Page",
        ),
      ),
    );
  }
}
