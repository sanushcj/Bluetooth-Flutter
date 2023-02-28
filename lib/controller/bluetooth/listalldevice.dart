import 'dart:developer';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BluetoothDeviceController extends GetxController {

@override
  void onInit() {
    blutoothInit();
scanDevice();
    super.onInit();
  }

FlutterBluePlus blueInstance = FlutterBluePlus.instance;


List<ScanResult> scanResultList = [];
  final RxBool _isScanning = false.obs;

void blutoothInit() {
    blueInstance.isScanning.listen((isScanning) {
      _isScanning.value = isScanning;
    });
  }

    scanDevice() async {
      
    // ignore: unrelated_type_equality_checks
    if (_isScanning == false) {
      scanResultList.clear();
  await    blueInstance.startScan(timeout: const Duration(seconds: 4));
      blueInstance.scanResults.listen((results) {
        scanResultList = results;
        log('printing results within the function');
        log(scanResultList.toString());
      });
    } else {
      blueInstance.stopScan();
    }
  }
  
}