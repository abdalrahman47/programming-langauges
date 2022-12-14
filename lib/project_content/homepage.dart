// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("username") //this need to change
              ,
              accountEmail: Text("email")), //this needs to change
          ListTile(
            title: Text("Expert Profile"),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.of(context).pushNamed("expert_profile");
            },
          ),
          ListTile(
            title: Text("Log Out"),
            textColor: Colors.red,
            iconColor: Colors.red,
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("welcome");
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Text("home page"),
    );
  }
}
