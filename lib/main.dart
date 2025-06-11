import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(SignInApp());
}

class SignInApp extends StatelessWidget {
  const SignInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Sign-In Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: SignInScreen(),
    );
  }
}
