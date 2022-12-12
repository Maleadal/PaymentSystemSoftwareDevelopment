import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sd_paymentsystem/api/models/admin.dart';

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

// TODO: Make a delete method in api and this
Future deleteCustomer(int id) async {}

// TODO: Make an edit method in api and this
Future editCustomer(int id) async {}
