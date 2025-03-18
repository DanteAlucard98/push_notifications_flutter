import 'package:flutter/material.dart';
import 'package:prueba_notifications/local_notifications/noti_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () async {
          try {
            NotiService().showNotification(
              title: 'Local Notifications',
              body: "Prueba Local Notifications"
            );
          } catch (e) {
            print('Error sending notification: $e');
          }
        },
        child: Text('Notificacion'),
      ),
    ));
  }
}
