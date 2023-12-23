import 'package:flutter/material.dart';
import 'package:phones_app/Service/Phones_service.dart';
import 'package:phones_app/UI/ShowDetails.dart';
import 'package:phones_app/UI/addPhonePage.dart';
import 'package:phones_app/UI/homePage.dart';
import 'package:phones_app/UI/introPage.dart';

void main() async {
  // dynamic temp = await PhonesServiceImp().getSinglePhone(1);
  // print(temp);
  runApp(const MyApp());
}

PageController controller = PageController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [introPage(), homePage()],
      ),
    );
  }
}
