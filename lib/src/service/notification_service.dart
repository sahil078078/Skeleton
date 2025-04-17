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




// NEW NEW NEW NEW NEW NEW NEW NEW 

/*
class NotificationService {
  NotificationService._();
  factory NotificationService() => NotificationService._();

  static final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  static FlutterLocalNotificationsPlugin get notificationInstance => _notifications;

  static Future<void> initializePlatformSpecifics() async {
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
    );

    await _requestPermissions();

    await _notifications.initialize(InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS));

    // Firebase setup
    await _firebaseInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //! Firebase Notification Handler
    _firebaseNotificationHandler();

    //! Interacted Notification onTap
    _setupInteractedMessage();
  }

  static NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'app.textile.mandee',
        'app.textile.mandee.channel.name',
        channelDescription: 'app.textile.mandee.channel.description',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        // playSound: true,
        sound: RawResourceAndroidNotificationSound('confirmation_audio'), //! CUSTOM SOUND ->  -> android_tone_1
      ),
      iOS: DarwinNotificationDetails(
        // sound: 'slow_spring_board.wav', //! CUSTOM SOUND
        presentSound: true,
        presentBadge: true,
        presentAlert: true,
      ),
    );
  }

  static Future<void> _requestPermissions() async {
    if (Platform.isIOS) {
      await _notifications.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestNotificationsPermission();
    }
  }

  static Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await _notifications.show(
      id,
      title ?? 'TexTile Mandee',
      body ?? 'This is notification from TexTile Mandee app, for you get all notification of you already set in app',
      _notificationDetails(),
      payload: payload,
    );
  }

  static final _firebaseInstance = FirebaseMessaging.instance;

  //! Firebase Background Msg Handler
  static Future<void> firebaseBackgroundMsgHandler(RemoteMessage message) async {
    await showNotification(
      id: message.notification?.hashCode ?? 0,
      title: message.notification?.title,
      body: message.notification?.body,
    );

    if (message.data.isNotEmpty) {
      debugPrint('Background Message Data: ${message.data}');
    }
  }

  //! FIREBASE Messaging
  static void _firebaseNotificationHandler() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage event) {
        showNotification(
          id: event.notification?.hashCode ?? DateTime.now().millisecondsSinceEpoch,
          title: event.notification?.title,
          body: event.notification?.body,
          payload: jsonEncode(event.data), // ! PAY LOAD
        );

        if (event.data.isNotEmpty) {
          debugPrint('Foreground Message Data: ${event.data}');
        }
      },
    );
  }

  //! SETUP Interacted Message

  static Future _setupInteractedMessage() async {
    final msg = await _firebaseInstance.getInitialMessage();
    debugPrint("setupInteractedMessage MSG : ${msg?.data}\n ${msg?.notification?.body}\n  ${msg?.notification?.title}");
  }
}

*/