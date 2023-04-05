import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/utils/notification_utils.dart';
import 'package:web3dart/web3dart.dart';

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
  StreamSubscription? claimEventsSubscription;

  @override
  void dispose() {
    claimEventsSubscription?.cancel();
    super.dispose();
  }

  Future<void> getPurchasedContracts() async {
    // Cancel previous subscription
    claimEventsSubscription?.cancel();

    final InsuranceContractRepository insuranceContractRepo =
        Web3InsuranceContractRepo();

    final contracts =
        await insuranceContractRepo.getPurchasedInsuranceContracts();
    setState(() {
      purchasedContracts = contracts;
    });

    claimEventsSubscription = insuranceContractRepo
        .listenClaimEvents(contracts.map((e) => e.address).toList())
        .listen((contract) {
      print('listenClaimEvents contract:$contract');
      NotificationUtils.showNotification(
          title: "Contract claimed",
          body:
              "${contract.flightNumber}, departure:${contract.departureTimeFormatted}, amount:${EtherAmount.inWei(contract.payoutAmount).getValueInUnit(EtherUnit.ether)}",
          payload: "payload",
          context: context);
      getPurchasedContracts();
    });
  }

  @override
  void initState() {
    getPurchasedContracts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RefreshIndicator(
            onRefresh: getPurchasedContracts,
            child: purchasedContracts.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: purchasedContracts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: InsuranceContractCard(purchasedContracts[index]),
                        onTap: () {
                          // showModalBottomSheet(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return const Text("Hello");
                          //     });
                        },
                      );
                    })
                : Text(
                    'You do not have any contract yet.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  )));
  }
}
