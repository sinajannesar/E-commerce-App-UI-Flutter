import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Core and Services
import 'core/theme.dart';
import 'services/auth_service.dart';
import 'services/banner_service.dart'; // <-- Import the new service

// Screens
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/main_wrapper.dart';
import 'presentation/screens/profile/edit_profile_screen.dart';
import 'presentation/screens/admin/admin_dashboard_screen.dart';


void main() {
  runApp(
    // FIX: Use MultiProvider to provide both services to the app.
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => BannerService()),
      ],
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
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainWrapper(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/admin-dashboard': (context) => const AdminDashboardScreen(),
      },
    );
  }
}