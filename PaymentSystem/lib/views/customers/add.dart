import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/utils.dart';
import 'package:sd_paymentsystem/widgets/utils.dart';

import '../../globals.dart';

class AddCustomerView extends StatefulWidget {
  const AddCustomerView({super.key});

  @override
  State<AddCustomerView> createState() => _AddCustomerViewState();
}

class _AddCustomerViewState extends State<AddCustomerView> {
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a Customer"),
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
        const Text("Personal Information"),
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
              await addCustomer(_firstName.text, _middleName.text,
                  _lastName.text, _address.text);
              await getCustomers(admin).then((value) {
                setState(() {
                  showError("Successfully added", context);
                  customers = value!;
                });
              });
            },
            child: const Text("Add"))
      ]),
    );
  }
}
