import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/splash/splash.dart';

Future<void> main(List<String> args)async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    );
  }
}