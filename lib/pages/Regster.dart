import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// final usernameController = TextEditingController();
// final passwordController = TextEditingController();

// get http => null;

class Regster extends StatelessWidget {
  const Regster({super.key});

  @override
  Widget build(BuildContext context) {
    // final futureLogin = fetchLogin();
    // Color.fromARGB(255, 3, 37, 13)
    return Scaffold(
      // backgroundColor: ,
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Radwatch",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          actions: [
            IconButton(icon: const Icon(Icons.person), onPressed: () {}),
            IconButton(icon: const Icon(Icons.close), onPressed: () async {})
          ]),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.indigo[900],
                width: 600,
                child: const Image(
                  image: AssetImage('assets/images/logo.png'),
                  alignment: Alignment.topCenter,
                  // color: Colors.amber,
                  height: 500,
                  width: 500,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 22.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(22)),
                width: 300,
                child: TextField(
                  // controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email : ",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 22.0, bottom: 22.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(22)),
                width: 300,
                child: TextField(
                  obscureText: true,
                  // controller: passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password : ",
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // _login(authController);
                  var url =
                      Uri.parse('http://cash.pythonanywhere.com/user/register');
                  var body = {
                    "username": "example2",
                    "password": "example2",
                    "email": "example@example2.com"
                  };
                  var headers = {
                    "Content-Type": "application/json",
                  };

                  try {
                    var response = await http.post(
                      url,
                      headers: headers,
                      body: jsonEncode(body),
                    );

                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                  } catch (e) {
                    print('Error: $e');
                  }

                  // Navigator.pushNamed(context, '/radoninfo');
                },
                child: Text(
                  "Sgin Up",
                  style: TextStyle(fontSize: 25),
                ),
                style: ButtonStyle(
                  alignment: Alignment.bottomCenter,
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
