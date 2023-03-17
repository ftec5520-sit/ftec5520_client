import 'dart:io';

import 'package:ftec5520_client/data/data_source/web3_datasource.dart';
import 'package:ftec5520_client/domain/entities/insurance_contract.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/insurance_contract_repository.dart';
import 'package:http/http.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:web3dart/web3dart.dart';

class Web3InsuranceContractRepo implements InsuranceContractRepository {

  Web3DataSource web3DataSource = Web3DataSource();

  Web3InsuranceContractRepo() {
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
