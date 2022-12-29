import 'package:demo_digitalin/src/view/screen/home_screen.dart';
import 'package:demo_digitalin/src/view/screen/login.dart';
import 'package:demo_digitalin/src/view/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:demo_digitalin/core/app_theme.dart';
import 'package:demo_digitalin/src/view/screen/intro_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
