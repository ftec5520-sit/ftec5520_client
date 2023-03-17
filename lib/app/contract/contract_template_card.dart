import 'package:flutter/material.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';

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
            subtitle: Text('Premium:${contractTemplate.premium.toString()}'),
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
