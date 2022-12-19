import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/utils.dart';
import 'package:sd_paymentsystem/views/payments/edit.dart';

import '../../api/models/payment.dart';
import '../../globals.dart';

class RecordListView extends StatefulWidget {
  final Payment payment;
  const RecordListView({super.key, required this.payment});

  @override
  State<RecordListView> createState() => _RecordListViewState();
}

class _RecordListViewState extends State<RecordListView> {
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
        title: const Text("Record List"),
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
                  await getRecords().then((value) {
                    setState(() {
                      _search.text = "";
                      records = value!;
                    });
                  });

                  await getCustomers(admin).then((value) {
                    setState(() {
                      customers = value!;
                    });
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
                  subtitle: Text(
                      "Payment Status: ${records.where((element) => element.paymentID == widget.payment.id && element.customerID == customers[index].id).isEmpty ? "Pending" : "Paid"}"),
                  trailing: Wrap(spacing: 12, children: [
                    IconButton(
                      icon: Icon(records
                              .where(
                                (element) =>
                                    element.paymentID == widget.payment.id &&
                                    element.customerID == customers[index].id,
                              )
                              .isEmpty
                          ? Icons.check_box_outline_blank
                          : Icons.check_box),
                      onPressed: () async {
                        if (records
                            .where((element) =>
                                element.paymentID == widget.payment.id &&
                                element.customerID == customers[index].id)
                            .isEmpty) {
                          await addRecord(
                              customers[index].id, widget.payment.id);
                        } else {
                          await deleteRecord(
                              customers[index].id, widget.payment.id);
                        }
                        await getRecords().then((value) {
                          setState(() {
                            records = value!;
                          });
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
