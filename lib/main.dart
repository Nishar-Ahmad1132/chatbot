import 'package:bot_ai/splash_services/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDOuo_856Qy7mwD_Bl9tF989r9YXuIy8kg',
      authDomain: 'bot-ai-da4aa.firebaseapp.com',
      databaseURL: 'https://bot-ai-da4aa.firebaseio.com',
      projectId: 'bot-ai-da4aa',
      storageBucket: 'bot-ai-da4aa.appspot.com',
      messagingSenderId: '813281822654',
      appId: '1:813281822654:android:937021db2608df83525bef',
    ),
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
