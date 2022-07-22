import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final double heigh ;
  final int weidth ;
  final int age ;
  result({
    required this.heigh,
    required this.weidth,
    required this.age,

  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Text(
            'heigh : ${heigh.round()}',
            style: TextStyle(
              fontSize: 20.0
            ),
          ),
          Text(
            'weidth :$weidth',
            style: TextStyle(
              fontSize: 20.0
            ),
          ),

          Text(
            'Age :$age',
            style: TextStyle(
              fontSize: 20.0
            ),
          ),
        ],
      ),
    );
  }
}
