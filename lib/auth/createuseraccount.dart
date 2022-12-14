// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateUserAccount extends StatefulWidget {
  const CreateUserAccount({super.key});

  @override
  State<CreateUserAccount> createState() => _CreateUserAccountState();
}

class _CreateUserAccountState extends State<CreateUserAccount> {
  var firstName;
  var familyName;
  var email;
  var password;
  var confirm;
  var day;
  var month;
  var year;
  var gender;
  List days = [
    "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31"
  ];
  List months = [
    "januray",
    "febreuary",
  ];

  addPosts() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var respone = await http.post(Uri.parse(url), body: {});
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    send() {
      var formdata = formState.currentState;
      Navigator.of(context).pushNamed("home_page");
      if (formdata!.validate()) {
        formdata.save();
        //print("valid");
      } else {
        //print("not valid");
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Account",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: Form(
                  key: formState,
                  child: Column(
                    children: [
                      Row(
                          //لوضع الاسم و اسم العائلة
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 160,
                              child: TextFormField(
                                //الاسم
                                validator: (text) {
                                  if (text!.length < 2) {
                                    return "Enter Your First Name";
                                  }
                                  return null;
                                },
                                onSaved: (text) {
                                  firstName = text;
                                },
                                keyboardType: TextInputType.name,
                                maxLength: 20,
                                decoration: InputDecoration(
                                    hintText: "First Name",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 3))),
                              ),
                            ),
                            SizedBox(width: 40),
                            SizedBox(
                                width: 160,
                                child: TextFormField(
                                  // الكنية
                                  validator: (text) {
                                    if (text!.length < 2) {
                                      return "Enter Your Family Name";
                                    }
                                    return null;
                                  },
                                  onSaved: (text) {
                                    familyName = text;
                                  },
                                  keyboardType: TextInputType.name,
                                  maxLength: 20,
                                  decoration: InputDecoration(
                                      hintText: "Family Name",
                                      labelStyle: TextStyle(fontSize: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3))),
                                ))
                          ]),
                      SizedBox(height: 20),
                      TextFormField(
                        // الايميل
                        validator: (text) {
                          if (text!.length < 2) {
                            //this need to change
                            return "Enter Your Email";
                          }
                          return null;
                        },
                        onSaved: (text) {
                          email = text;
                        },
                        decoration: InputDecoration(
                            hintText: "email",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3))),
                      ),
                      SizedBox(height: 20),
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
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3))),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // تاكيد كلمة السر

                        validator: (text) {
                          if (password != text) {
                            return "Password  doesnt match";
                          }
                          return null;
                        },
                        onSaved: (text) {
                          confirm = text;
                        },
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "use 6 or more charachters",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Birth Day",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                            ),
                            width: 110,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              isExpanded: true,
                              //hint: Text("day"),
                              items: ["usa", "uae", "sa"] //need to change
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  day = val!;
                                });
                              },
                              value: day,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                            ),
                            width: 100,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("month"),
                              items: ["usa", "uae", "sa"] //need to change
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  month = val!;
                                });
                              },
                              value: month,
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                            ),
                            width: 100,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("year"),
                              items: ["usa", "uae", "sa"] //need to change
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  year = val!;
                                });
                              },
                              value: year,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Gender",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                            ),
                            width: 150,
                            child: RadioListTile(
                                title: Text("male"),
                                value: "male",
                                groupValue: gender,
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                  });
                                }),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                            ),
                            width: 150,
                            child: RadioListTile(
                                title: Text("female"),
                                value: "femal",
                                groupValue: gender,
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // ignore: prefer_const_literals_to_create_immutables
                      Row(children: [
                        Text("if you have account "),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("login");
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
