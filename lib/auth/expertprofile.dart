// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExpertProfile extends StatefulWidget {
  const ExpertProfile({super.key});

  @override
  State<ExpertProfile> createState() => _ExpertProfileState();
}

class _ExpertProfileState extends State<ExpertProfile> {
  var firstName;
  var familyName;
  var experinces;
  var adress;
  var phoneNumber;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    send() {
      var formdata = formState.currentState;

      if (formdata!.validate()) {
        formdata.save();
        //print("valid");
      } else {
        //print("not valid");
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Expert Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // ignore: prefer_const_literals_to_create_immutables
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: Form(
              key: formState,
              child: Column(
                children: [
                  //Image.network(src)
                  TextFormField(
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
                  SizedBox(height: 20),
                  TextFormField(
                    //الكنية
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
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //الخبرات
                    validator: (text) {
                      if (text!.length < 2) {
                        return "Enter Your Experinces";
                      }
                      return null;
                    },
                    onSaved: (text) {
                      experinces = text;
                    },

                    maxLength: 100,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Experinces",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //العنوان
                    validator: (text) {
                      if (text!.length < 2) {
                        return "Enter Your Address";
                      }
                      return null;
                    },
                    onSaved: (text) {
                      adress = text;
                    },

                    maxLength: 20,
                    decoration: InputDecoration(
                        hintText: "Adress",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //رقم الهاتف
                    validator: (text) {
                      if (text!.length < 2) {
                        return "Enter Your Phone Number";
                      }
                      return null;
                    },
                    onSaved: (text) {
                      phoneNumber = text;
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 20,
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3))),
                  ),
                  SizedBox(height: 20),
                  //Checkbox(value: value, onChanged: onChanged)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
