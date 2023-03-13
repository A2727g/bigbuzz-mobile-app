import 'dart:io';

import 'package:bigbuzz/team_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:bigbuzz/cards_screen_model.dart';
import 'package:bigbuzz/question_screen.dart';
import 'package:bigbuzz/videoplay_screen.dart';
// import 'package:salesjinni/cards_screen_model.dart';
import 'intro_data_screen.dart';
import 'splash_screen.dart';
void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Bigbuzz',
      debugShowCheckedModeBanner: false,
         // home: IntroDataScreen(),
         // home: QuestionScreenPage(),
         // home: VideoPlayScreen(),
      home:  SplashScreen(),
    // home: TeamRegistrationPage(),
    // home: CardScreenPage(),
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
