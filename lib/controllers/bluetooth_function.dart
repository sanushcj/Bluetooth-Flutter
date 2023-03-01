import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';


class Communicate extends GetxController {


  String? result;
  late String result1;
  late String result2;

  communicate() async{
    
    BluetoothConnection connection = await BluetoothConnection.toAddress("E4:5F:01:31:77:71");

    print('Connected to the device');
    connection.output.add(ascii.encode("start\r\n"));
    connection.input?.listen((Uint8List data){
     
        result = ascii.decode(data);
        if (result![0] == '0'){
          result1 = 'Negative';
        }else{
          result1 = 'Positive';
        }

        if (result![1] == '0'){
          result2 = 'Negative';
        }else{
          result2 = 'Positive';
        }    });
    
  }}