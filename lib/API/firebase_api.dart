import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initializeNotifications() async {
    //permisision from usser
    await _firebaseMessaging.requestPermission();

    //FCM token for this device

    final fCMToken = await _firebaseMessaging.getToken();

    //print the token

    print("FCM Token: $fCMToken");
  }

  // function to handle recived messages

  // function to initialize foreground and background settings

}