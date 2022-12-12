class Customer {
  final int id;
  final String lastName;
  final String firstName;
  final String middleName;
  final String address;

  const Customer(
      {required this.id,
      required this.lastName,
      required this.firstName,
      required this.middleName,
      required this.address});
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        lastName: json['last_name'],
        address: json['address'],
        firstName: json['first_name'],
        id: json['id'],
        middleName: json['middle_name']);
  }
}
