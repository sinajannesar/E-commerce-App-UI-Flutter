import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Core and Services
import 'core/theme.dart';
import 'services/auth_service.dart';
import 'services/banner_service.dart';
import 'services/tapsell_service.dart';

// Screens
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/main_wrapper.dart';
import 'presentation/screens/profile/edit_profile_screen.dart';
import 'presentation/screens/admin/admin_dashboard_screen.dart';

void main() {
  // We create an instance of the service here to use it in main.
  final tapsellService = TapsellService();
  // Initialize Tapsell right when the app starts.
  tapsellService.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => BannerService()),
        // Provide the Tapsell service instance to the app.
        Provider<TapsellService>(create: (context) => tapsellService),
      ],
      child: const MyApp(), // This line was causing the error
    ),
  );
}

// ✅ FIX: The MyApp class definition was missing. Here it is.
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