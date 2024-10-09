import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BLEService {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

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

    if (!await flutterBlue.isAvailable) {
      throw Exception('Bluetooth not available on this device');
    }

    await flutterBlue.turnOn();

    List<ScanResult> results = [];

    flutterBlue.scanResults.listen((scanResults) {
      results = scanResults;
    });

    await flutterBlue.startScan(timeout: Duration(seconds: 4));
    await Future.delayed(Duration(seconds: 4));
    await flutterBlue.stopScan();

    return results;
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
  }

  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await device.disconnect();
  }

  Stream<BluetoothDeviceState> getDeviceStateStream(BluetoothDevice device) {
    return device.state;
  }
}
