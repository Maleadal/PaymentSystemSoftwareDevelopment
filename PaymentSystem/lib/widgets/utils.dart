import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:sd_paymentsystem/globals.dart';

void showError(String errorMessage, BuildContext context, {int? duration}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(errorMessage),
    duration: Duration(seconds: duration ?? 2),
  ));
}

String hash(String str) {
  return sha256.convert(utf8.encode(str)).toString();
}

Drawer drawer(String location, BuildContext context) {
  return Drawer(
    child: Column(children: [
      IconButton(
        icon: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(30),
        onPressed: () {},
      ),
      ListTile(
        tileColor: location == "Dashboard" ? Colors.grey[700] : null,
        onTap: () {},
        leading: const Icon(Icons.home, color: Colors.white),
        title: const Text("D A S H B O A R D"),
      ),
      ListTile(
        onTap: () {},
        tileColor: location == "Settings" ? Colors.grey[700] : null,
        leading: const Icon(Icons.settings, color: Colors.white),
        title: const Text("S E T T I N G S"),
      ),
      ListTile(
        onTap: () {
          isLoggedIn = false;
          if (showDialog("Are you sure you want to log out?", context)) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login_view/', (route) => false);
            showError("Log out successful!", context);
          } else {
            showError("Log out cancelled!", context);
          }
        },
        leading: const Icon(Icons.logout, color: Colors.white),
        title: const Text("L O G O U T"),
      )
    ]),
  );
}

bool showDialog(String prompt, BuildContext context) {
  bool val = false;
  AlertDialog(
    title: Text(prompt),
    actions: [
      TextButton(
          onPressed: () {
            val = false;
          },
          child: const Text("No")),
      TextButton(
          onPressed: () {
            val = true;
          },
          child: const Text("Yes")),
    ],
  );

  return val;
}
