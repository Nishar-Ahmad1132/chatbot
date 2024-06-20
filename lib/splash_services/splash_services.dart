import 'package:bot_ai/auth/login_screen.dart';
// import 'package:bot_ai/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:bot_ai/auth/login_screen.dart';

class SplashServices {
  void islogin(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );
  }
}
