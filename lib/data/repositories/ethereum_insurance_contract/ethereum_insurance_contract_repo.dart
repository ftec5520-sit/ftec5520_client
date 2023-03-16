import 'dart:io';

import 'package:ftec5520_client/domain/entities/insurance_contract.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/insurance_contract_repository.dart';
import 'package:web3dart/web3dart.dart';

class EthereumInsuranceContractRepo implements InsuranceContractRepository {
  final String url = "https://goerli.infura.io/v3/YOUR_INFURA_PROJECT_ID";
  final String account = '';

  var httpClient = HttpClient();
  final Web3Client web3client = Web3Client(url, httpClient);

  @override
  Future<List<InsuranceContract>> getPurchasedInsuranceContracts() async {
    throw UnimplementedError();
  }

  @override
  Future<List<ContractTemplate>> getAvailableContractTemplates() async {
    // TODO: implement getAvailableContractTemplates
    throw UnimplementedError();
  }

  @override
  Future<InsuranceContract> purchaseInsuranceContract(
      ContractTemplate contractTemplate) async {
    // TODO: implement purchaseInsuranceContract
    throw UnimplementedError();
  }
}
