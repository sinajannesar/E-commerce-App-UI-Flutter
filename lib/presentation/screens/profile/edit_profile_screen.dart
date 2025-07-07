import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ویرایش پروفایل'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: 'علی حسینی',
              decoration: const InputDecoration(labelText: 'نام و نام خانوادگی'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: 'ali@example.com',
              decoration: const InputDecoration(labelText: 'ایمیل'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text('ذخیره تغییرات'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}