// این کلاس، ساختار یک دوره آموزشی را تعریف می‌کند.
class Course {
  final String id;
  final String title;
  final String instructor;
  final String imageUrl;
  final String duration;
  final double price;
  final String description;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.duration,
    required this.price,
    required this.description,
  });
}