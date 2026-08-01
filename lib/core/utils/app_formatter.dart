class AppFormatter {
  AppFormatter._();

  static String maskPhone(
      String phone, {
        int visibleStart = 2,
        int visibleEnd = 3,
      }) {
    if (phone.length <= visibleStart + visibleEnd) {
      return phone;
    }

    final start = phone.substring(0, visibleStart);
    final end = phone.substring(phone.length - visibleEnd);
    final stars = '*' * (phone.length - visibleStart - visibleEnd);

    return '$start$stars$end';
  }
}