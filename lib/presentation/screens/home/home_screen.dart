import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/mock_data.dart';
import '../../../services/auth_service.dart';
import '../../../services/banner_service.dart'; // <-- Import the banner service
import '../../common_widgets/course_card.dart';
import '../../common_widgets/ad_banner.dart'; // <-- Import the ad banner
import '../courses/course_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context).currentUser;
    // Listen to the banner service
    final bannerService = Provider.of<BannerService>(context);
    final featuredCourses = MockData.courses.take(2).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'سلام، ${user?.name ?? ''}!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'دوره‌های ویژه برای شما',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: featuredCourses.length,
              itemBuilder: (context, index) {
                final course = featuredCourses[index];
                return CourseCard(
                  course: course,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CourseDetailsScreen(course: course),
                    ));
                  },
                );
              },
            ),
            // FIX: Conditionally show the ad banner based on the service
            if (bannerService.isBannerVisible)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: AdBanner(),
              ),
          ],
        ),
      ),
    );
  }
}