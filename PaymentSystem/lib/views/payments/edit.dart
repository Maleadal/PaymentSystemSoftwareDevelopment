import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/utils.dart';
import 'package:sd_paymentsystem/widgets/utils.dart';

import '../../api/models/payment.dart';
import '../../globals.dart';

class EditPaymentView extends StatefulWidget {
  final Payment payment;
  const EditPaymentView({super.key, required this.payment});

  @override
  State<EditPaymentView> createState() => _EditPaymentViewState();
}

class _EditPaymentViewState extends State<EditPaymentView> {
  late TextEditingController _name;
  late TextEditingController _value;

  @override
  void initState() {
    _name = TextEditingController();
    _value = TextEditingController();
    _name.text = widget.payment.name;
    _value.text = widget.payment.value.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Payment - ${widget.payment.name}"),
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
        Text("Editing Payment Information of ${widget.payment.name}"),
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
              Payment payment = Payment(
                  id: widget.payment.id,
                  name: _name.text,
                  value: int.parse(_value.text));

              await editPayment(payment);
              var temp = await getPayments();
              setState(() {
                showError("Successfully edited", context);
                payments = temp!;
              });
            },
            child: const Text("Done"))
      ]),
    );
  }
}
