import 'package:flutter/material.dart';
import 'package:shared_prefereces_test/auth/signUp_screen.dart';
import 'package:shared_prefereces_test/global/global_value.dart';
import 'package:shared_prefereces_test/main_screen/home_screen.dart';
import 'package:shared_prefereces_test/practice2/second_auth/second_login.dart';
import 'package:shared_prefereces_test/practice2/second_splash/second_splash.dart';
import 'package:shared_prefereces_test/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main()async {

  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences=await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User DB',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:SecondSplash(),
    );
  }
}

