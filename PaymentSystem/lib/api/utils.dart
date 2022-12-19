import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sd_paymentsystem/api/models/admin.dart';
import 'package:sd_paymentsystem/api/models/payment.dart';
import 'package:sd_paymentsystem/api/models/record.dart';

import '../globals.dart';
import 'models/customer.dart';

String url = 'localhost:3000';
String apiKey = '4ce6ac3d-326e-4643-8793-b6604ed45be5';
final headers = {'Content-Type': 'application/json'};
Future<Admin?> getAdmin() async {
  try {
    var response = await http.post(Uri.http(url, 'api/admin'),
        body: jsonEncode({"key": apiKey}), headers: headers);
    var jsonBody = jsonDecode(response.body);
    return Admin.fromJson(jsonBody);
  } catch (err) {
    debugPrint(err.toString());
    return null;
  }
}

Future<List<Customer>?> getCustomers(Admin admin) async {
  try {
    var response = await http.post(Uri.http(url, 'api/customer'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password
        }),
        headers: headers);
    var jsonBody = jsonDecode(response.body);
    List<Customer> customers = [];
    for (var customer in jsonBody) {
      Customer c = Customer.fromJson(customer);
      customers.add(c);
    }

    return customers;
  } catch (err) {
    debugPrint(err.toString());
    return null;
  }
}

Future deleteCustomer(int id) async {
  try {
    var response = await http.post(Uri.http(url, 'api/customer/delete'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "id": id
        }),
        headers: headers);

    debugPrint(response.body);
  } catch (err) {
    debugPrint(err.toString());
  }
}

Future editCustomer(Customer customer) async {
  try {
    await http.post(Uri.http(url, 'api/customer/edit'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "id": customer.id,
          "first_name": customer.firstName,
          "middle_name": customer.middleName,
          "last_name": customer.lastName,
          "address": customer.address
        }),
        headers: headers);
  } catch (err) {
    debugPrint(err.toString());
  }
}

Future addCustomer(String firstName, String middleName, String lastName,
    String address) async {
  try {
    await http.post(Uri.http(url, 'api/customer/add'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "first_name": firstName,
          "middle_name": middleName,
          "last_name": lastName,
          "address": address
        }),
        headers: headers);
  } catch (err) {
    debugPrint(err.toString());
  }
}

Future<List<Record>?> getRecords() async {
  try {
    var response = await http.post(Uri.http(url, 'api/record'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password
        }),
        headers: headers);
    var jsonBody = jsonDecode(response.body);
    List<Record> records = [];
    for (var record in jsonBody) {
      records.add(Record.fromJson(record));
    }

    return records;
  } catch (err) {
    debugPrint(err.toString());
    return null;
  }
}

Future<List<Payment>?> getPayments() async {
  try {
    var response = await http.post(Uri.http(url, 'api/payment'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password
        }),
        headers: headers);
    var jsonBody = jsonDecode(response.body);
    List<Payment> payments = [];
    for (var payment in jsonBody) {
      payments.add(Payment.fromJson(payment));
    }

    return payments;
  } catch (err) {
    debugPrint(err.toString());
    return null;
  }
}

Future deleteRecord(int customerID, int paymentID) async {
  try {
    var response = await http.post(Uri.http(url, 'api/record/delete'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "customer_id": customerID,
          "payment_id": paymentID
        }),
        headers: headers);

    debugPrint(response.body);
  } catch (err) {
    debugPrint(err.toString());
  }
}

Future deletePayment(int id) async {
  try {
    var response = await http.post(Uri.http(url, 'api/payment/delete'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "id": id
        }),
        headers: headers);

    debugPrint(response.body);
  } catch (err) {
    debugPrint(err.toString());
  }
}

Future addRecord(int customerID, int paymentID) async {
  try {
    await http.post(Uri.http(url, 'api/record/add'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "customer_id": customerID,
          "payment_id": paymentID,
        }),
        headers: headers);
  } catch (err) {
    debugPrint(err.toString());
  }
}

Future addPayment(String name, int value) async {
  try {
    await http.post(Uri.http(url, 'api/payment/add'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "name": name,
          "value": value
        }),
        headers: headers);
  } catch (err) {
    debugPrint(err.toString());
  }
}

Future editPayment(Payment payment) async {
  try {
    await http.post(Uri.http(url, 'api/payment/edit'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "id": payment.id,
          "name": payment.name,
          "value": payment.value
        }),
        headers: headers);
  } catch (err) {
    debugPrint(err.toString());
  }
}

Future<Record?> getRecord(int customerID, int paymentID) async {
  try {
    var response = await http.post(Uri.http(url, 'api/record/find'),
        body: jsonEncode({
          "key": apiKey,
          "user": admin.username,
          "password": admin.password,
          "customer_id": customerID,
          "payment_id": paymentID
        }),
        headers: headers);
    var jsonBody = jsonDecode(response.body);
    return Record.fromJson(jsonBody[0]);
  } catch (err) {
    debugPrint(err.toString());
    return null;
  }
}
