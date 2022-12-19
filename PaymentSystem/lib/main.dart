import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/views/customers/add.dart';
import 'package:sd_paymentsystem/views/customers/list.dart';
import 'package:sd_paymentsystem/views/dashboard_view.dart';
import 'package:sd_paymentsystem/views/payments/add.dart';
import 'package:sd_paymentsystem/views/payments/list.dart';
import 'globals.dart';
import 'views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoginView(),
      routes: {
        '/dashboard_view/': (context) => const DashboardView(),
        '/login_view/': (context) => const LoginView(),
        '/customer_list_view/': (context) => const CustomerListView(),
        '/add_customer_view/': (context) => const AddCustomerView(),
        '/payment_list_view/': (context) => const PaymentListView(),
        '/add_payment_view/': (context) => const AddPaymentView(),
      },
    );
  }
}
