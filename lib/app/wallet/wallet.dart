import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Wallet'),
            subtitle: Text('Balance: \$_counter'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.refresh),
                tooltip: 'Reload',
                iconSize: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
