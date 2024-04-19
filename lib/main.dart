import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'SignupScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyATc8LSB1AYA9xF-4JmDgcYY4SR1Fvfj_Q",
          appId: "1:405353168397:android:8f06a8feef3b1790311f44",
          messagingSenderId: "405353168397",
          projectId: "fir-flutter-85710"));
  runApp(MyApp());
}
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
