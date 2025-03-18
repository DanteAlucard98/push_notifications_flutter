import Flutter
import UIKit

//Flutter local notifications ios
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback{(registry) in
    GeneratedPluginRegistrant.registrer(with: registry)
    }

    GeneratedPluginRegistrant.register(with: self)

    //Specific version iOS for local notifications
    if #available(iOS 10.0, *){
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
