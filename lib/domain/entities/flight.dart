class Flight {
  final String id;
  final String airline;
  final String flightNumber;
  final String departureAirport;
  final String arrivalAirport;
  final DateTime departureTime;
  final DateTime arrivalTime;

  String get departureTimeFormatted {
    final month = departureTime.month;
    final day = departureTime.day;
    final hour = departureTime.hour;
    final minute = departureTime.minute;
    return '$day/$month $hour:$minute';
  }

  String get arrivalTimeFormatted {
    final month = departureTime.month;
    final day = departureTime.day;
    final hour = arrivalTime.hour;
    final minute = arrivalTime.minute;
    return '$day/$month $hour:$minute';
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

  // factory Flight.fromJson(Map<String, dynamic> json) {
  //   return Flight(
  //     id: json['id'],
  //     airline: json['airline'],
  //     flightNumber: json['flightNumber'],
  //     departureAirport: json['departureAirport'],
  //     arrivalAirport: json['arrivalAirport'],
  //     departureTime: json['departureTime'],
  //     arrivalTime: json['arrivalTime'],
  //     aircraft: json['aircraft'],
  //     status: json['status'],
  //     terminal: json['terminal'],
  //     gate: json['gate'],
  //     baggage: json['baggage'],
  //   );
  // }
}