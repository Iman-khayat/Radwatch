import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// final usernameController = TextEditingController();
// final passwordController = TextEditingController();

// get http => null;

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    void getToken() async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      print(token);
    }

    void saveToken(String responseBody) async {
      final decodedBody = json.decode(responseBody);
      final refresh_token = decodedBody["refresh_token"];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', refresh_token);
    }

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
                      Uri.parse('http://cash.pythonanywhere.com/user/login');
                  var body = {
                    "username": "example",
                    "password": "example",
                    "hashedData": "sigridkeyeasteregg",
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
                    saveToken(response.body);
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    getToken();
                  } catch (e) {
                    print('Error: $e');
                  }

                  // Navigator.pushNamed(context, '/radoninfo');
                },
                child: Text(
                  "log In",
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

  // Future<Login> fetchLogin() async {
  //   final response = await http.post(
  //       Uri.encodeFull('http://cash.pythonanywhere.com/user/login') as Uri,
  //       headers: {
  //         'Content-Type': 'application/json'
  //       },
  //       body: {
  //         "username": "example",
  //         "password": "example",
  //         "hashedData": "hash"
  //       });

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response, then parse the JSON.
  //     return Login.fromJson(json.decode(response.body));
  //     print("User login successful");
  //   } else {
  //     // If the server did not return a 200 OK response, then throw an exception.
  //     throw Exception('User or Password was incorrect.');
  //   }
  // }
}
