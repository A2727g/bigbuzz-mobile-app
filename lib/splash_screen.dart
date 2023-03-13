import 'package:flutter/material.dart';
import 'dart:async';
import 'cards_screen_model.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  String finalEmail = '';
  @override
  void initState() {
    super.initState();
    getValidationData();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString("token");
    finalEmail = obtainedEmail ?? "";
    print("finalPhone : $finalEmail");
    Future.delayed(
        const Duration(milliseconds: 500),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (c) =>
                    finalEmail.isEmpty ? LoginPage() : CardScreenPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        "assets/image/BigBuzz_splash_screen.jpg",
        width: 600,
        height: 300,
      )),
    );
  }
}
