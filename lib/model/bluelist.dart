import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
enum _DeviceAvailability {
  maybe,
  yes,
}

class DeviceWithAvailability extends BluetoothDevice {
  
  BluetoothDevice? device;
  _DeviceAvailability? availability;
  int? rssi;

  DeviceWithAvailability(this.device, this.availability)
      : super(address: device!.address);
}