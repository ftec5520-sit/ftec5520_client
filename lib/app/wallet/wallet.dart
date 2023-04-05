import 'package:flutter/material.dart';
import 'package:ftec5520_client/data/repositories/ethereum_insurance_contract/web3_wallet_repo.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/wallet_repository.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => WalletState();
}

class WalletState extends State<Wallet> {
  String? _accountAddress;
  double? _balance;

  @override
  initState() {
    getWalletData();
    super.initState();
  }

  Future<void> getWalletData() async {
    final WalletRepository walletRepo = Web3WalletRepo();
    var accountAddress = await walletRepo.getAccountAddress();
    var balance = await walletRepo.getBalance();
    setState(() {
      _accountAddress = accountAddress;
      _balance = balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 12,
              ),
              const Icon(
                Icons.account_balance_wallet,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: _balance != null
                    ? AutoSizeText(
                  '${_balance.toString()} ETH',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  maxLines: 1,
                )
                    : const Text('loading...',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(_accountAddress ?? '-',
                    style: const TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
