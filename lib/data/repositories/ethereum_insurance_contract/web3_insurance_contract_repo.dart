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
      print('getDeployedInsurances value:$value');
      return value;
    });
  }

  @override
  Future<List<InsuranceContract>> getPurchasedInsuranceContracts() async {
    return _web3DataSource.getPurchasedInsuranceContracts().then(
      (value) {
        print('getPurchasedInsuranceContracts value:$value');
        return value.asMap().entries.map((entry) {
          final list = entry.value as List<dynamic>;

          return InsuranceContract(
            address: 'unknown',
            templateId: (list[0] as BigInt).toInt(),
            templateName: list[1].toString(),
            flightNumber: list[2].toString(),
            departureTime: (list[3] as BigInt).toInt(),
            insurer: list[4].toString(),
            insured: list[5].toString(),
            premium: (list[6] as BigInt).toDouble(),
            payoutAmount: (list[7] as BigInt).toDouble(),
            isActive: list[8].toString() == "true",
            isPaidOut: list[9].toString() == "true",
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
          premium: (list[2] as BigInt).toDouble(),
          payoutAmount: (list[3] as BigInt).toDouble(),
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
}
