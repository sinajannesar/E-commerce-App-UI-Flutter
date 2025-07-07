import 'package:flutter/material.dart';
import '../core/mock_data.dart';
import '../models/user_model.dart';

class AuthService extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;
  bool get isAdmin => _currentUser?.role == UserRole.admin;

  // FIX: Updated login method to use credentials.
  // We'll check if the email matches our mock admin email.
  void login(String name, String email) {
    if (email.toLowerCase() == MockData.adminUser.email) {
      _currentUser = MockData.adminUser;
    } else {
      // For any other user, create a new student user object.
      _currentUser = User(
        id: 'student-${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        email: email,
        role: UserRole.student,
        avatarUrl: 'https://i.pravatar.cc/150?u=$email', // Avatar based on email
      );
    }
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}