import 'package:flutter/material.dart';
import '../../../core/mock_data.dart';
import '../../common_widgets/course_card.dart';
import 'course_details_screen.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allCourses = MockData.courses;

    return Scaffold(
      body: ListView.builder(
        itemCount: allCourses.length,
        itemBuilder: (context, index) {
          final course = allCourses[index];
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
    );
  }
}