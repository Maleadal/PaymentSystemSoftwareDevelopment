import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/models/payment.dart';

import 'api/models/admin.dart';
import 'api/models/customer.dart';
import 'api/models/record.dart';

bool isLoggedIn = false;
late Admin admin;
List<Customer> customers = [];
List<Customer> tempCustomers = [];
List<Payment> payments = [];
List<Record> records = [];
