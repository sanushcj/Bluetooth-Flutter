import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(title: const Text('Hello Bluetooth'),backgroundColor: Colors.purple[200],),
    );
  }
}