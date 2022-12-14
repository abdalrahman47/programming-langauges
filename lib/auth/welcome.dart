// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                child: Text(
                  "to create user account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("create_user_account");
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                child: Text("create User account")),
            SizedBox(height: 100),
            SizedBox(
                width: double.infinity,
                child: Text(
                  "to create expert account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("create_user_account");
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                child: Text("Ceate Expert account")),
          ],
        ),
      ),
    );
  }
}
