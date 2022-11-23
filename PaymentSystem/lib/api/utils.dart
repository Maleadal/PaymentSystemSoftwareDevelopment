import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sd_paymentsystem/api/models/admin.dart';

String url = 'localhost:3000';
String apiKey = '4ce6ac3d-326e-4643-8793-b6604ed45be5';
final headers = {'Content-Type': 'application/json'};
Future<Admin?> getAdmin() async {
  debugPrint("Getting admin");
  try {
    var response = await http.post(Uri.http(url, 'api/admin'),
        body: jsonEncode({"key": apiKey}), headers: headers);
    var jsonBody = jsonDecode(response.body);
    return Admin.fromJson(jsonBody);
    return null;
  } catch (err) {
    debugPrint(err.toString());
    return null;
  }
}
