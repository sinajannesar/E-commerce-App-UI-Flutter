import 'package:flutter/material.dart';
import 'user_management_screen.dart';
import '../../../core/theme.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('داشبورد ادمین'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildDashboardCard(
            context,
            icon: Icons.school,
            label: 'مدیریت دوره‌ها',
            onTap: () {},
          ),
          _buildDashboardCard(
            context,
            icon: Icons.people,
            label: 'مدیریت کاربران',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserManagementScreen(),
              ));
            },
          ),
          _buildDashboardCard(
            context,
            icon: Icons.analytics,
            label: 'گزارش‌ها',
            onTap: () {},
          ),
          _buildDashboardCard(
            context,
            icon: Icons.message,
            label: 'پیام‌ها',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: AppTheme.primaryColor),
            const SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}