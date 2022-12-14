// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:university_project/auth/login.dart';
import 'package:university_project/auth/createuseraccount.dart';
import 'package:university_project/auth/expertprofile.dart';
import 'package:university_project/project_content/homepage.dart';
import 'package:university_project/auth/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      routes: {
        "welcome": (context) => Welcome(),
        "login": (context) => Login(),
        "create_user_account": (context) => CreateUserAccount(),
        "expert_profile": (context) => ExpertProfile(),
        "home_page": (context) => HomePage()
      },
    );
  }
}
