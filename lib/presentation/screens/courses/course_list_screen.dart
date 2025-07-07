import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // <-- Make sure provider is imported
import '../../../core/mock_data.dart';
import '../../../services/tapsell_service.dart'; // <-- Import Tapsell service
import '../../common_widgets/course_card.dart';
import 'course_details_screen.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allCourses = MockData.courses;
    // Get the Tapsell service instance
    final tapsellService = Provider.of<TapsellService>(context, listen: false);

    return Scaffold(
      body: ListView.builder(
        itemCount: allCourses.length,
        itemBuilder: (context, index) {
          final course = allCourses[index];
          return CourseCard(
            course: course,
            onTap: () async { // <-- Make the function async
              // ✅ Step 1: Show the full-screen ad and wait for it to close.
              await tapsellService.showInterstitialAd(context);
              
              // Step 2: After the ad is closed, navigate to the course details.
              // Note: Check if the widget is still in the tree before navigating.
              if (context.mounted) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetailsScreen(course: course),
                ));
              }
            },
          );
        },
      ),
    );
  }
}