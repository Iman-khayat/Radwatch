import 'package:flutter/material.dart';
import 'package:newpro/pages/Register.dart';

import 'pages/graph.dart';
import 'pages/login.dart';
import 'pages/radoninfo.dart';
 import 'pages/welcome.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/login",
      routes: {
        "/": (context) => const Welcome(),
         "/login": (context) => login(),
        "/radoninfo": (context) => const Radoninfo(),
        "/graph": (context) => const graph(),
        "/Regster": (context) => const Register(),
      },
    );
  }
}
