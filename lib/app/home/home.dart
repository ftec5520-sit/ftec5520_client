import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/wallet/wallet.dart';
import 'package:ftec5520_client/data/data_source/web3_datasource.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<double> getBalance() async {
    var data = await Web3DataSource().getBalance();
    return data;
  }

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
            FutureBuilder<double>(
                future: getBalance(),
                builder:
                    (BuildContext context, AsyncSnapshot<double> snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
            Text(
              'end',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
