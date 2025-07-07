import 'package:flutter/material.dart';
import '../../../core/mock_data.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // In a real app, this list would include all users
    final users = [MockData.studentUser, MockData.adminUser];

    return Scaffold(
      appBar: AppBar(
        title: const Text('مدیریت کاربران'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatarUrl),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: Text(
                user.role.name.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}