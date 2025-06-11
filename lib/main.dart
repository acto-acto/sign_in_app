import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Sign-In Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: SignInScreen(),
    );
  }
}
