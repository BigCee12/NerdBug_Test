import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:charles_ejikeme/auth/sign_in/google_sign_in_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:FlutterSplashScreen.gif(
          backgroundColor: Colors.white,
          gifPath: 'assets/lottie_files/charles_ejikeme.gif',
          gifWidth: 800,
          gifHeight: 900,
          nextScreen: const SignIn(),
          duration: const Duration(milliseconds: 3515),
        ) ,
      ),
    );
  }
}