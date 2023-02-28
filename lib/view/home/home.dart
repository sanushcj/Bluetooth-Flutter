import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../bluoffscreen/blutooothoffscreen.dart';
import '../scanscreen/scanScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(title: const Text('Hello Bluetooth'),backgroundColor: Colors.purple[200],),
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
      body: ScanDevicesScreen(),
    );
  }
}

