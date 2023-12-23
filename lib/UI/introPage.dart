import 'package:flutter/material.dart';
import 'package:phones_app/main.dart';

class introPage extends StatelessWidget {
  const introPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(151, 117, 250, 1),
      body: Center(
        child: InkWell(
            onTap: () {
              controller.nextPage(
                  duration: Duration(seconds: 2), curve: Curves.easeOut);
            },
            child: Image.asset('Logo.png')),
      ),
    );
  }
}
