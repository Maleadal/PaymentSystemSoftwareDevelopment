import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/utils.dart';
import 'package:sd_paymentsystem/views/payments/edit.dart';
import 'package:sd_paymentsystem/views/records/list.dart';

import '../../globals.dart';

class PaymentListView extends StatefulWidget {
  const PaymentListView({super.key});

  @override
  State<PaymentListView> createState() => _PaymentListViewState();
}

class _PaymentListViewState extends State<PaymentListView> {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_payment_view/');
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
                    var temp = (await getPayments())!;
                    setState(() {
                      payments = temp;
                    });

                    setState(() {
                      payments = payments
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  var temp = (await getPayments())!;
                  setState(() {
                    _search.text = "";
                    payments = temp;
                  });
                },
                child: const Text("Clear"),
              ),
            ],
          ),

          // ! This is the list of payments
          SizedBox(
            width: width * 0.7,
            height: height * 0.8,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            RecordListView(payment: payments[index])));
                  },
                  title: Text(payments[index].name),
                  subtitle: Text("Payment value: P${payments[index].value}"),
                  trailing: Wrap(spacing: 12, children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditPaymentView(payment: payments[index])));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        int id = payments[index].id;
                        await deletePayment(id);
                        var temp = await getPayments();
                        setState(() {
                          payments = temp!;
                        });
                      },
                    ),
                  ]),
                );
              },
              itemCount: payments.length,
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}
