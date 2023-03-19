import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/flight/flight_card.dart';

import '../../data/repositories/ethereum_insurance_contract/web3_insurance_contract_repo.dart';
import '../../domain/entities/contract_template.dart';
import '../../domain/entities/flight.dart';
import '../../domain/interfaces/repositories/insurance_contract_repository.dart';
import '../contract/purchase_contract_form.dart';

class FlightList extends StatefulWidget {
  const FlightList({super.key});

  @override
  _ContractFlightListState createState() => _ContractFlightListState();
}

class _ContractFlightListState extends State<FlightList> {
  List<Flight> flights = [];
  List<ContractTemplate> contractTemplates = [];

  @override
  void initState() {
    _getContractTemplates();
    _getFlights();
    super.initState();
  }

  void _getContractTemplates() {
    final InsuranceContractRepository insuranceContractRepo =
        Web3InsuranceContractRepo();
    insuranceContractRepo.getAvailableContractTemplates().then((value) => {
          setState(() {
            contractTemplates = value;
          })
        });
  }

  void _getFlights() {
    setState(() {
      flights = [
        Flight(
          id: '1',
          airline: 'American Airlines',
          flightNumber: 'AA123',
          departureAirport: 'New York (JFK)',
          arrivalAirport: 'Los Angeles (LAX)',
          departureTime: DateTime.now(),
          arrivalTime: DateTime.now().add(const Duration(hours: 6)),
        ),
        Flight(
          id: '2',
          airline: 'Delta Air Lines',
          flightNumber: 'DL456',
          departureAirport: 'Atlanta (ATL)',
          arrivalAirport: 'San Francisco (SFO)',
          departureTime: DateTime.now(),
          arrivalTime: DateTime.now().add(const Duration(hours: 8)),
        ),
        Flight(
          id: '3',
          airline: 'United Airlines',
          flightNumber: 'UA789',
          departureAirport: 'Chicago (ORD)',
          arrivalAirport: 'Miami (MIA)',
          departureTime: DateTime.now(),
          arrivalTime: DateTime.now().add(const Duration(hours: 3)),
        ),
        Flight(
          id: '4',
          airline: 'Southwest Airlines',
          flightNumber: 'WN234',
          departureAirport: 'Dallas (DFW)',
          arrivalAirport: 'Denver (DEN)',
          departureTime: DateTime.now(),
          arrivalTime: DateTime.now().add(const Duration(hours: 2)),
        ),
        Flight(
          id: '5',
          airline: 'Alaska Airlines',
          flightNumber: 'AS567',
          departureAirport: 'Seattle (SEA)',
          arrivalAirport: 'Newark (EWR)',
          departureTime: DateTime.now(),
          arrivalTime: DateTime.now().add(const Duration(hours: 5)),
        ),
        Flight(
          id: '6',
          airline: 'JetBlue Airways',
          flightNumber: 'B624',
          departureAirport: 'Boston (BOS)',
          arrivalAirport: 'Orlando (MCO)',
          departureTime: DateTime.now(),
          arrivalTime: DateTime.now().add(const Duration(hours: 3)),
        ),
        Flight(
          id: '7',
          airline: 'Frontier Airlines',
          flightNumber: 'F965',
          departureAirport: 'Las Vegas (LAS)',
          arrivalAirport: 'Cincinnati (CVG)',
          departureTime: DateTime.now(),
          arrivalTime: DateTime.now().add(const Duration(hours: 4)),
        ),
        Flight(
          id: '8',
          airline: 'Spirit Airlines',
          flightNumber: 'NK321',
          departureAirport: 'Houston (IAH)',
          arrivalAirport: 'Detroit (DTW)',
          departureTime: DateTime.now(),
          arrivalTime: DateTime.now().add(const Duration(hours: 3)),
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Travel Flight'),
        actions: [
          IconButton(
            onPressed: () {
              _getFlights();
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            iconSize: 30,
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: flights.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: FlightCard(flight: flights[index]),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return PurchaseContractForm(
                          flight: flights[index],
                          contractTemplates: contractTemplates,
                          onSuccess: (result) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(result.toString()),
                              ),
                            );
                          },
                          onError: (result) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(result.toString()),
                              ),
                            );
                          },
                        );
                      });
                },
              );
            }),
      ),
    );
  }
}
