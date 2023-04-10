import 'package:flutter/material.dart';

import 'features/auth/login/ui/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SignUpPage(),
      home: LoginPage(),
      // home: HomePage(),
    );
  }
}
