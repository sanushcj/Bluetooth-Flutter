import 'package:get/get.dart';
import '../../view/home/home.dart';

class SplashController extends GetxController {
  gotoHome() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.offAll(() => const HomeScreen());
  }
}
