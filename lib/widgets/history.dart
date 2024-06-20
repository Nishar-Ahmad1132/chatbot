import 'package:flutter/material.dart';

class HistoryStatus extends StatefulWidget {
  const HistoryStatus({super.key});

  @override
  State<HistoryStatus> createState() => _HistoryStatusState();
}

class _HistoryStatusState extends State<HistoryStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent.shade700,
      ),
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            "Currently History Status is Empty!",
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
