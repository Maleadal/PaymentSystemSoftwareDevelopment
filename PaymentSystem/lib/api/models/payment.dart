class Payment {
  final int id;
  final String name;
  final int value;

  const Payment({
    required this.id,
    required this.name,
    required this.value,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(id: json['id'], name: json['name'], value: json['value']);
  }
}
