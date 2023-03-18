import 'package:flutter/material.dart';
import 'package:ftec5520_client/data/repositories/ethereum_insurance_contract/web3_wallet_repo.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/wallet_repository.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? _accountAddress;
  double? _balance;

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
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.account_balance_wallet,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              _balance != null
                  ? Text(
                      '${_balance.toString()} ETH',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  : const Text('loading...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(_accountAddress ?? '-',
                    style: const TextStyle(
                      color: Colors.grey,
                    )),
              ),
              IconButton(
                onPressed: () => getWalletData(),
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
