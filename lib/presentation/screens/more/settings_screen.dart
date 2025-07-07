import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('حالت تاریک'),
            secondary: const Icon(Icons.dark_mode_outlined),
            value: false, // مقدار اولیه
            onChanged: (bool value) {
              // منطق تغییر تم در اینجا پیاده‌سازی می‌شود
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('اعلان‌ها'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: const Text('زبان'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}