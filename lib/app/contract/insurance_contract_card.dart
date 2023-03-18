import 'package:flutter/cupertino.dart';
import 'package:ftec5520_client/domain/entities/insurance_contract.dart';

class InsuranceContractCard extends StatelessWidget {

  InsuranceContract contract;

  InsuranceContractCard(this.contract, {super.key});

  @override
  Widget build(BuildContext context)  {
    return Text(contract.flightNumber);
  }

}