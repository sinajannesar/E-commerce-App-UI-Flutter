import '../models/course_model.dart';
import '../models/user_model.dart';

class MockData {
  // Mock users
  static final User adminUser = User(
    id: 'admin01',
    name: 'مدیر سیستم',
    email: 'admin@courseapp.com',
    role: UserRole.admin,
    avatarUrl: 'https://i.pravatar.cc/150?u=admin',
  );

  static final User studentUser = User(
    id: 'student01',
    name: 'علی حسینی',
    email: 'ali@example.com',
    role: UserRole.student,
    avatarUrl: 'https://i.pravatar.cc/150?u=student',
  );

  // List of mock courses with reliable placeholder images
  static final List<Course> courses = [
    Course(
      id: 'c1',
      title: 'آموزش جامع فلاتر ۲۰۲۵',
      instructor: 'محمد اکبری',
      // ✅ FIX: Using a reliable placeholder image URL
      imageUrl: 'https://placehold.co/600x400/6a1b9a/white?text=Flutter',
      duration: '۴۵ ساعت',
      price: 250000,
      description: 'در این دوره از صفر تا صد فلاتر را به صورت پروژه‌محور یاد خواهید گرفت و برای ورود به بازار کار آماده می‌شوید.',
    ),
    Course(
      id: 'c2',
      title: 'اصول طراحی UI/UX',
      instructor: 'سارا احمدی',
      // ✅ FIX: Using a reliable placeholder image URL
      imageUrl: 'https://placehold.co/600x400/7b1fa2/white?text=UI/UX',
      duration: '۲۰ ساعت',
      price: 180000,
      description: 'یادگیری اصول طراحی رابط کاربری و تجربه کاربری برای ساخت اپلیکیشن‌های جذاب و کاربرپسند.',
    ),
    Course(
      id: 'c3',
      title: 'پایتون برای هوش مصنوعی',
      instructor: 'رضا قاسمی',
      // ✅ FIX: Using a reliable placeholder image URL
      imageUrl: 'https://placehold.co/600x400/8e24aa/white?text=Python+AI',
      duration: '۶۰ ساعت',
      price: 400000,
      description: 'در این دوره با استفاده از پایتون و کتابخانه‌های قدرتمند آن، وارد دنیای جذاب هوش مصنوعی شوید.',
    ),
  ];
}