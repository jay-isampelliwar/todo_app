import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/features/home/ui/home.dart';

import 'features/auth/signup/ui/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("data_box");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final hiveBox = Hive.box("data_box");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: hiveBox.get("Email") != null && hiveBox.get("Password") != null
            ? const HomePage()
            : const SignUpPage());
  }
}
