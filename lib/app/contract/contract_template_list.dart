import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/contract/contract_template_card.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/insurance_contract_repository.dart';

import '../../data/repositories/ethereum_insurance_contract/web3_insurance_contract_repo.dart';
import '../../domain/entities/contract_template.dart';

class ContractTemplateList extends StatefulWidget {
  const ContractTemplateList({super.key});

  @override
  _ContractTemplateListState createState() => _ContractTemplateListState();
}

class _ContractTemplateListState extends State<ContractTemplateList> {

  List<ContractTemplate> contractTemplates = [];

  Future<void> getContractTemplates() async {
    final InsuranceContractRepository insuranceContractRepo = Web3InsuranceContractRepo();
    var data = await insuranceContractRepo.getAvailableContractTemplates();
    setState(() {
      contractTemplates = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contract Template List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Back',
            iconSize: 30,
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (context, index) {
          return ContractTemplateCard(contractTemplate: contractTemplates[index]);
        }),
      ),
    );
  }
}