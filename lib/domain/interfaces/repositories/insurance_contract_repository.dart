import 'package:ftec5520_client/domain/entities/contract_template.dart';
import 'package:ftec5520_client/domain/entities/insurance_contract.dart';

abstract class InsuranceContractRepository {

  Future<List<String>> getDeployedInsurances();

  Future<List<InsuranceContract>> getPurchasedInsuranceContracts();

  Future<List<ContractTemplate>> getAvailableContractTemplates();

  Future<String> purchaseInsuranceContract(
      ContractTemplate contractTemplate,
      String flightNumber,
      int departureTime);
}
