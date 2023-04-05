import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/flight/flight_list.dart';
import 'package:ftec5520_client/app/home/home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'app/utils/notification_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Android notification settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('notification.png');

  // iOS notification settings
  const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin);

  await NotificationUtils.flutterLocalNotificationsPlugin
      .initialize(initializationSettings);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/flight-list': (context) => const FlightList(),
      },
      // home: const Home(),
    );
  }
}

Future<void> onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  // Your logic here, you can show a dialog or a specific screen
  print("onDidReceiveLocalNotification, id: $id, title: $title, body: $body, payload: $payload");
}
