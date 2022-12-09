import 'package:flutter/material.dart';

import '../../../../common/widgets/text_view.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextView(
          text: "This is Contact Us Page",
        ),
      ),
    );
  }
}
