// این فایل شامل تمام داده‌های فیک برنامه است.
import '../models/course_model.dart';
import '../models/user_model.dart';

class MockData {
  // کاربران فیک
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

  // لیست دوره‌های فیک
  static final List<Course> courses = [
    Course(
      id: 'c1',
      title: 'آموزش جامع فلاتر ۲۰۲۵',
      instructor: 'محمد اکبری',
      imageUrl: 'https://images.unsplash.com/photo-1607252650355-f7fd0460ccdb?w=500&q=80',
      duration: '۴۵ ساعت',
      price: 250000,
      description: 'در این دوره از صفر تا صد فلاتر را به صورت پروژه‌محور یاد خواهید گرفت و برای ورود به بازار کار آماده می‌شوید.',
    ),
    Course(
      id: 'c2',
      title: 'اصول طراحی UI/UX',
      instructor: 'سارا احمدی',
      imageUrl: 'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?w=500&q=80',
      duration: '۲۰ ساعت',
      price: 180000,
      description: 'یادگیری اصول طراحی رابط کاربری و تجربه کاربری برای ساخت اپلیکیشن‌های جذاب و کاربرپسند.',
    ),
    Course(
      id: 'c3',
      title: 'پایتون برای هوش مصنوعی',
      instructor: 'رضا قاسمی',
      imageUrl: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=500&q=80',
      duration: '۶۰ ساعت',
      price: 400000,
      description: 'در این دوره با استفاده از پایتون و کتابخانه‌های قدرتمند آن، وارد دنیای جذاب هوش مصنوعی شوید.',
    ),
  ];
}