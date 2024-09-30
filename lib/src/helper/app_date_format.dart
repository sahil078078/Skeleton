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
}
