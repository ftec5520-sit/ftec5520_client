import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/wallet/wallet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Contract'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Wallet(),
            const SizedBox(
              height: 12
            ),
            Text(
              'You do not have any contract yet.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
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
