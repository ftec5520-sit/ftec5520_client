class ContractTemplate {
  final int id;
  final String name;
  final BigInt premium; // in wei
  final BigInt payoutAmount; // in wei

  ContractTemplate({
    required this.id,
    required this.name,
    required this.premium,
    required this.payoutAmount,
  });

  // factory ContractTemplate.fromJson(Map<String, dynamic> json) {
  //   return ContractTemplate(
  //     id: json['id'],
  //     name: json['name'],
  //     description: json['description'],
  //     content: json['content'],
  //     createdAt: json['created_at'],
  //     updatedAt: json['updated_at'],
  //   );
  // }
}
