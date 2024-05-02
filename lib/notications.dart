import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Bildirim yapılandırmasını başlat
  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: null,
      macOS: null,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Bildirim gönderme işlevi
  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your_channel_id', 'your_channel_name',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false);

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Yeni Bildirim',
      'Bildirim içeriği burada yer alacak.',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}
