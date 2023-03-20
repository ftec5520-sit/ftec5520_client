import 'package:intl/intl.dart';

class Flight {
  final String id;
  final String airline;
  final String flightNumber;
  final String departureAirport;
  final String arrivalAirport;
  final DateTime departureTime;
  final DateTime arrivalTime;

  String get departureTimeFormatted {
    return DateFormat('dd/MM hh:mm').format(departureTime);
  }

  String get arrivalTimeFormatted {
    return DateFormat('dd/MM hh:mm').format(arrivalTime);
  }

  Flight({
    required this.id,
    required this.airline,
    required this.flightNumber,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureTime,
    required this.arrivalTime,
  });
}