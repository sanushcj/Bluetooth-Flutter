import 'package:bluetooth_task/controller/splash/splashscreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
SplashController controller = Get.put(SplashController());
   controller. gotoHome();
    // gotoHome();
  final  double heightof = MediaQuery.of(context).size.height;
   final double widthof = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          height: heightof,
          width: widthof,
          child: const Center(
            child: Text(
              'Hello Bluetooth ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }

  }
