import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final TextEditingController _textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grievance Report"),
        backgroundColor: Colors.greenAccent,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome To bot_ai",
            style: TextStyle(fontSize: 35, color: Colors.grey.shade800),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              hintText: "Type or Speak your grievance",
              contentPadding: EdgeInsets.all(10),
            ),
          )
        ],
      ),
    );
  }
}