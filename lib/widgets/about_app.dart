
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text("About App"),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal:30,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Here you can lodge your grievance for any department ",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(height: 15),
              Text(
                "Here you can lodge your grievance for any department ",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(height: 15),
              Text(
                "Here you can lodge your grievance for any department ",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
