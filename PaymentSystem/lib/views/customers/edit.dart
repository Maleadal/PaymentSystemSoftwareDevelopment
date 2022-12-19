import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/models/customer.dart';
import 'package:sd_paymentsystem/api/utils.dart';
import 'package:sd_paymentsystem/widgets/utils.dart';

import '../../globals.dart';

class EditCustomerView extends StatefulWidget {
  final Customer customer;
  const EditCustomerView({super.key, required this.customer});

  @override
  State<EditCustomerView> createState() => _EditCustomerViewState();
}

class _EditCustomerViewState extends State<EditCustomerView> {
  late TextEditingController _firstName;
  late TextEditingController _middleName;
  late TextEditingController _lastName;
  late TextEditingController _address;

  @override
  void initState() {
    _firstName = TextEditingController();
    _middleName = TextEditingController();
    _lastName = TextEditingController();
    _address = TextEditingController();

    _firstName.text = widget.customer.firstName;
    _middleName.text = widget.customer.middleName;
    _lastName.text = widget.customer.lastName;
    _address.text = widget.customer.address;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Edit Customer - ${widget.customer.firstName} ${widget.customer.middleName}. ${widget.customer.lastName}"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/customer_list_view/');
          },
        ),
      ),
      body: Column(children: [
        Text(
            "Editing Customer Information of ${widget.customer.firstName} ${widget.customer.middleName}. ${widget.customer.lastName}"),
        SizedBox(
          width: width * 0.3,
          child: TextField(
            controller: _firstName,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "First Name"),
          ),
        ),
        SizedBox(
          width: width * 0.3,
          child: TextField(
            controller: _middleName,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "Middle Initial"),
          ),
        ),
        SizedBox(
          width: width * 0.3,
          child: TextField(
            controller: _lastName,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "Last Name"),
          ),
        ),
        SizedBox(
          width: width * 0.3,
          child: TextField(
            controller: _address,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "Address"),
          ),
        ),
        OutlinedButton(
            onPressed: () async {
              Customer customer = Customer(
                  id: widget.customer.id,
                  lastName: _lastName.text,
                  firstName: _firstName.text,
                  middleName: _middleName.text,
                  address: _address.text);

              await editCustomer(customer);
              var temp = await getCustomers(admin);
              setState(() {
                showError("Successfully added", context);
                customers = temp!;
              });
            },
            child: const Text("Done"))
      ]),
    );
  }
}
