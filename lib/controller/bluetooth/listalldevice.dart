import 'dart:developer';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothDeviceController extends GetxController {
  @override
  void onInit() {
    blutoothInit();
    scanDevice();
    super.onInit();
  }

  FlutterBluePlus blueInstance = FlutterBluePlus.instance;

  List<ScanResult> scanResultList = [];
   RxBool _isScanning = false.obs;
  RxBool deviceConnected = false.obs;


  void blutoothInit() {
    blueInstance.isScanning.listen((isScanning) {
      _isScanning.value = isScanning;
    });
  }

  scanDevice() async {
    blueInstance.scan();
    // ignore: unrelated_type_equality_checks
    if (_isScanning.value) {
      scanResultList.clear();
      await blueInstance.startScan(timeout: const Duration(seconds: 5));
      blueInstance.scanResults.listen((results) {
        scanResultList = results;
        log('printing results within the function');
        log(scanResultList[0].device.id.toString());
      });
    } else {
      blueInstance.stopScan();
    }
  }

  connectdevice(BluetoothDevice device)async{
   await device.connect();
   deviceConnected.value = true;
  }

    disConnectdevice(BluetoothDevice device)async{
   await device.disconnect();
   deviceConnected.value = false;
  }

qrCodeScanner()async {
  
}


}
