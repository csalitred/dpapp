// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Lock Manager'),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildDashboardItem(
                    context,
                    'Active Locks',
                    '5',
                    Icons.lock,
                    Colors.blue,
                    () => Navigator.pushNamed(context, '/containers'),
                  ),
                  _buildDashboardItem(
                    context,
                    'Alerts',
                    '2',
                    Icons.warning,
                    Colors.orange,
                    () {/* Navigate to alerts screen */},
                  ),
                  _buildDashboardItem(
                    context,
                    'Data Sync',
                    'Tap to sync',
                    Icons.sync,
                    Colors.green,
                    () {/* Trigger data sync */},
                  ),
                  _buildDashboardItem(
                    context,
                    'Recent Activity',
                    'View Log',
                    Icons.history,
                    Colors.purple,
                    () {/* Navigate to activity log */},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add New Lock'),
              onPressed: () {/* Navigate to add new lock screen */},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, String title, String value,
      IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: color),
              SizedBox(height: 4),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: color),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
