// import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
class BlePageController extends GetxController {

  bool connection = false;

  // final HomePageController c = Get.find();
  // ignore: non_constant_identifier_names
  var Connectstatus = Permission.bluetoothConnect.status;
  @override
  void onInit() {
    super.onInit();
    initBle();
  }

  void initBle() {

  }


}
