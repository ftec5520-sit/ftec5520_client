import 'dart:async';
import 'dart:io';

import 'package:ftec5520_client/data/data_source/web3_datasource.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';
import 'package:ftec5520_client/domain/entities/insurance_contract.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/insurance_contract_repository.dart';

class Web3InsuranceContractRepo implements InsuranceContractRepository {
  final Web3DataSource _web3DataSource = Web3DataSource();

  Web3InsuranceContractRepo();

  @override
  Future<List<String>> getDeployedInsurances() {
    return _web3DataSource.getDeployedInsurances().then((value) {
      // print('getDeployedInsurances value:$value');
      return value;
    });
  }

  @override
  Future<List<InsuranceContract>> getPurchasedInsuranceContracts() async {
    return _web3DataSource.getPurchasedInsuranceContracts().then(
      (value) {
        print('getPurchasedInsuranceContracts value:$value');
        final data = value[0] as List<dynamic>;
        if (data.isEmpty) {
          return [];
        }

        return data.map((list) {
          int templateId = (list[0] as BigInt).toInt();
          String templateName = list[1].toString();
          String flightNumber = list[2].toString();
          DateTime departureTime = DateTime.fromMillisecondsSinceEpoch(int.parse(list[3] as String));
          String insurer = list[4].toString();
          String insured = list[5].toString();
          BigInt premium = list[6] as BigInt;
          BigInt payoutAmount = list[7] as BigInt;
          bool isActive = list[8].toString() == "true";
          bool isPaidOut = list[9].toString() == "true";

          return InsuranceContract(
            address: 'unknown',
            templateId: templateId,
            templateName: templateName,
            flightNumber: flightNumber,
            departureTime: departureTime,
            insurer: insurer,
            insured: insured,
            premium: premium,
            payoutAmount: payoutAmount,
            isActive: isActive,
            isPaidOut: isPaidOut,
          );
        }).toList();
      },
    );
  }

  @override
  Future<List<ContractTemplate>> getAvailableContractTemplates() async {
    return _web3DataSource.getAvailableContractTemplates().then((value) {
      return value.asMap().entries.map((entry) {
        final list = entry.value as List<dynamic>;

        return ContractTemplate(
          id: (list[0] as BigInt).toInt(),
          name: list[1].toString(),
          premium: list[2] as BigInt,
          payoutAmount: list[3] as BigInt,
        );
      }).toList();
    });
  }

  @override
  Future<String> purchaseInsuranceContract(
    ContractTemplate contractTemplate,
    String flightNumber,
    int departureTime,
  ) async {
    return _web3DataSource
        .purchaseInsuranceContract(contractTemplate.id, flightNumber,
            departureTime, contractTemplate.premium)
        .then((value) {
      print('purchaseInsuranceContract value:$value');
      return value;
    });
  }

  StreamController<dynamic> listenClaimEvents(List<String> addresses) {

    return _web3DataSource.listenClaimEvents(addresses).map((event) {
      print('listenClaimEvents event:$event');
      return event;
    });
  }
}
