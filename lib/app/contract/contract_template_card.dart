import 'package:flutter/material.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';
import 'package:web3dart/web3dart.dart';

class ContractTemplateCard extends StatelessWidget {
  final ContractTemplate contractTemplate;

  const ContractTemplateCard({super.key, required this.contractTemplate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.abc),
            title: Text(contractTemplate.name),
            subtitle: Text('Premium:${EtherAmount.inWei(contractTemplate.premium).getValueInUnit(EtherUnit.ether)} ETH'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Payout:${contractTemplate.payoutAmount}ETH')
            ],
          ),
        ],
      ),
    );
  }
}
