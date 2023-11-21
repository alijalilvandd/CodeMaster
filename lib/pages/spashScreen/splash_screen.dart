


import 'package:codemaster/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

    @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context)=> const RegisterPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/back.png"),fit: BoxFit.cover)
        ),
        child:const Center(
          child: Image(image: AssetImage("assets/images/logo.png")),
        ),
      ),
    );
  }
}