import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/wallet/wallet.dart';

import '../contract/purchased_contract_list.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<WalletState> _walletKey = GlobalKey<WalletState>();
  final GlobalKey<PurchasedContractListState> _purchasedContractListKey =
      GlobalKey<PurchasedContractListState>();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    initNotifications();
    super.initState();
  }

  void _refresh() {
    print('refresh');
    _walletKey.currentState!.getWalletData();
    _purchasedContractListKey.currentState!.getPurchasedContracts();
    _showNotification("title", "body");
  }

  Future<void> initNotifications() async {
    // Android notification settings
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('notification.png');

    // iOS notification settings
    const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();

    // General initialization settings
    const InitializationSettings initializationSettings = InitializationSettings(
      iOS: initializationSettingsDarwin,
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // void onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   // display a dialog with the notification details, tap ok to go to another page
  //   showNotification("title", "body");
  // }

  Future<void> _showNotification(String title, String body) async {

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final NotificationDetails notificationDetails = NotificationDetails(iOS: darwinNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      notificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Contract'),
        actions: [
          IconButton(
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Wallet(key: _walletKey),
          const SizedBox(height: 12),
          PurchasedContractList(key: _purchasedContractListKey),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/flight-list');
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.health_and_safety,
          size: 30,
        ),
      ),
    );
  }
}
