import 'dart:io';

import 'package:ftec5520_client/domain/entities/insurance_contract.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/insurance_contract_repository.dart';
import 'package:http/http.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:web3dart/web3dart.dart';

class EthereumInsuranceContractRepo implements InsuranceContractRepository {
  

  // SocketConnector stockConnector = null;

  var httpClient = Client();
  late Web3Client web3client;
  var credentials = EthPrivateKey.fromHex(
      '83b19c39b9c9b6779b16694e9b42705b4bdf604a140cb31a27c1a4f4c5784cba');

  EthereumInsuranceContractRepo() {
    web3client = Web3Client(url, httpClient);
    var address = await credentials.extractAddress();
  }

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
