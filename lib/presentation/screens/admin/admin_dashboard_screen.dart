import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/banner_service.dart';
import '../../common_widgets/ad_banner.dart';
import 'user_management_screen.dart';
import '../../../core/theme.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the banner service
    final bannerService = Provider.of<BannerService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('داشبورد ادمین'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            // FIX: Added a switch to control the user banner
            Card(
              child: SwitchListTile(
                title: const Text('نمایش بنر به کاربران'),
                subtitle: const Text('بنر در صفحه اصلی کاربران نمایش داده می‌شود'),
                value: bannerService.isBannerVisible,
                onChanged: (bool value) {
                  bannerService.toggleBannerVisibility(value);
                },
                secondary: const Icon(Icons.campaign, color: AppTheme.accentColor),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.only(top: 20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildDashboardCard(context, icon: Icons.school, label: 'مدیریت دوره‌ها', onTap: () {}),
                  _buildDashboardCard(context, icon: Icons.people, label: 'مدیریت کاربران', onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserManagementScreen()));
                  }),
                  _buildDashboardCard(context, icon: Icons.analytics, label: 'گزارش‌ها', onTap: () {}),
                  _buildDashboardCard(context, icon: Icons.message, label: 'پیام‌ها', onTap: () {}),
                ],
              ),
            ),
            const AdBanner(), // This is the admin's own ad banner
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    // ... (This function remains unchanged)
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