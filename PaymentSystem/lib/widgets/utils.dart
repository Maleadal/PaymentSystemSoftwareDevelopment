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
        onTap: () {
          isLoggedIn = false;
          showPrompt("Are you sure you want to log out?", context);
        },
        leading: const Icon(Icons.logout, color: Colors.white),
        title: const Text("L O G O U T"),
      )
    ]),
  );
}

void showPrompt(String prompt, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(prompt),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No")),
            TextButton(
                onPressed: () {
                  isLoggedIn = false;
                  showError("Logged Out", context);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login_view/',
                    (route) => false,
                  );
                },
                child: const Text("Yes")),
          ],
        );
      });
}
