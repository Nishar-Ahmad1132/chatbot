import 'package:bot_ai/splash_services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashscreen = SplashServices();

  @override
  void initState() {
    super.initState();
    splashscreen.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/log2.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: const Scaffold(
        body: Center(
          child: Text(
            'Grievance Lodge App',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
