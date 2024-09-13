// screens/container_list_screen.dart
import 'package:flutter/material.dart';

class Container {
  final String id;
  final String name;
  final bool isConnected;

  Container({required this.id, required this.name, required this.isConnected});
}

class ContainerListScreen extends StatelessWidget {
  final List<Container> containers = [
    Container(id: '1', name: 'Container 1', isConnected: true),
    Container(id: '2', name: 'Container 2', isConnected: false),
    Container(id: '3', name: 'Container 3', isConnected: true),
    Container(id: '4', name: 'Container 4', isConnected: false),
    Container(id: '5', name: 'Container 5', isConnected: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Containers'),
      ),
      body: ListView.builder(
        itemCount: containers.length,
        itemBuilder: (context, index) {
          final container = containers[index];
          return ListTile(
            leading: Icon(
              container.isConnected
                  ? Icons.bluetooth_connected
                  : Icons.bluetooth_disabled,
              color: container.isConnected ? Colors.blue : Colors.grey,
            ),
            title: Text(container.name),
            subtitle:
                Text(container.isConnected ? 'Connected' : 'Disconnected'),
            onTap: () {
              // Here you would typically handle the container selection
              // For now, we'll just show a snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected ${container.name}')),
              );
            },
          );
        },
      ),
    );
  }
}
