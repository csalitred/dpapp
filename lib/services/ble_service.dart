import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BLEService {
  Future<bool> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.location,
    ].request();

    return statuses[Permission.bluetooth]!.isGranted &&
        statuses[Permission.location]!.isGranted;
  }

  Future<List<ScanResult>> scanForDevices() async {
    if (!(await requestPermissions())) {
      throw Exception('BLE permissions not granted');
    }

    if (!await FlutterBluePlus.isAvailable) {
      throw Exception('Bluetooth not available on this device');
    }

    await FlutterBluePlus.turnOn();

    await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

    var results = await FlutterBluePlus.scanResults.first;

    await FlutterBluePlus.stopScan();

    return results;
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
  }

  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await device.disconnect();
  }

  Stream<BluetoothConnectionState> getDeviceStateStream(
      BluetoothDevice device) {
    return device.connectionState;
  }
}
