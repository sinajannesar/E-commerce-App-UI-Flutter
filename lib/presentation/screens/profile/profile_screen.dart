import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme.dart';
import '../../../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context).currentUser;

    if (user == null) {
      return const Center(child: Text('کاربر یافت نشد!'));
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.avatarUrl),
              ),
              const SizedBox(height: 20),
              Text(user.name, style: Theme.of(context).textTheme.displayLarge),
              Text(user.email, style: const TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 30),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.edit_outlined, color: AppTheme.primaryColor),
                title: const Text('ویرایش پروفایل'),
                onTap: () {
                  Navigator.of(context).pushNamed('/edit-profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.my_library_books_outlined, color: AppTheme.primaryColor),
                title: const Text('دوره‌های من'),
                onTap: () {
                  // در آینده می‌توانید این صفحه را پیاده‌سازی کنید
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}