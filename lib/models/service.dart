import 'package:flutter/material.dart';

class Service {
  Service({
    required this.name,
    required this.icon,
    this.status = false,
  });
  String name;
  IconData icon;
  bool status;

  static List<Service> getHomeService() {
    List<Service> services = [
      Service(name: 'DPLOCK', icon: Icons.lock),
      Service(name: 'BLE', icon: Icons.bluetooth, status: true),
      Service(name: 'Container', icon: Icons.list),
      Service(name: 'Add More', icon: Icons.add_circle),
    ];
    return services;
  }
}
