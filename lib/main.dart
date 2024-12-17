import 'package:eyedoctor_pro/auth/firebase_notifications.dart';

import 'package:eyedoctor_pro/screens/image_test_result.dart';
import 'package:eyedoctor_pro/screens/splash_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotifications().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return GetMaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      theme: ThemeData(useMaterial3: true, fontFamily: 'Nunito'),
      navigatorKey: navigatorKey,
      routes: {
        '/gallery_test': (context) => const ImageScreen(),
      },
      home: SplashScreen(),
    );
  }
}
