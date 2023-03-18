import 'package:flutter/material.dart';

import '../../data/repositories/ethereum_insurance_contract/web3_insurance_contract_repo.dart';
import '../../domain/entities/insurance_contract.dart';
import '../../domain/interfaces/repositories/insurance_contract_repository.dart';
import 'insurance_contract_card.dart';

class PurchasedContractList extends StatefulWidget {
  var purchasedContracts = <InsuranceContract>[];

  PurchasedContractList({purchasedContracts, super.key});

  @override
  _PurchasedContractListState createState() => _PurchasedContractListState();
}

class _PurchasedContractListState extends State<PurchasedContractList> {
  List<InsuranceContract> purchasedContracts = [];

  void getPurchasedContracts() {
    final InsuranceContractRepository insuranceContractRepo =
        Web3InsuranceContractRepo();
    insuranceContractRepo.getPurchasedInsuranceContracts().then((value) => {
          setState(() {
            purchasedContracts = value;
          })
        });
  }

  @override
  void initState() {
    getPurchasedContracts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: purchasedContracts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: InsuranceContractCard(purchasedContracts[index]),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const Text("Hello");
                  });
            },
          );
        });
  }
}
