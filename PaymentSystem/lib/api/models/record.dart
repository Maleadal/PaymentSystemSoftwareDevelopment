class Record {
  final int id;
  final int customerID;
  final int paymentID;

  const Record(
      {required this.id, required this.customerID, required this.paymentID});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
        id: json['id'],
        customerID: json['customer_id'],
        paymentID: json['payment_id']);
  }
}
