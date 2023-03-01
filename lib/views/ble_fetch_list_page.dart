// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import '../controllers/ble_list_controller.dart';
import 'ble_info.dart';

class BlePage extends StatelessWidget {
  BlePage({super.key,});

  final BlePageController controller = Get.put(BlePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(backgroundColor: Colors.purple[200],
        title: const Text("Bluetooth Devices"),
        actions: [IconButton(
            onPressed: () {
              controller.refreshDevices();
            },
            icon: const Icon(
             Icons.refresh
            ),
          ), 
          
          ],
      ),
      body: Column(
        children: [
          
          Expanded(
            child: GetBuilder<BlePageController>(
              builder: (c) => ListView.separated(
                itemCount: controller.result.length,
                itemBuilder: (context, index) {
                  ScanResult results = controller.result[index];
                  final String deviceID = results.device.id.id;
                 
                  return ListTile(
                    onTap: () {
                      Get.to(() => BleInfoPage(result: results));
                    },leading: const CircleAvatar(child: Icon(Icons.bluetooth,color: Colors.white,)),
                    title: Text(
                      results.device.name.isNotEmpty
                          ? results.device.name
                          : results.advertisementData.localName.isNotEmpty
                              ? results.advertisementData.localName
                              : 'Unknown',
                    ),
                    subtitle: Text(deviceID),
                    trailing: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.purple)),
                      child: const Text('C',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
