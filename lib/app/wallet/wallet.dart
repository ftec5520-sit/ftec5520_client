import 'package:flutter/material.dart';
import 'package:ftec5520_client/data/repositories/ethereum_insurance_contract/web3_wallet_repo.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/wallet_repository.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  double? balance;

  Future<void> getBalance() async {
    final WalletRepository walletRepo = Web3WalletRepo();
    var data = await walletRepo.getBalance();
    setState(() {
      balance = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Wallet'),
            subtitle: balance != null
                ? Text(balance.toString())
                : const Text('loading...'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => getBalance(),
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
