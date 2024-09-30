// import 'dart:async';
// import 'dart:io';

// class NotificationService {
//   NotificationService._();
//   factory NotificationService() => NotificationService._();

//   static final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
//   static FlutterLocalNotificationsPlugin get notificationInstance => _notifications;

//   static Future<void> initializePlatformSpecifics() async {
//     const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
//     final initializationSettingsIOS = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: false,
//       onDidReceiveLocalNotification: (id, title, body, payload) async {
//         appPrint('IOS : onDidReceiveLocalNotification $id , $title, $body ,$payload');
//       },
//     );

//     await _requestPermissions();

//     await _notifications.initialize(
//       InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsIOS,
//       ),
//     );
//   }

//   static NotificationDetails _notificationDetails() {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'reminder_ai_channel_id',
//         'reminder_ai_channel_name',
//         channelDescription: 'reminder_ai_channel_description',
//         importance: Importance.max,
//         sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//       ),
//       iOS: DarwinNotificationDetails(sound: 'slow_spring_board.wav', presentSound: true),
//     );
//   }

//   static Future<void> _requestPermissions() async {
//     if (Platform.isIOS) {
//       await _notifications.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//     } else if (Platform.isAndroid) {
//       final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//           _notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//       await androidImplementation?.requestNotificationsPermission();
//     }
//   }

//   static Future<void> showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async {
//     await _notifications.show(
//       id,
//       title ?? 'Flutter Interview',
//       body ?? 'This is notification from Flutter Interview app, for you get all notification of you already set in app',
//       _notificationDetails(),
//       payload: payload,
//     );
//   }
// }
