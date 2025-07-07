import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme.dart'; // <-- FIX: Import AppTheme
import '../../services/auth_service.dart';
import 'home/home_screen.dart';
import 'courses/course_list_screen.dart';
import 'profile/profile_screen.dart';
import 'more/settings_screen.dart';
import 'more/about_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  // FIX: Removed 'const' because the widgets inside are not constants.
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CourseListScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.currentUser;
    final isAdmin = authService.isAdmin;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CourseApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authService.logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user?.name ?? 'Guest'),
              accountEmail: Text(user?.email ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user?.avatarUrl ?? 'https://placehold.co/150x150/6a1b9a/white?text=C'),
              ),
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('خانه'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text('همه دوره‌ها'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            if (isAdmin)
              ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined,
                    color: AppTheme.accentColor),
                title: const Text('داشبورد ادمین'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/admin-dashboard');
                },
              ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('درباره ما'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('خروج'),
              onTap: () {
                authService.logout();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'دوره‌ها',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'پروفایل',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'تنظیمات',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}