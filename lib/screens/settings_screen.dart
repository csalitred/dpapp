import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // TODO: Implement notification toggle
              },
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // TODO: Implement dark mode toggle
              },
            ),
          ),
          ListTile(
            title: Text('Account'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to account settings
            },
          ),
          ListTile(
            title: Text('About'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Show about dialog
            },
          ),
        ],
      ),
    );
  }
}
