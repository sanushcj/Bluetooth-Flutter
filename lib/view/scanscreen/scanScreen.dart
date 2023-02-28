import 'package:bluetooth_task/controller/bluetooth/listalldevice.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class ScanDevicesScreen extends StatelessWidget {
   ScanDevicesScreen({super.key});

BluetoothDeviceController controller = Get.put(BluetoothDeviceController());
  

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}