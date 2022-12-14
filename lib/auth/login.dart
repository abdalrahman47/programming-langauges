// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email;
  var password;
  addPosts() async {
    var url = "https://jsonplaceholder.typicode.com/posts"; //url from backend
    var respone = await http.post(Uri.parse(url), body: {});
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    send() {
      var formdata = formState.currentState;
      if (formdata!.validate()) {
        formdata.save();
        Navigator.of(context).pushNamed("home_page");
        //print("valid");
      } else {
        //print("not valid");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("welcome");
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: Form(
              key: formState,
              child: Column(children: [
                TextFormField(
                  //الايميل
                  validator: (text) {
                    if (text!.length < 2) {
                      return "Change Your email";
                    }
                    return null;
                  },
                  onSaved: (text) {
                    email = text;
                  },
                  decoration: InputDecoration(
                      hintText: "email",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 3))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // كلمة السر

                  validator: (text) {
                    if (text!.length < 6) {
                      return "Password is Too Short";
                    }
                    return null;
                  },
                  onSaved: (text) {
                    password = text;
                  },
                  decoration: InputDecoration(
                      hintText: "Password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 3))),
                ),
                // ignore: prefer_const_literals_to_create_immutables
                Row(children: [
                  Text("if you dont have an account "),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("create_user_account");
                      },
                      child: Text(
                        "click here",
                        style: TextStyle(color: Colors.blue),
                      ))
                ]),
                SizedBox(height: 10),
                ElevatedButton.icon(
                    onPressed: () {
                      send();
                    },
                    icon: Icon(Icons.person),
                    label: Text("create account"),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15))),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
