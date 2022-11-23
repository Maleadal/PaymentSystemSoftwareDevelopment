import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/globals.dart';

import '../widgets/utils.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DasboardViewState();
}

class _DasboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("D A S H B O A R D"),
          centerTitle: true,
        ),
        body: Row(
          children: [
            // * Drawer
            drawer("Dashboard", context),

            // * Main Data
            // TODO: Go make a database and populate it with dummy data to be able to test the app
            // TODO: Make a System to record the count and show it as a summary to the user
          ],
        ));
  }
}
