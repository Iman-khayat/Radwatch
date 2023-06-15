import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 3, 37, 13),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("object");
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 24, color: Color.fromARGB(255, 3, 37, 13)),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber[100]),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 79, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("object");
                      Navigator.pushNamed(context, '/Regster');
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 22, color: Color.fromARGB(255, 3, 37, 13)),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber[100]),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 65, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22))),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(top: 4, child: Image.asset("assets/images/top.png")),
            Positioned(bottom: 0,child: Image.asset("assets/images/buttom.png",width: 333,)),
          ],
        ),
      ),
    ));
  }
}
