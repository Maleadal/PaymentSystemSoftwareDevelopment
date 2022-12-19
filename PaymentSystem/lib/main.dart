import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/views/customers/add.dart';
import 'package:sd_paymentsystem/views/customers/edit.dart';
import 'package:sd_paymentsystem/views/customers/list.dart';
import 'package:sd_paymentsystem/views/dashboard_view.dart';
import 'views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const LoginView(),
      routes: {
        '/dashboard_view/': (context) => const DashboardView(),
        '/login_view/': (context) => const LoginView(),
        '/customer_list_view/': (context) => const CustomerListView(),
        '/add_customer_view/': (context) => const AddCustomerView(),
      },
    );
  }
}
