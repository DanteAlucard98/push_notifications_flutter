import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  //INITIALIZE
  Future<void> initNotification() async {
    if (_isInitialized) return;

    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    await notificationsPlugin.initialize(initSettings);
  }

  //NOTIFICATIONS DETAL SETUP
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channelid',
        'Daily Notifications',
        channelDescription: 'Channel for daily notifications',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        enableVibration: true,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }


  //SHOW NOTIFICATION
  Future<void> showNotification({int id = 0, String? title, String? body}) async {
    return notificationsPlugin.show(id, title, body, notificationDetails());
  }
}
