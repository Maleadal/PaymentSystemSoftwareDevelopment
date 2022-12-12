import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/models/customer.dart';

import '../../globals.dart';

class CustomerListView extends StatefulWidget {
  const CustomerListView({super.key});

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<CustomerListView> {
  late TextEditingController _search;

  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer List"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Search Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Search"),
                  controller: _search,
                  onChanged: (value) {},
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _search.text = "";
                  });
                },
                child: const Text("Clear"),
              ),
            ],
          ),

          // ! This is the list of customers
          SizedBox(
            width: width * 0.7,
            height: height * 0.8,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  title: Text(
                      "${customers[index].firstName} ${customers[index].middleName}. ${customers[index].lastName}"),
                  subtitle: Text(customers[index].address),
                  trailing: Wrap(spacing: 12, children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        int id = customers[index].id;
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        int id = customers[index].id;
                      },
                    ),
                  ]),
                );
              },
              itemCount: customers.length,
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}
