import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/models/customer.dart';
import 'package:sd_paymentsystem/api/utils.dart';
import 'package:sd_paymentsystem/views/customers/edit.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_customer_view/');
                },
                icon: const Icon(
                  Icons.add,
                  size: 40,
                )),
          )
        ],
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
                  onChanged: (value) async {
                    var temp = (await getCustomers(admin))!;
                    setState(() {
                      customers = temp;
                    });

                    setState(() {
                      customers = customers
                          .where((element) =>
                              element.firstName
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              element.lastName
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  var temp = (await getCustomers(admin))!;
                  setState(() {
                    _search.text = "";
                    customers = temp;
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
                        Customer customer = customers[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditCustomerView(customer: customer)));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        int id = customers[index].id;
                        await deleteCustomer(id);
                        var temp = await getCustomers(admin);
                        setState(() {
                          customers = temp!;
                        });
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
