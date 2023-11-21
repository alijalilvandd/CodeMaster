// ignore_for_file: deprecated_member_use

import 'package:codemaster/pages/ads/show_more_ads.dart';
import 'package:codemaster/pages/home/home_ads.dart';
import 'package:codemaster/pages/home/home_page.dart';
import 'package:codemaster/widgets/my_widgets.dart';
import 'package:codemaster/pages/spashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MasterCode());
}

class MasterCode extends StatelessWidget {
  const MasterCode({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CodeMaster',
        theme: lightTheme(),
        home: const SplashScreen()
      );
  }


}
