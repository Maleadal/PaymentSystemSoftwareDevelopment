class Customer {
  final int id;
  final String lastName;
  final String firstName;
  final String middleName;
  final String address;

  Customer(
      {required this.id,
      required this.lastName,
      required this.firstName,
      required this.middleName,
      required this.address});

  factory Customer.fromJson(Map<String, dynamic> json) {
    Customer customer = Customer(
      lastName: json['last_name'],
      address: json['address'].toString().replaceAll('\n', ' '),
      firstName: json['first_name'],
      id: json['id'],
      middleName: json['middle_name'],
    );
    return customer;
  }
}
