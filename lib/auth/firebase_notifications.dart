import 'package:eyedoctor_pro/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("token $fCMToken");

    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.pushNamed('/gallery_test', arguments: message);
  }
  // background settings

  Future initPushNotifications() async {
    // handle noti if app was terminated and now open
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    // attach event listners when noti get opens
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
