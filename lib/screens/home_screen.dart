import 'package:flutter/material.dart';
import '../widgets/menu_drawer.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BluetoothDevice> pairedDevices = [];
  bool isScanning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container Dashboard')),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Container Dashboard',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardItem(context, 'Container List', Icons.list,
                      _showContainerList),
                  _buildDashboardItem(
                      context, 'Active Alerts', Icons.warning, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).primaryColor),
              SizedBox(height: 8),
              Text(title,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  void _showContainerList() async {
    setState(() {
      isScanning = true;
    });

    List<ScanResult> scanResults = [];

    try {
      await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));
      FlutterBluePlus.scanResults.listen((results) {
        setState(() {
          scanResults = results;
        });
      });

      await Future.delayed(Duration(seconds: 4));
    } finally {
      await FlutterBluePlus.stopScan();
      setState(() {
        isScanning = false;
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Container List'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: scanResults.length + pairedDevices.length,
              itemBuilder: (context, index) {
                if (index < pairedDevices.length) {
                  return _buildPairedDeviceItem(pairedDevices[index]);
                } else {
                  final scanResult = scanResults[index - pairedDevices.length];
                  return _buildScanResultItem(scanResult);
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildPairedDeviceItem(BluetoothDevice device) {
    return ListTile(
      title: Text(device.name),
      subtitle: Text('Paired'),
      trailing: ElevatedButton(
        child: Text('Unlock'),
        onPressed: () {
          Navigator.pop(context);
          _unlockDevice(device);
        },
      ),
    );
  }

  Widget _buildScanResultItem(ScanResult result) {
    return ListTile(
      title: Text(result.device.name.isNotEmpty
          ? result.device.name
          : 'Unknown Device'),
      subtitle: Text(result.device.id.toString()),
      trailing: ElevatedButton(
        child: Text('Pair'),
        onPressed: () {
          Navigator.pop(context);
          _pairDevice(result.device);
        },
      ),
    );
  }

  void _pairDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      setState(() {
        pairedDevices.add(device);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Paired with ${device.name}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pair with ${device.name}: $e')),
      );
    }
  }

  void _unlockDevice(BluetoothDevice device) async {
    try {
      // Discover services
      List<BluetoothService> services = await device.discoverServices();

      // Find the correct service and characteristic
      // You'll need to replace these UUIDs with the ones specific to your device
      var service =
          services.firstWhere((s) => s.uuid.toString() == 'YOUR_SERVICE_UUID');
      var characteristic = service.characteristics
          .firstWhere((c) => c.uuid.toString() == 'YOUR_CHARACTERISTIC_UUID');

      // Send the unlock command
      // Replace 'UNLOCK_COMMAND' with your actual unlock command
      await characteristic
          .write([0x55, 0x4E, 0x4C, 0x4F, 0x43, 0x4B]); // "UNLOCK" in ASCII

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Unlock command sent successfully to ${device.name}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to unlock ${device.name}: $e')),
      );
    }
  }
}
