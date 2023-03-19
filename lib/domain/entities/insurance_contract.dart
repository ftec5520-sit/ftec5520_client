class InsuranceContract {
  String address;
  int templateId;
  String templateName;
  String flightNumber;
  int departureTime;
  String insurer;
  String insured;
  double premium;
  double payoutAmount;
  bool isActive;
  bool isPaidOut;

  InsuranceContract({
    required this.address,
    required this.templateId,
    required this.templateName,
    required this.flightNumber,
    required this.departureTime,
    required this.insurer,
    required this.insured,
    required this.premium,
    required this.payoutAmount,
    required this.isActive,
    required this.isPaidOut,
  });
}
