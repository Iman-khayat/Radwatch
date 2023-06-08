import 'dart:ffi';

import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Int id;
  final Double radon_value;
  final Double temp_value_in;
  final Double temp_value_out;
  final Double hum_value_in;
  final Double hum_value_out;
  Card(
      {required this.id,
      required this.radon_value,
      required this.temp_value_in,
      required this.temp_value_out,
      required this.hum_value_in,
      required this.hum_value_out});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                id as String,
                style: TextStyle(fontSize: 19),
              ),
            ),
          )
        ],
      ),
    );
  }
}
