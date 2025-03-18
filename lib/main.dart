import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prueba_notifications/API/firebase_api.dart';
import 'package:prueba_notifications/firebase_options.dart';
import 'package:prueba_notifications/home_page.dart';
import 'package:prueba_notifications/local_notifications/noti_service.dart';

void main() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseApi().initializeNotifications();
    await Permission.notification.isDenied.then((value) {
        if (value) {
          Permission.notification.request();
        }
      });
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    NotiService().initNotification();
    runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}




