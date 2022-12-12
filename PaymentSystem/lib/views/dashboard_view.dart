import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/globals.dart';

import '../api/utils.dart';
import '../widgets/utils.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DasboardViewState();
}

class _DasboardViewState extends State<DashboardView> {
  @override
  void initState() {
    setAsyncVariables();
    super.initState();
  }

  void setAsyncVariables() async {
    customers = (await getCustomers(admin))!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("D A S H B O A R D"),
          centerTitle: true,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Drawer
            drawer("Dashboard", context),
            // * Options
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                width: width * 0.65,
                height: height * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Options",
                      style: TextStyle(fontSize: 20),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('/customer_list_view/');
                      },
                      title: Row(
                        children: const [
                          Icon(Icons.arrow_right),
                          Text("Customers"),
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Row(
                        children: const [
                          Icon(Icons.arrow_right),
                          Text("Records"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
