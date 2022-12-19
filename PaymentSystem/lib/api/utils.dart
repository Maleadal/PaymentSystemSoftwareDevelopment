import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sd_paymentsystem/api/models/admin.dart';

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
      customers.add(Customer.fromJson(customer));
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
