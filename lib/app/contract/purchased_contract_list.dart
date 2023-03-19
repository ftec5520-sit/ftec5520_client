import 'package:flutter/material.dart';

import '../../data/repositories/ethereum_insurance_contract/web3_insurance_contract_repo.dart';
import '../../domain/entities/insurance_contract.dart';
import '../../domain/interfaces/repositories/insurance_contract_repository.dart';
import 'insurance_contract_card.dart';

class PurchasedContractList extends StatefulWidget {
  var purchasedContracts = <InsuranceContract>[];

  PurchasedContractList({purchasedContracts, super.key});

  @override
  PurchasedContractListState createState() => PurchasedContractListState();
}

class PurchasedContractListState extends State<PurchasedContractList> {
  List<InsuranceContract> purchasedContracts = [];

  Future<void> getPurchasedContracts() async {
    final InsuranceContractRepository insuranceContractRepo =
        Web3InsuranceContractRepo();
    insuranceContractRepo.getPurchasedInsuranceContracts().then((value) => {
          setState(() {
            purchasedContracts = value;
          })
        });

    insuranceContractRepo.getDeployedInsurances().then((value) => {
          // print('getDeployedInsurances value:$value'),
    });
  }

  @override
  void initState() {
    getPurchasedContracts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getPurchasedContracts,
      child: purchasedContracts.isNotEmpty
          ? ListView.builder(
          shrinkWrap: true,
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
          })
          : Text(
        'You do not have any contract yet.',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
