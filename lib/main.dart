import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/otp/ui/otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      // home: TodoPage(),
      // home: const SignUpPage(),
      // home: LoginPage(),
      // home: HomePage(),
      home: OTPScreen(email: "Jay@gmai.com"),
    );
  }
}
