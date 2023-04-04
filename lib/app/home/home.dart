import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/utils/notification_utils.dart';
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

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
  }

  void _refresh() {
    print('refresh');
    _walletKey.currentState!.getWalletData();
    _purchasedContractListKey.currentState!.getPurchasedContracts();
    NotificationUtils.showNotification(
        title: "title", body: "body", payload: "payload", context: context);
  }

  // void onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   // display a dialog with the notification details, tap ok to go to another page
  //   showNotification("title", "body");
  // }

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
