import 'package:ftec5520_client/domain/entities/insurance_contract.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';
import 'package:ftec5520_client/domain/interfaces/repositories/insurance_contract_repository.dart';

class EthereumInsuranceContractRepo implements InsuranceContractRepository {
  final String url = '';
  final String account = '';

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
