import 'package:flutter/material.dart';
import 'package:yummy/features/auth/view/login_view.dart';
import 'package:yummy/features/auth/view/profile_view.dart';
import 'package:yummy/features/auth/view/signup_view.dart';
import 'package:yummy/root.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yummy',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RootView()
    );
  }
}




