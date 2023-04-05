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
        final data = value[0][0] as List<dynamic>;
        final addresses = value[0][1] as List<dynamic>;
        if (data.isEmpty) {
          return [];
        }

        return List.generate(data.length, (index) {
          final insuranceData = List<dynamic>.from(data[index]);
          final address = addresses[index];

          int templateId = (insuranceData[0] as BigInt).toInt();
          String templateName = insuranceData[1].toString();
          String flightNumber = insuranceData[2].toString();
          DateTime departureTime =
          DateTime.fromMillisecondsSinceEpoch(int.parse(insuranceData[3] as String));
          String insurer = insuranceData[4].toString();
          String insured = insuranceData[5].toString();
          BigInt premium = insuranceData[6] as BigInt;
          BigInt payoutAmount = insuranceData[7] as BigInt;
          bool isActive = insuranceData[8].toString() == "true";
          bool isPaidOut = insuranceData[9].toString() == "true";

          return InsuranceContract(
            address: address.hex,
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
        });
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

  @override
  Stream<InsuranceContract> listenClaimEvents(List<String> addresses) {
    return _web3DataSource.listenClaimEvents(addresses).map((event) {
      print('listenClaimEvents event:$event');
      int templateId = (event[0] as BigInt).toInt();
      String templateName = event[1].toString();
      String flightNumber = event[2].toString();
      DateTime departureTime =
      DateTime.fromMillisecondsSinceEpoch(int.parse(event[3] as String));
      String insurer = event[4].toString();
      String insured = event[5].toString();
      BigInt premium = event[6] as BigInt;
      BigInt payoutAmount = event[7] as BigInt;
      bool isActive = event[8].toString() == "true";
      bool isPaidOut = event[9].toString() == "true";

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
    });
  }
}
