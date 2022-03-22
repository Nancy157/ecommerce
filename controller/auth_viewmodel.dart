import 'dart:convert';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/view/screens/homescreen.dart';
import 'package:ecommerce2/view/screens/view_auth/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var namecontroller = TextEditingController();
var phonecontroller = TextEditingController();
var emailcontroller = TextEditingController();
var passwordcontroller = TextEditingController();

Future<void> fetchlogin(
    String email, String password, BuildContext context) async {
  var url = Uri.parse("https://student.valuxapps.com/api/login");
  var response = await http.post(url, body: {
    'email': emailcontroller.text,
    'password': passwordcontroller.text,
  },
      // for change language
      headers: {
        'lang': 'ar',
      });
  var responseBody = jsonDecode(response.body);
  if (responseBody['status'] == true) {
    print(responseBody['message']);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
        (Route<dynamic> route) => false);
  } else {
    print(responseBody['message']);
   final snackBar= SnackBar(
      content: Text(
        responseBody['message'],
        style: const TextStyle(color: white, fontSize: 12),
      ),
      backgroundColor: primaryColorLight,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future<void> fetchregister(
    String email, String password, String name, String phone, BuildContext context) async {
  var url = Uri.parse("https://student.valuxapps.com/api/register");
  var response = await http.post(url, body: {
    'name': namecontroller.text,
    'phone': phonecontroller.text,
    'email': emailcontroller.text,
    'password': passwordcontroller.text,
  },
      // for change language
      headers: {
        'lang': 'ar',
      });
  var responseBody = jsonDecode(response.body);
  if (responseBody['status'] == true) {
    print(responseBody['message']);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        (route) => false);
  } else {
    print(responseBody['message']);
  final snackBar=SnackBar(
      content: Text(
        responseBody['message'],
        style: const TextStyle(color: white, fontSize: 12),
      ),
      backgroundColor: primaryColorLight,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
