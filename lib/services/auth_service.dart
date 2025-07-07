import 'package:flutter/material.dart';
import '../core/mock_data.dart';
import '../models/user_model.dart';

// این کلاس وضعیت لاگین کاربر را در کل برنامه مدیریت می‌کند.
class AuthService extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;
  bool get isAdmin => _currentUser?.role == UserRole.admin;

  // متد برای لاگین کردن کاربر
  void login(UserRole role) {
    if (role == UserRole.admin) {
      _currentUser = MockData.adminUser;
    } else {
      _currentUser = MockData.studentUser;
    }
    // به تمام ویجت‌هایی که به این کلاس گوش می‌دهند، اطلاع‌رسانی می‌کند.
    notifyListeners();
  }

  // متد برای خروج کاربر
  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}