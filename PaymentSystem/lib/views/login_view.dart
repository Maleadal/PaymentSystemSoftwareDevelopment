import 'package:flutter/material.dart';
import 'package:sd_paymentsystem/api/models/admin.dart';
import 'package:sd_paymentsystem/api/utils.dart';
import 'package:sd_paymentsystem/globals.dart';
import 'package:sd_paymentsystem/widgets/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _username;
  late TextEditingController _password;

  @override
  void initState() {
    setAsyncVariables();
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  void setAsyncVariables() async {
    admin = (await getAdmin())!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Column(children: [
        Center(
            child: SizedBox(
          width: width * 0.3,
          height: height * 0.4,
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                controller: _username,
                decoration: const InputDecoration(hintText: "Username"),
              ),
              TextField(
                controller: _password,
                textAlign: TextAlign.center,
                obscureText: true,
                autocorrect: false,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              OutlinedButton(
                  onPressed: () {
                    String enteredUsername = _username.text;
                    String enteredPassword = hash(_password.text);
                    Admin credentials = admin;
                    if (enteredUsername == credentials.username &&
                        enteredPassword == credentials.password) {
                      showError("Success!", context, duration: 1);
                      isLoggedIn = true;
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/dashboard_view/', (route) => false);
                    } else {
                      // * Show errors
                      if (_username.text.isEmpty || _password.text.isEmpty) {
                        showError(
                            '${_username.text.isEmpty && _password.text.isEmpty ? "Username and Password" : _username.text.isEmpty ? "Username" : _password.text.isEmpty ? "Password" : ''} is empty',
                            context);
                      } else {
                        showError(
                            "Username and Password are incorrect", context);
                      }
                      _username.text = '';
                      _password.text = '';
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ))
      ]),
    );
  }
}
