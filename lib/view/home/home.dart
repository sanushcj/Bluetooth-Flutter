import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import '../../controller/bluetooth/listalldevice.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  BluetoothDeviceController controller = Get.put(BluetoothDeviceController());



  @override
  Widget build(BuildContext context) {
    // paireddevicesF();
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(Icons.qr_code),onPressed: () => '',),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.scanDevice();
            },
          ),
        ],
        title: const Text('Hello Bluetooth'),
        backgroundColor: Colors.purple[200],
      ),
      // body: StreamBuilder<BluetoothState>(
      //     stream: FlutterBluePlus.instance.state,
      //     initialData: BluetoothState.unknown,
      //     builder: (c, snapshot) {
      //       final state = snapshot.data;
      //       if (state == BluetoothState.off) {
      //         return  ScanDevicesScreen();
      //       }
      //       return BluetoothOffScreen(state: state,);
      //     }),
      body: Column(
        children: [
          controller.scanResultList.isEmpty
              ? const Center(
                  child: Text('No device Found'),
                )
              : SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                            // ignore: unrelated_type_equality_checks
                            onTap: () => controller.deviceConnected == false
                                ? controller.connectdevice(
                                    controller.scanResultList[index].device)
                                : controller.disConnectdevice(
                                    controller.scanResultList[index].device),
                            leading: const Icon(Icons.bluetooth),
                            title: Text(
                                controller.scanResultList[index].device.name),
                            subtitle: Text(controller
                                .scanResultList[index].device.id as String),
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.scanResultList.length),
                ),
        ],
      ),
    );
  }
}
