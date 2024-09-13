// screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _biometricAuthEnabled = false;
  String _selectedLanguage = 'English';
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notifications'),
            subtitle: Text('Enable or disable app notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Biometric Authentication'),
            subtitle: Text('Use fingerprint or face ID to unlock the app'),
            trailing: Switch(
              value: _biometricAuthEnabled,
              onChanged: (bool value) {
                setState(() {
                  _biometricAuthEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Language'),
            subtitle: Text('Select your preferred language'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                }
              },
              items: <String>['English', 'Spanish', 'French', 'German']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          // ... (rest of the settings options)
        ],
      ),
    );
  }
}
