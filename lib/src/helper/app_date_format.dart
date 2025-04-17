import 'package:intl/intl.dart';

class AppDateFormat {
  AppDateFormat._();
  factory AppDateFormat() => AppDateFormat._();

  //* dd/MMM/yyyy like 27/Mar/1998
  static String ddMMMYyyy(DateTime date) => DateFormat('dd/MMM/yyyy').format(date);

  //* dd/MMMM/yyyy like 07/November/2001
  static String ddMMMMYyyy(DateTime date) => DateFormat('dd/MMMM/yyyy').format(date);

  //* dd/MM/yyyy like 07/11/2001
  static String ddMMYyyy(DateTime date) => DateFormat('dd/MM/yyyy').format(date);

  //* Month,Year like Nov 2001
  static String calenderHeader(DateTime date) => DateFormat('MMM,yyyy').format(date);

  //* Notification => 22-Apr-2024 | 09:00 AM
  static String notification(DateTime date) => DateFormat('dd-MMM-yyyy | hh:mm a').format(date);

  //* AnnouncementDate => 01-05-2004 | Sunday
  static String announce(DateTime date) => DateFormat('dd-MM-yyyy | EEEE').format(date);

  //* Day
  static String day(DateTime date) => DateFormat('dd').format(date);

  //* Month
  static String month(DateTime date) => DateFormat('MMM').format(date);

  //* Event
  static String event(DateTime date) => DateFormat('EEE, dd MMM, yyyy  hh:mm a').format(date);

  //* Day Month
  static String dayMonth(DateTime date) => DateFormat('dd, MMM').format(date);

  //* UserFormat
  static String userFormat(DateTime date, String format) => DateFormat(format).format(date);

  //* Comment | Like youtube
  static String comment(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      // Same day, return in hours
      if (difference.inHours == 0) {
        // Less than an hour, return in minutes
        if (difference.inMinutes == 0) {
          return 'Just now';
        } else {
          return '${difference.inMinutes}m';
        }
      } else {
        return '${difference.inHours}h';
      }
    } else if (difference.inDays < 30) {
      // Less than a month, return in days
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inDays < 365) {
      // Less than a year, return in months
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''}';
    } else {
      // More than a year, return in years
      final years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''}';
    }
  }
}
