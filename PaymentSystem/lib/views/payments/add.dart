import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/utils.dart';
import 'package:sd_paymentsystem/widgets/utils.dart';

import '../../globals.dart';

class AddPaymentView extends StatefulWidget {
  const AddPaymentView({super.key});

  @override
  State<AddPaymentView> createState() => _AddPaymentViewState();
}

class _AddPaymentViewState extends State<AddPaymentView> {
  late TextEditingController _name;
  late TextEditingController _value;

  @override
  void initState() {
    _name = TextEditingController();
    _value = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Payment"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/payment_list_view/');
          },
        ),
      ),
      body: Column(children: [
        const Text("Enter Payment Information"),
        SizedBox(
          width: width * 0.3,
          child: TextField(
            controller: _name,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "Payment Name"),
          ),
        ),
        SizedBox(
          width: width * 0.3,
          child: TextField(
            controller: _value,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "Payment Value"),
          ),
        ),
        OutlinedButton(
            onPressed: () async {
              await addPayment(_name.text, int.parse(_value.text));
              var temp = await getPayments();
              setState(() {
                showError("Successfully added", context);
                payments = temp!;
              });
            },
            child: const Text("Done"))
      ]),
    );
  }
}
