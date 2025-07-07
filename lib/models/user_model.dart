// این کلاس، ساختار یک کاربر را تعریف می‌کند.
enum UserRole { student, admin }

class User {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.avatarUrl,
  });
}