import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Core and Services
import 'core/theme.dart';
import 'services/auth_service.dart';

// Screens
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/main_wrapper.dart';
import 'presentation/screens/profile/edit_profile_screen.dart';
import 'presentation/screens/admin/admin_dashboard_screen.dart';


void main() {
  runApp(
    // Make the AuthService available throughout the app
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CourseApp',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      // Set text direction to right-to-left for Persian
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      // The first page to be displayed
      home: const SplashScreen(),
      // Define named routes for clean navigation
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainWrapper(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/admin-dashboard': (context) => const AdminDashboardScreen(),
      },
    );
  }
}