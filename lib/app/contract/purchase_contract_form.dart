import 'package:flutter/material.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';

import '../../data/repositories/ethereum_insurance_contract/web3_insurance_contract_repo.dart';
import '../../domain/entities/flight.dart';
import '../../domain/interfaces/repositories/insurance_contract_repository.dart';

class PurchaseContractForm extends StatefulWidget {
  final Flight flight;
  final List<ContractTemplate> contractTemplates;

  final Function(dynamic result) onSuccess;
  final Function(dynamic result) onError;

  const PurchaseContractForm({
    super.key,
    required this.flight,
    required this.contractTemplates,
    required this.onSuccess,
    required this.onError,
  });

  @override
  _PurchaseContractFormState createState() => _PurchaseContractFormState();
}

class _PurchaseContractFormState extends State<PurchaseContractForm> {
  int? _selectedTemplateId;

  @override
  void initState() {
    print(widget.flight);
    super.initState();
  }

  // void _onItemSelect(String id) {
  //   setState(() {
  //     _selectedTemplateId = id;
  //   });
  // }

  void _purchaseContract() {
    if (_selectedTemplateId == null) {
      widget.onError("Please select a contract template");
      return;
    }

    final InsuranceContractRepository insuranceContractRepo =
        Web3InsuranceContractRepo();
    final ContractTemplate template = widget.contractTemplates
        .firstWhere((element) => element.id == _selectedTemplateId);
    insuranceContractRepo
        .purchaseInsuranceContract(
      template,
      widget.flight.flightNumber,
      (widget.flight.departureTime.millisecondsSinceEpoch / 1000).round(),
    )
        .then((value) {
      print('purchase contract success $value');
      widget.onSuccess(value);
    }).catchError((error) {
      print(error);
      widget.onError(error);
    });
  }

  Future _showConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Do you want to purchase?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                _purchaseContract();
                // Navigator.of(context).pop(true);
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Flight Details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Airline',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.flight.airline,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Flight Number',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.flight.flightNumber,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Departure Airport',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.flight.departureAirport,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Arrival Airport',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.flight.arrivalAirport,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Departure Time',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.flight.departureTimeFormatted,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Arrival Time',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.flight.arrivalTimeFormatted,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Plan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<int>(
                  value: _selectedTemplateId,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedTemplateId = newValue;
                    });
                  },
                  items: widget.contractTemplates.map((e) {
                    return DropdownMenuItem(
                      value: e.id,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              e.name,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              'Premium ${e.premium.toString()}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              'Payout ${e.payoutAmount.toString()}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[800],
                    size: 24.0,
                  ),
                  iconSize: 24.0,
                  elevation: 5,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[800],
                  ),
                  underline: Container(
                    height: 1,
                    color: Colors.grey[800],
                  ),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      minimumSize: const Size(double.infinity, 32)),
                  onPressed: () {
                    _showConfirmationDialog(context).then((value) {
                      print("dialog return: $value");
                      if (value == true) {
                        widget.onSuccess('success');
                      }
                    });
                  },
                  child: const Text('Purchase'),
                )
              ],
            ),
          ),
        ));
  }
}
