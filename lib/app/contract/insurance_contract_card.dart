import 'package:flutter/material.dart';
import 'package:ftec5520_client/domain/entities/insurance_contract.dart';

class InsuranceContractCard extends StatelessWidget {

  InsuranceContract contract;

  InsuranceContractCard(this.contract, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contract.templateName,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4.0),
                Text('Flight Number: ${contract.flightNumber}'),
                const SizedBox(height: 4.0),
                Text('Departure Time: ${contract.departureTimeFormatted}'),
                const SizedBox(height: 4.0),
                Text('Premium: \$${contract.premium}'),
                const SizedBox(height: 4.0),
                Text('Payout Amount: \$${contract.payoutAmount}'),
              ],
            ),
            Column(
              children: [
                // const SizedBox(height: 2.0),
                contract.isPaidOut
                    ? const Icon(Icons.gavel, color: Colors.green, size: 50.0)
                    : const Icon(Icons.health_and_safety, color: Colors.grey, size: 30.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

}